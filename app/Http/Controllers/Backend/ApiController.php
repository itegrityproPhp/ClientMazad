<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Api;
use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class ApiController extends Controller{
   public function index(Request $request){
        $Apis = Api::orderBy('id','desc')->get();
        $data['Apis']=$Apis;
        //die('ganesh');
        return view('backend.api.index')->with($data);
    }

    public function create(Request $request){
        $data = [];
        return view('backend.api.create')->with($data);
    }

    public function store(Request $request){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'title'             => 'required',
            'company_name'      => 'required',
            'description'       => 'required',
            'user_name'         => 'required',
            'password'          => 'required',
            'phone_number'      => 'required',
            'email'             => 'required',
        ];
        $messages = [
            'title.required'            => $Validation['title'],
            'company_name.required'     => $Validation['company_name'],
            'description.required'      => $Validation['description'],
            'user_name.required'        => $Validation['user_name'],
            'password.required'         => $Validation['password'],
            'phone_number.required'     => $Validation['phone_number'],
            'email.required'            => $Validation['email'],
        ];
        $this->validate($request,$rules,$messages);
        $Api                    = new Api();
        $Api->title             = $inputs['title'];
        $Api->company_name      = $inputs['company_name'];
        $Api->description       = $inputs['description'];
        $Api->user_name         = $inputs['user_name'];
        $Api->password          = $inputs['password'];
        $Api->phone_number      = $inputs['phone_number'];
        $Api->email             = $inputs['email'];
        if($Api->save()){
            return Redirect('backend/api')->with('success',$Messages['api_add_success']);
        }else{
            return back()->with('error',$Messages['api_add_error']);
        }
    }

    public function edit(Request $request , $id){
        $Api              = Api::find($id);
        $data['Api']      = $Api;
        return view('backend.api.edit')->with($data);
    }

    public function update(Request $request,$id){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'title'             => 'required',
            'company_name'      => 'required',
            'description'       => 'required',
            'user_name'         => 'required',
            'password'          => 'required',
            'phone_number'      => 'required',
            'email'             => 'required',
        ];
        $messages = [
            'title.required'            => $Validation['title'],
            'company_name.required'     => $Validation['company_name'],
            'description.required'      => $Validation['description'],
            'user_name.required'        => $Validation['user_name'],
            'password.required'         => $Validation['password'],
            'phone_number.required'     => $Validation['phone_number'],
            'email.required'            => $Validation['email'],
        ];
        $this->validate($request,$rules,$messages);
        $Api             = Api::find($id);
        $Api->title             = $inputs['title'];
        $Api->company_name      = $inputs['company_name'];
        $Api->description       = $inputs['description'];
        $Api->user_name         = $inputs['user_name'];
        $Api->password          = $inputs['password'];
        $Api->phone_number      = $inputs['phone_number'];
        $Api->email             = $inputs['email'];
        if($Api->save()){
            return Redirect('backend/api')->with('success',$Messages['api_update_success']);
        }else{
            return back()->with('error',$Messages['api_update_error']);
        }
    }

    // public function view(Request $request , $id){
    //     $data['city']  = City::find($id);
    //     $data['js'] = ['city/view.js'];
    //     return view('admin.city.view',compact('data'));
    // }
    public function destroy(Request $request,$id){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $Api       =  Api::find($id);
        if($Api){
            // if(File::exists(ImageHelper::$getFormPath.$Form->form)){
            //     File::delete(ImageHelper::$getFormPath.$Form->form);
            // }
            if($Api->delete()){
                return ['status'=>'success','message'=>$Messages['api_delete_success']];
            }else{
                return ['status'=>'failed','message'=>$Messages['api_delete_error']];
            }
        }
    }

    public function activeInactive(Request $request){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $Api  = Api::find($inputs['id']);
        if($inputs['status']=='1'){
            $Api->status=$inputs['status'];
        }else{
            $Api->status=$inputs['status'];
        }
        if($Api->save()){
            if($Api->status=='1'){
                return response()->json(['status'=>true,'status_code'=>'200','message'=>$Messages['api_active_success'],'data'=>$Api,'error'=>[]], 200);
            }else{
                return response()->json(['status'=>true,'status_code'=>'200','message'=>$Messages['api_inactive_success'],'data'=>$Api,'error'=>[]], 200);
            }    
        }else{
            return response(['status' => false , 'status_code'=>'401', 'message' => $Messages['record_not_found'], 'data'=>(object)[], 'error'=>[]], 200);
        }
    }
}