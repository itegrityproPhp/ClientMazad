<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Mail;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Country;
use App\Models\City;
use App\Models\Role;

use App\Models\EmailTemplate;
use App\Helpers\ImageHelper;
use App\Helpers\ApiHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;

class AdministrationController extends Controller{
   public function index(Request $request){
        $Roles              = Role::where('type','3')->get();
        $roles              = [];
        foreach ($Roles as $r_key => $r_value) {
            $roles[] = $r_value->id;
        }
        $Users = User::whereIn('role',$roles)->orderBy('id','desc')->get();

        foreach ($Users as $key => $value) {
            $value->profile_image=ImageHelper::getProfileImage($value->profile_image);
        }
        $data['Users']=$Users;
        return view('backend.administration.index')->with($data);
    }

    public function create(Request $request){
        $Countries          = Country::all()->pluck('country_name','id')->prepend('Select Country','');
        $Cities             = City::all()->pluck('city_name','id')->prepend('Select City','');
        $Roles             = Role::where('type','3')->get()->pluck('name','id')->prepend('Select Role','');
        $data['Roles']  = $Roles;
        $data['Countries']  = $Countries;
        $data['Cities']     = $Cities;
        return view('backend.administration.create')->with($data);
    }

    public function store(Request $request){
        $inputs   = $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'first_name'            => 'required',
            'second_name'           => 'required',
            'third_name'            => 'required',
            'surname_name'          => 'required',
            'email'                 => ['required', Rule::unique('users', 'email')],
            'country'               => 'required',
            'phone_number'          => ['required', Rule::unique('users', 'phone_number')],
            'city'                  => 'required',
            'date_of_birth'         => 'required',
        ];
        $messages = [
            'first_name.required'           => $Validation['first_name'],
            'second_name.required'          => $Validation['second_name'],
            'third_name.required'           => $Validation['third_name'],
            'surname_name.required'         => $Validation['surname_name'],
            'email.required'                => $Validation['email'],
            'email.unique'                  => $Validation['email_unique'],
            'phone_number.required'         => $Validation['phone_number'],
            'phone_number.unique'           => $Validation['phone_number_unique'],
            'phone_number.required'         => $Validation['phone_number'],
            'country.required'              => $Validation['country'],
            'city.required'                 => $Validation['city'],
            'date_of_birth.required'        => $Validation['date_of_birth'],
            
        ];
        $validator = Validator::make($inputs, $rules,$messages);
        if($validator->fails()) {
            $errors =  $validator->errors()->all();
            return response(['status' => false , 'status_code'=>'401', 'message' => $errors[0], 'data'=>(object)[], 'error'=>$errors[0]], 200);              
        }
        $User                       = new User();
        $User->role                 = $inputs['role'];
        $User->first_name           = $inputs['first_name'];
        $User->second_name          = $inputs['second_name'];
        $User->third_name           = $inputs['third_name'];
        $User->surname_name         = $inputs['surname_name'];
        $User->email                = $inputs['email'];
        $User->country_id           = $inputs['country'];
        $User->phone_number         = $inputs['phone_number'];
        $User->city_id              = $inputs['city'];
        $User->date_of_birth        = $inputs['date_of_birth'];
        if($User->save()){
            return response()->json(['status'=>true,'status_code'=>'200','message'=>$Messages['administration_add_success'],'data'=>$User,'error'=>[]], 200);
        }else{
            return response()->json(['status'=>false,'status_code'=>'200','message'=>$Messages['administration_add_error'],'data'=>(object)[],'error'=>[]], 200);
        }
    }

    public function edit(Request $request,$id){
        $User = User::find($id);
        $Countries          = Country::all()->pluck('country_name','id')->prepend('Select Country','');
        $Cities             = City::all()->pluck('city_name','id')->prepend('Select City','');
        $Roles             = Role::where('type','3')->get()->pluck('name','id')->prepend('Select Role','');
        if($User){
            $User->profile_image=ImageHelper::getProfileImage($User->profile_image);
        }
        $data['User']       = $User;
        $data['Countries']  = $Countries;
        $data['Cities']     = $Cities;
        $data['Roles']      = $Roles;
        return view('backend.administration.edit')->with($data);
    }
    public function update(Request $request,$id){
        $inputs   = $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'first_name'            => 'required',
            'second_name'           => 'required',
            'third_name'            => 'required',
            'surname_name'          => 'required',
            'email'                 => ['required', Rule::unique('users', 'email')->ignore($id, 'id')],
            'country'               => 'required',
            'phone_number'          => ['required', Rule::unique('users', 'phone_number')->ignore($id, 'id')],
            'city'                  => 'required',
            'date_of_birth'         => 'required',
        ];
        $messages = [
            'first_name.required'           => $Validation['first_name'],
            'second_name.required'          => $Validation['second_name'],
            'third_name.required'           => $Validation['third_name'],
            'surname_name.required'         => $Validation['surname_name'],
            'email.required'                => $Validation['email'],
            'email.unique'                  => $Validation['email_unique'],
            'phone_number.required'         => $Validation['phone_number'],
            'phone_number.unique'           => $Validation['phone_number_unique'],
            'phone_number.required'         => $Validation['phone_number'],
            'country.required'              => $Validation['country'],
            'city.required'                 => $Validation['city'],
            'date_of_birth.required'        => $Validation['date_of_birth'],
            
        ];
        $validator = Validator::make($inputs, $rules,$messages);
        if($validator->fails()) {
            $errors =  $validator->errors()->all();
            return response(['status' => false , 'status_code'=>'401', 'message' => $errors[0], 'data'=>(object)[], 'error'=>$errors[0]], 200);              
        }
        $User                       = User::find($id);
        $User->role                 = $inputs['role'];
        $User->first_name           = $inputs['first_name'];
        $User->second_name          = $inputs['second_name'];
        $User->third_name           = $inputs['third_name'];
        $User->surname_name         = $inputs['surname_name'];
        $User->email                = $inputs['email'];
        $User->country_id           = $inputs['country'];
        $User->phone_number         = $inputs['phone_number'];
        $User->city_id              = $inputs['city'];
        $User->date_of_birth        = $inputs['date_of_birth'];
        if($User->save()){
            return response()->json(['status'=>true,'status_code'=>'200','message'=>$Messages['administration_update_success'],'data'=>$User,'error'=>[]], 200);
        }else{
            return response()->json(['status'=>false,'status_code'=>'200','message'=>$Messages['administration_update_error'],'data'=>(object)[],'error'=>[]], 200);
        }
    }

    public function view(Request $request , $id){
        $inputs   = $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $User  = User::find($id);
        if($User){
            $User->profile_image=ImageHelper::getProfileImage($User->profile_image);
        }
        $data['User'] = $User;
        return view('backend.administration.view')->with($data);
    }

    public function administrationActivate(Request $request){
        $inputs =  $request->all();
        $inputs   = $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $User  = User::find($inputs['id']);
        if($inputs['status']=='1'){
            $User->status=$inputs['status'];
        }else{
            $User->status=$inputs['status'];
        }
        $User->save();
        if($User->save()){
            if($User->status=='1'){
                return response()->json(['status'=>true,'status_code'=>'200','message'=>$Messages['administration_activate_success'],'data'=>$User,'error'=>[]], 200);
            }else{
                return response()->json(['status'=>true,'status_code'=>'200','message'=>$Messages['administration_inactive_success'],'data'=>$User,'error'=>[]], 200);
            }    
        }else{
            return response(['status' => false , 'status_code'=>'401', 'message' => $Messages['record_not_found'], 'data'=>(object)[], 'error'=>[]], 200);
        }
    }

    public function getCity(Request $request){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $City = City::where('country_id',$inputs['country_id'])->get();
        if($City->toArray()){
            return response()->json(['status'=>true,'status_code'=>'200','message'=>$Messages['record_found'],'data'=>$City,'error'=>[]], 200);
        }else{
            return response(['status' => false , 'status_code'=>'401', 'message' => $Messages['record_not_found'], 'data'=>(object)[], 'error'=>[]], 200);
        }
    }

    public function destroy(Request $request,$id){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $User =  User::find($id);
        if($User){
            if($User->delete()){
                return ['status'=>'success', 'message'=>$Messages['administration_delete_success']];
            }else{
                return ['status'=>'failed','message'=>$Messages['administration_delete_error']];
            }
        }
    }
}