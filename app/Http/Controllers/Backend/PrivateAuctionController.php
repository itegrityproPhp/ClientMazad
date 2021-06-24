<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Mail;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Country;
use App\Models\City;
use App\Models\EmailTemplate;
use App\Helpers\ImageHelper;
use App\Helpers\ApiHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;

class PrivateAuctionController extends Controller{
   public function index(Request $request){
        $Users = User::where('type', '=', "1")->whereIn('role',['2','3','4'])->orderBy('id','desc')->get();
        foreach ($Users as $key => $value) {
            $value->profile_image=ImageHelper::getProfileImage($value->profile_image);
        }
        $data['Users']=$Users;
        return view('backend.private_auction.index')->with($data);
    }

    public function create(Request $request){
        $Countries          = Country::all()->pluck('country_name','id')->prepend('Select Country','');
        $Cities             = City::all()->pluck('city_name','id')->prepend('Select City','');
        $data['Countries']  = $Countries;
        $data['Cities']     = $Cities;
        return view('backend.private_auction.create')->with($data);
    }

    public function store(Request $request){
        $inputs   = $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'role'                  => 'required',
            'individual_type'       => 'required',
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
            'role.required'                 => $Validation['role'],
            'individual_type.required'      => $Validation['individual_type'],
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
        $User->type                 = '1';
        $User->role                 = $inputs['role'];
        $User->individual_type      = $inputs['individual_type'];
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
            return response()->json(['status'=>true,'status_code'=>'200','message'=>$Messages['add_private_auction_success'],'data'=>$User,'error'=>[]], 200);
        }else{
            return response()->json(['status'=>false,'status_code'=>'200','message'=>$Messages['add_private_auction_error'],'data'=>(object)[],'error'=>[]], 200);
        }
    }

    public function edit(Request $request,$id){
        $User = User::find($id);
        $Countries          = Country::all()->pluck('country_name','id')->prepend('Select Country','');
        $Cities             = City::all()->pluck('city_name','id')->prepend('Select City','');
        if($User){
            $User->profile_image=ImageHelper::getProfileImage($User->profile_image);
        }
        $data['User']       = $User;
        $data['Countries']  = $Countries;
        $data['Cities']     = $Cities;
        return view('backend.private_auction.edit')->with($data);
    }

    public function editDocument(Request $request,$id){
        $User = User::find($id);
        $Countries          = Country::all()->pluck('country_name','id')->prepend('Select Country','');
        $Cities             = City::all()->pluck('city_name','id')->prepend('Select City','');
        if($User){
            //=========ForProfileImage=========
            $profile_image = ImageHelper::getProfileImage($User->profile_image);
            $User->profile_image_extension=pathinfo($User->profile_image, PATHINFO_EXTENSION);
            $User->profile_image_url = $profile_image;
            //=========ForResidencePermit=========
            $residence_permit = ImageHelper::getResidencePermit($User->residence_permit);
            $User->residence_permit_extension=pathinfo($User->residence_permit, PATHINFO_EXTENSION);
            $User->residence_permit_url = $residence_permit;
            
        }
        $data['User']       = $User;
        $data['Countries']  = $Countries;
        $data['Cities']     = $Cities;
        if($User->role=='2'){
            if($User->individual_type=='1'){
                return view('backend.private_auction.edit_bidder_owner')->with($data);
            }elseif($User->individual_type=='2'){
                return view('backend.private_auction.edit_bidder_company')->with($data);
            }
        }elseif($User->role=='3'){
            if($User->individual_type=='1'){
                return view('backend.private_auction.edit_auction_owner')->with($data);
            }elseif($User->individual_type=='2'){
                return view('backend.private_auction.edit_auction_company')->with($data);
            }elseif($User->individual_type=='3'){
                return view('backend.private_auction.edit_auction_agent')->with($data);
            }
        }elseif($User->role=='4'){
            return view('backend.private_auction.edit_agent')->with($data);
        }else{

        }
        return view('backend.private_auction.edit')->with($data);
    }

    public function updateDocument(Request $request , $id){
        $inputs =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $data = [];
        $rules = [
            //'profile_image'         => 'required',
            //'password'              => 'required',
        ];
        $message = [
            //'profile_image.required'     => $Validation['profile_image'],
            //'password.required'          => $Validation['password'],
        ];

        $validator = Validator::make($inputs, $rules,$message);
        if ($validator->fails()) {
            $errors =  $validator->errors()->all();
            return response(['status' => false , 'status_code'=>'401', 'message' => $errors[0], 'token'=>'', 'data'=>(object)[], 'error'=>$errors[0]], 200);              
        }

        $User  = User::where('id',$id)->first();
        if($User){
            $profile_image=null;
            if($request->hasFile('profile_image')) {
                $profile_image = Str::random(10).'_'.time().'.'.request()->profile_image->getClientOriginalExtension();
                request()->profile_image->move(ImageHelper::$getProfileImagePath, $profile_image);
            }
            //$User->password =  Hash::make($inputs['password']);
            //$User->registration_process_status = '3';
            if($profile_image){
                $User->profile_image = $profile_image;
            }
            if($User->role=='2'){
                $residence_permit=null;
                if($request->hasFile('residence_permit')) {
                    $residence_permit = Str::random(10).'_'.time().'.'.request()->residence_permit->getClientOriginalExtension();
                    request()->residence_permit->move(ImageHelper::$getResidencePermitPath, $residence_permit);
                }
                if(!empty($inputs['residence'])){
                    $User->residence = $inputs['residence'];
                }
                if($residence_permit){
                    $User->residence_permit = $residence_permit;
                }
                if($User->individual_type=='1'){
                  
                }elseif($User->individual_type=='2'){
                    $registry_copy=null;
                    if($request->hasFile('registry_copy')) {
                        $registry_copy = Str::random(10).'_'.time().'.'.request()->registry_copy->getClientOriginalExtension();
                        request()->registry_copy->move(ImageHelper::$getRegistryCopyPath, $registry_copy);
                    }
                    
                    if(!empty($inputs['company_name'])){
                        $User->password = $inputs['company_name'];
                    }
                    if(!empty($inputs['company_registry_number'])){
                        $User->company_registry_number = $inputs['company_registry_number'];
                    }
                    if(!empty($inputs['date_of_registry'])){
                        $User->date_of_registry = $inputs['date_of_registry'];
                    }
                    if(!empty($inputs['expire_date_of_registry'])){
                        $User->expire_date_of_registry = $inputs['expire_date_of_registry'];
                    }
                    if(!empty($inputs['registry_issue_city'])){
                        $User->registry_issue_city = $inputs['registry_issue_city'];
                    }
                    if(!empty($inputs['registry_city'])){
                        $User->registry_city = $inputs['registry_city'];
                    }
                    if(!empty($registry_copy)){
                        $User->registry_copy = $registry_copy;
                    }
                }
            }elseif($User->role=='3'){
                if($User->individual_type=='1'){
                    $residence_permit=null;
                    if($request->hasFile('residence_permit')) {
                        $residence_permit = Str::random(10).'_'.time().'.'.request()->residence_permit->getClientOriginalExtension();
                        request()->residence_permit->move(ImageHelper::$getResidencePermitPath, $residence_permit);
                    }
                    $User->residence = $inputs['residence'];
                    if($residence_permit){
                        $User->residence_permit = $residence_permit;
                    }
                }elseif($User->individual_type=='2'){
                    $residence_permit=null;
                    if($request->hasFile('residence_permit')) {
                        $residence_permit = Str::random(10).'_'.time().'.'.request()->residence_permit->getClientOriginalExtension();
                        request()->residence_permit->move(ImageHelper::$getResidencePermitPath, $residence_permit);
                    }

                    $registry_copy=null;
                    if($request->hasFile('registry_copy')) {
                        $registry_copy = Str::random(10).'_'.time().'.'.request()->registry_copy->getClientOriginalExtension();
                        request()->registry_copy->move(ImageHelper::$getRegistryCopyPath, $registry_copy);
                    }
                    $User->residence = $inputs['residence'];
                    if(!empty($inputs['company_name'])){
                        $User->password = $inputs['company_name'];
                    }
                    if(!empty($inputs['company_registry_number'])){
                        $User->company_registry_number = $inputs['company_registry_number'];
                    }
                    if(!empty($inputs['date_of_registry'])){
                        $User->date_of_registry = $inputs['date_of_registry'];
                    }
                    if(!empty($inputs['expire_date_of_registry'])){
                        $User->expire_date_of_registry = $inputs['expire_date_of_registry'];
                    }
                    if(!empty($inputs['registry_issue_city'])){
                        $User->registry_issue_city = $inputs['registry_issue_city'];
                    }
                    if(!empty($inputs['registry_city'])){
                        $User->registry_city = $inputs['registry_city'];
                    }
                    if($residence_permit){
                        $User->residence_permit = $residence_permit;
                    }
                    if(!empty($registry_copy)){
                        $User->registry_copy = $registry_copy;
                    }
                }elseif($User->individual_type=='3'){
                    $agency_image=null;
                    if($request->hasFile('agency_image')) {
                        $agency_image = Str::random(10).'_'.time().'.'.request()->agency_image->getClientOriginalExtension();
                        request()->agency_image->move(ImageHelper::$getAgencyPath, $agency_image);
                    }
                    
                    if(!empty($inputs['agency_number'])){
                        $User->agency_number = $inputs['agency_number'];
                    }
                    if(!empty($inputs['agency_source'])){
                        $User->agency_source = $inputs['agency_source'];
                    }
                    if(!empty($inputs['agency_expire_date'])){
                        $User->agency_expire_date = $inputs['agency_expire_date'];
                    }
                    if(!empty($agency_image)){
                        $User->agency_image = $agency_image;
                    }
                }
            }elseif($User->role=='4'){
                $document_copy=null;
                if($request->hasFile('document_copy')) {
                    $document_copy = Str::random(10).'_'.time().'.'.request()->document_copy->getClientOriginalExtension();
                    request()->document_copy->move(ImageHelper::$getDocumentCopyPath, $document_copy);
                }
                if(!empty($inputs['nationality'])){
                    $User->nationality = $inputs['nationality'];
                }
                if(!empty($inputs['type_of_personal_document'])){
                    $User->type_of_personal_document = $inputs['type_of_personal_document'];
                }
                if(!empty($inputs['sourch_name_of_personal_document'])){
                    $User->sourch_name_of_personal_document = $inputs['sourch_name_of_personal_document'];
                }
                if(!empty($inputs['issue_date_of_document'])){
                    $User->issue_date_of_document = $inputs['issue_date_of_document'];
                }
                if(!empty($inputs['issue_place_of_document'])){
                    $User->issue_place_of_document = $inputs['issue_place_of_document'];
                }
                if(!empty($inputs['nationality_of_certificate'])){
                    $User->nationality_of_certificate = $inputs['nationality_of_certificate'];
                }
                if(!empty($inputs['nationality_of_certificate_name'])){
                    $User->nationality_of_certificate_name = $inputs['nationality_of_certificate_name'];
                }
                if(!empty($inputs['location_of_evaluator'])){
                    $User->location_of_evaluator = $inputs['location_of_evaluator'];
                }
                if(!empty($inputs['location_of_evaluator_name'])){
                    $User->location_of_evaluator_name = $inputs['location_of_evaluator_name'];
                }
                if(!empty($document_copy)){
                    $User->document_copy = $document_copy;
                }
            }
            if($User->save()){
                $data['user_id']            = $User->id;
                $data['type']               = $User->type;
                $data['first_name']         = $User->first_name;
                $data['second_name']        = $User->second_name;
                $data['third_name']         = $User->third_name;
                $data['surname_name']       = $User->surname_name;
                $data['email']              = $User->email;
                $data['phone_number']       = $User->phone_number;
                $data['date_of_birth']      = $User->date_of_birth;
                $data['country_id']         = $User->country_id;
                $data['city_id']            = $User->city_id;
                $data['lang']               = $User->lang;
                $data['device_type']        = $User->device_type;
                $data['device_token']       = $User->device_token;
                $data['registration_process_status']    = $User->registration_process_status;
                return response()->json(['status'=>true,'status_code'=>'200','message'=>$Messages['add_private_auction_success'],'token'=>$User->api_token,'data'=>$data,'error'=>[]], 200);
            }else{
                return response()->json(['status'=>false,'status_code'=>'200','message'=>$Messages['add_private_auction_error'],'token'=>$User->api_token,'data'=>(object)[],'error'=>[]], 200);
            }
        }else{
            return response()->json(['status'=>false,'status_code'=>'200','message'=>$Messages['record_not_found'],'token'=>'','data'=>(object)[],'error'=>[]], 200);
        }
    }

    public function update(Request $request,$id){
        $inputs   = $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'role'                  => 'required',
            'individual_type'       => 'required',
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
            'role.required'                 => $Validation['role'],
            'individual_type.required'      => $Validation['individual_type'],
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
        //return $inputs;
        $User                       = User::find($id);
        $User->type                 = '1';
        $User->role                 = $inputs['role'];
        $User->individual_type      = $inputs['individual_type'];
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
            return response()->json(['status'=>true,'status_code'=>'200','message'=>$Messages['add_private_auction_success'],'data'=>$User,'error'=>[]], 200);
        }else{
            return response()->json(['status'=>false,'status_code'=>'200','message'=>$Messages['add_private_auction_error'],'data'=>(object)[],'error'=>[]], 200);
        }
    }

    public function view(Request $request , $id){
        $User = User::find($id);
        if($User){
            $User->profile_image=ImageHelper::getProfileImage($User->profile_image);
        }
        $data['User']       = $User;
        return view('backend.private_auction.view')->with($data);
    }

    public function activateUser(Request $request){
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
                return response()->json(['status'=>true,'status_code'=>'200','message'=>$Messages['activate_user_success'],'data'=>$User,'error'=>[]], 200);
            }else{
                return response()->json(['status'=>true,'status_code'=>'200','message'=>$Messages['inctivate_user_success'],'data'=>$User,'error'=>[]], 200);
            }    
        }else{
            return response(['status' => false , 'status_code'=>'401', 'message' => $Messages['record_not_found'], 'data'=>(object)[], 'error'=>[]], 200);
        }
    }

    // public function activateUser(Request $request){
    //     $inputs      = $request->all();
    //     $id =  $inputs['user_id'];
    //     $Vendor  = User::find($id);
    //     if($Vendor->status=='1'){
    //         $Vendor->status='2';
    //     }else{
    //        $Vendor->status='1'; 
    //     }
    //     if(!empty($inputs['reason'])){
    //         $Vendor->reason = $inputs['reason'];
    //     }
    //     if(!empty($inputs['reason_ar'])){
    //         $Vendor->reason_ar = $inputs['reason_ar'];
    //     }
    //     if($Vendor->save()){
    //         if($Vendor->status=='1'){  
    //             $email_content = EmailTemplate::where('id', 2)->first();
    //             $searchArray = array("{user_name}", "{email}", "{reason}", "{logo_url}", "{site_url}");
    //             $replaceArray = array($Vendor->name , $Vendor->email, $Vendor->reason , url('/admin_assets/images/logo.png'), url('/'));
    //             $content = str_replace($searchArray, $replaceArray, $email_content->content);
    //             $email_data['name'] = $Vendor->name;
    //             $email_data['email'] = $Vendor->email;
    //             $email_data['reason'] = $Vendor->reason;
    //             $email_data['subject'] = $email_content->subject;
    //             $email_data['content'] = $content;

    //             $inData['from_email']     =  'test1@gmail.com';
    //             $inData['subject']     =  $email_content->subject;
    //             $inData['email']     =  $Vendor->email;

    //             Mail::send('admin.email_template.sendemail',$email_data, function ($message) use ($inData) {
    //                 $message->from($inData['from_email'],'Online Lab');
    //                 $message->to($inData['email']);
    //                 $message->subject($inData['subject']);
    //             });
    //             return back()->with('success','User Activate Successfully');
    //         }else{
    //             $email_content = EmailTemplate::where('id', 3)->first();
    //             $searchArray = array("{user_name}", "{email}", "{reason}", "{logo_url}", "{site_url}");
    //             $replaceArray = array($Vendor->name , $Vendor->email, $Vendor->reason , url('/admin_assets/images/logo.png'), url('/'));
    //             $content = str_replace($searchArray, $replaceArray, $email_content->content);
                
    //             $email_data['name'] = $Vendor->name;
    //             $email_data['email'] = $Vendor->email;
    //             $email_data['reason'] = $Vendor->reason;
    //             $email_data['subject'] = $email_content->subject;
    //             $email_data['content'] = $content;

    //             $inData['from_email']     =  'test1@gmail.com';
    //             $inData['subject']     =  $email_content->subject;
    //             $inData['email']     =  $Vendor->email;

    //             Mail::send('admin.email_template.sendemail',$email_data, function ($message) use ($inData) {
    //                 $message->from($inData['from_email'],'Online Lab');
    //                 $message->to($inData['email']);
    //                 $message->subject($inData['subject']);
    //             });
    //             return back()->with('success','User Deactivate Successfully');
    //         }    
    //     }else{
    //         return back()->with('error','Some tecnical issue , please try again');
    //     }
    // }

    public function getCity(Request $request){
        $inputs =  $request->all();
        $inputs   = $request->all();
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

    // public function emailCheck(Request $request){
    //     $rules = [
    //         'email'                 => ['required', Rule::unique('users', 'email')],
    //     ];
    //     $messages = [
    //         'email.required'                => $Validation['email'],
    //         'email.unique'                  => $Validation['email_unique'],
    //     ];
    //     if($validator->fails()) {
    //         $errors =  $validator->errors()->all();
    //         return false;              
    //     }else{
    //         return true;
    //     }
    // }
    public function destroy($id){
        $User =  User::find($id);
        if($User){
            if($User->delete()){
                return ['status'=>'success','message'=>'User deleted successfully'];
            }else{
                return ['status'=>'failed','message'=>'User deleted failed,please try again'];
            }
        }
    }
}