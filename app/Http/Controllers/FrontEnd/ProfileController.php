<?php
namespace App\Http\Controllers\FrontEnd;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\EmailTemplate;
use App\Models\City;
use App\Models\UserFamilyMember;
use App\Models\Booking;
use App\Models\BookingProduct;
use App\Models\TestReport;
use App\Models\Notification;
use Validator;
use Auth;
use Hash;
use File;
use Illuminate\Support\Str;
use App\Helpers\ImageHelper;
use Illuminate\Support\Facades\Mail;
use App\Mail\NotifyMail;

class ProfileController extends Controller{
    public function __construct(){
        $this->middleware('auth');
    }

    public function dashboard(){
        $user_id = Auth::user()->id;
        $User  =  User::find($user_id);
        if($User){
            $User->user_image = ImageHelper::getProfileImage($User->user_image);
            $User->upload_civil_id = ImageHelper::getContractStorePdf($User->upload_civil_id);
            //$User->
        }
        //return $User;
        $City = City::get();
        $UserFamilyMember = UserFamilyMember::where('user_id',$user_id)->get();
        $Booking = Booking::where('master_user_id',$user_id)->where('status','1')->get();
        if($Booking){
            foreach ($Booking as $b_key => $b_value) {
                $b_value->lab_name = $b_value->bookingProduct[0]->lab->lab_name;
                if($b_value->user_type=='1'){
                    $b_value->patient_name = $b_value->user->name.' '.$b_value->user->last_name;
                    $b_value->patient_id = $b_value->user->id;

                }else{
                    $b_value->patient_name = $b_value->familyMember->first_name.' '.$b_value->familyMember->last_name;
                    $b_value->patient_id = $b_value->familyMember->id;
                }
            }
        }
        //====Show report on dashboard====
        $TestReport = TestReport::where('user_id',$user_id)->get();
        foreach ($TestReport as $tr_key => $tr_value) {
            $tr_value->report_file_url = ImageHelper::getTestReportFile($tr_value->report_file);
            if($tr_value->bookingProduct){
                if($tr_value->bookingProduct->type=='1'){
                    if($tr_value->bookingProduct->test){
                        $tr_value->test_package_name = $tr_value->bookingProduct->test->test_name;
                    }else{
                        $tr_value->test_package_name = 'N/A';
                    }
                }else{
                    if($tr_value->bookingProduct->package){
                        $tr_value->test_package_name = $tr_value->bookingProduct->package->package_name;
                    }else{
                        $tr_value->test_package_name = 'N/A';
                    }  
                } 
            }else{
                $tr_value->test_package_name = 'N/A';
            }

            if($tr_value->booking){
                $tr_value->booking_id_show = $tr_value->booking->booking_id;
                if($tr_value->booking->user_type=='1'){
                    if($tr_value->booking->user){
                        $tr_value->patient_name = $tr_value->booking->user->name.' '.$tr_value->booking->user->last_name;
                        $tr_value->date_of_birth = $tr_value->booking->user->date_of_birth;
                    }else{
                        $tr_value->patient_name = 'N/A';
                        $tr_value->date_of_birth = 'N/A';
                    }   
                }else{
                    if($tr_value->booking->familyMember){
                        $tr_value->patient_name = $tr_value->booking->familyMember->first_name.' '.$tr_value->booking->familyMember->last_name;
                        $tr_value->date_of_birth = $tr_value->booking->familyMember->date_of_birth;
                    }else{
                        $tr_value->patient_name = 'N/A';
                        $tr_value->date_of_birth = 'N/A';
                    }
                }
            }else{
                $tr_value->booking_id_show = 'N/A';
            }
        }

        //return $TestReport;

        $data['user'] = $User;
        $data['cities'] = $City;
        $data['user_family_member'] = $UserFamilyMember;
        $data['bookings'] = $Booking;
        $data['reports'] = $TestReport;
        return view('front_end.dashboard')->with($data);
    }

    public function profileUpdate(Request $request){
        $inputs   = $request->all();
        //$inputs   = Request::all();
        $langData   = trans('front_end');
        $langData = $langData['Validation'];

        $user_id = Auth::user()->id;
        $rules = [
            'first_name'              => 'required',
            'last_name'          => 'required',
            'email'             => ['required', Rule::unique('users', 'email')->ignore($user_id, 'id')],
            'phone_number'      => ['required', Rule::unique('users', 'phone_number')->ignore($user_id, 'id')],
            'user_name' => 'required',
            'gender'      => 'required',
            'date_of_birth'      => 'required',
            'select_city'      => 'required',
            //'address'      => 'required',
            'location'      => 'required',
        ];
        $message = [
            'first_name.required'   => $langData['first_name'],
            'last_name.required'    => $langData['last_name'],
            'email.required'        => $langData['email'],
            'email.unique'          => $langData['email_unique'],
            'phone_number.required'    => $langData['phone_number'],
            'user_name.required'       => $langData['user_name'],
            'date_of_birth.required'  => $langData['date_of_birth'],
            'select_city.required'  => $langData['select_city'],
            //'address.required' => $langData['address'],
            'location.required' => $langData['location'],
        ];
        $validator = Validator::make($inputs, $rules,$message);
        if ($validator->fails()) {
            $errors =  $validator->errors()->all();
            return response(['status' => false , 'message' => $errors[0]] , 200);              
        }

        // $upload_civil_id=null;
        // if($request->hasFile('upload_civil_id')) {
        //     $upload_civil_id = Str::random(10).'_'.time().'.'.request()->upload_civil_id->getClientOriginalExtension();
        //     request()->upload_civil_id->move(public_path('uploads/contract_store/'), $upload_civil_id);
        // }

        $User                     = User::find($user_id);
        $profile_image=null;
        if($request->hasFile('profile_image')) {
            $profile_image = Str::random(10).'_'.time().'.'.request()->profile_image->getClientOriginalExtension();
            request()->profile_image->move(public_path('uploads/profile/'), $profile_image);

            if($User->user_image){
                if(File::exists('uploads/profile/'.$User->user_image)){
                    File::delete('uploads/profile/'.$User->user_image);
                }
            }  
        }

        $upload_civil_id=null;
        if($request->hasFile('upload_civil_id')) {
            $upload_civil_id = Str::random(10).'_'.time().'.'.request()->upload_civil_id->getClientOriginalExtension();
            request()->upload_civil_id->move(public_path('uploads/contract_store/'), $upload_civil_id);

            if($User->upload_civil_id){
                if(File::exists('uploads/contract_store/'.$User->upload_civil_id)){
                    File::delete('uploads/contract_store/'.$User->upload_civil_id);
                }
            }  
        }
        $User->name               = $inputs['first_name'];
        $User->last_name          = $inputs['last_name'];
        $User->email              = $inputs['email'];
        $User->phone_number        = $inputs['phone_number'];
        $User->username           = $inputs['user_name'];
        $User->gender    = $inputs['gender'];
        $User->date_of_birth       = date("Y-m-d", strtotime($inputs['date_of_birth']));
        $User->city_id           = $inputs['select_city'];
        //$User->address           = $inputs['address'];
        $User->location           = $inputs['location'];
        $User->civil_id_no           = $inputs['civil_id_number'];
        //$User->civil_id_expiry_date  = $inputs['civil_id_expiry_date'];
        if($inputs['lat']){
            $User->lat           = $inputs['lat'];
        }
        if($inputs['lng']){
            $User->lng           = $inputs['lng'];
        }
        if($inputs['block']){
            $User->block         = $inputs['block'];
        }
        if($inputs['street_lane']){
            $User->street_lane   = $inputs['street_lane'];
        }
        if($inputs['building_number_floor']){
            $User->building_number_floor  = $inputs['building_number_floor'];
        }
        if($inputs['flat_no']){
            $User->flat_no   = $inputs['flat_no'];
        }
        if($inputs['nearest_landmark']){
            $User->nearest_landmark  = $inputs['nearest_landmark'];
        }
        if($profile_image){
            $User->user_image   = $profile_image;
        }
        if($upload_civil_id){
            $User->upload_civil_id   = $upload_civil_id;
        }

        if($User->save()){
            
            return response()->json(['status'=>true, 'message'=>$langData['profile_update_success'],'data' =>$User]);
        }else{
            return response()->json(['status'=>true, 'message'=>$langData['profile_update_error']]);
        }
    }

    public function addFamilyMember(Request $request){
        $inputs   = $request->all();
        $user_id = Auth::user()->id;
        $City = City::get();
        $data['cities'] = $City;
        return view('front_end.add_family_member')->with($data);
    }
    public function storeFamilyMember(Request $request){
        $inputs   = $request->all();
        //$inputs   = Request::all();
        $langData   = trans('front_end');
        $langData = $langData['Validation'];
        $user_id    = Auth::user()->id;

        $rules['first_name'] = 'required';
        $rules['last_name'] = 'required';
        $rules['date_of_birth'] = 'required';
        $rules['phone_number'] = 'required|size:8|unique:user_family_members';
        $rules['gender'] = 'required';
        $rules['relationship'] = 'required';
        $rules['email'] = 'required|email|unique:user_family_members';
        $rules['civil_id_number'] = 'required';
        $rules['upload_civil_id'] = 'required';
        //$rules['civil_id_expiry_date'] = 'required';

        $message['first_name.required'] = $langData['first_name'];
        $message['last_name.required'] = $langData['last_name'];
        $message['date_of_birth.required'] = $langData['date_of_birth'];
        $message['gender.required'] = $langData['gender'];
        $message['relationship.required'] = $langData['relationship'];
        $message['email.required'] = $langData['email'];
        $message['civil_id_number.required'] = $langData['civil_id_number'];
        $message['upload_civil_id.required'] = $langData['upload_civil_id'];
        //$message['civil_id_expiry_date.required'] = $langData['civil_id_expiry_date'];
        $validator = Validator::make($inputs, $rules ,$message);
        if ($validator->fails()) {
            $errors =  $validator->errors()->all();
            return response(['status' => false , 'message' => $errors[0]] , 200);              
        }

        if(!empty($inputs['family_member_id'])){
            $UserFamilyMember = UserFamilyMember::find($inputs['family_member_id']);
            $upload_civil_id=null;
            if($request->hasFile('upload_civil_id')) {
                $upload_civil_id = Str::random(10).'_'.time().'.'.request()->upload_civil_id->getClientOriginalExtension();
                request()->upload_civil_id->move(public_path('uploads/contract_store/'), $upload_civil_id);
                if($UserFamilyMember->upload_civil_id){
                    if(File::exists('uploads/contract_store/'.$UserFamilyMember->upload_civil_id)){
                        File::delete('uploads/contract_store/'.$UserFamilyMember->upload_civil_id);
                    }
                }  
            }
        }else{
            if($request->hasFile('upload_civil_id')) {
                $upload_civil_id = Str::random(10).'_'.time().'.'.request()->upload_civil_id->getClientOriginalExtension();
                request()->upload_civil_id->move(public_path('uploads/contract_store/'), $upload_civil_id);
            }
            $UserFamilyMember = new UserFamilyMember();
        }
        $UserFamilyMember->user_id = $user_id;
        $UserFamilyMember->first_name = $inputs['first_name'];
        $UserFamilyMember->last_name = $inputs['last_name'];
        $UserFamilyMember->gender = $inputs['gender'];
        $UserFamilyMember->date_of_birth = $inputs['date_of_birth'];
        $UserFamilyMember->relation = $inputs['relationship'];
        $UserFamilyMember->civil_id_no = $inputs['civil_id_number']; 
        if($upload_civil_id){
            $UserFamilyMember->upload_civil_id = $upload_civil_id;  
        }
        if(!empty($inputs['email'])){
            $UserFamilyMember->email = $inputs['email'];
        }
        if(!empty($inputs['email'])){
            $UserFamilyMember->phone_number = $inputs['phone_number'];
        }
        if(!empty($inputs['civil_id_expiry_date'])){
            $UserFamilyMember->civil_id_expiry_date = $inputs['civil_id_expiry_date'];
        }
        if($UserFamilyMember->save()){
            return response()->json(['status'=>true, 'message'=>$langData['family_member_success'],'data' =>$UserFamilyMember]);            
        }else{
            return response()->json(['status'=>false, 'message'=>$langData['family_member_error']]);
        }
    }
    public function changeFamilyMemberStatus(Request $request){
        $inputs   = $request->all();
        //$inputs   = Request::all();
        $langData   = trans('front_end');
        $langData = $langData['Validation'];
        $user_id    = Auth::user()->id;
        $UserFamilyMember = UserFamilyMember::find($inputs['family_member_id']);
        $UserFamilyMember->status = '1';
        if($UserFamilyMember->save()){
            //=================Email Code Hear===============
            $family_member_name = $UserFamilyMember->first_name.' '.$UserFamilyMember->last_name;
            $family_member_email = $UserFamilyMember->email;
            $user_name = Auth::user()->name;
            $user_email = Auth::user()->email;
            $email_content = EmailTemplate::where('id', 14)->first();
            $searchArray = array("{user_name}", "{family_member_name}", "{family_member_email}", "{logo_url}" , "{site_url}");
            $replaceArray = array($user_name , $family_member_name, $family_member_email, url('/admin_assets/images/logo.png'), url('/'));
            $content = str_replace($searchArray, $replaceArray, $email_content->content);

            $email_data['family_member_name'] = $family_member_name;
            $email_data['family_member_email'] = $family_member_email;

            $email_data['subject'] = $email_content->subject.' '.$user_name;
            $email_data['content'] = $content;

            $inData['from_email']     =  'test1@gmail.com';
            $inData['subject']     =  $email_content->subject.' '.$user_name;
            $inData['family_member_email']     =  $family_member_email;

            Mail::send('admin.email_template.sendemail',$email_data, function ($message) use ($inData) {
                $message->from($inData['from_email'],'Online Lab');
                $message->to($inData['family_member_email']);
                $message->subject($inData['subject']);
            });

            // $email_content = EmailTemplate::where('id', 15)->first();
            // $searchArray = array("{user_name}", "{family_member_name}", "{email}", "{logo_url}" , "{site_url}");
            // $replaceArray = array($user_name , $family_member_name, $user_email, url('/admin_assets/images/logo.png'), url('/'));
            // $content = str_replace($searchArray, $replaceArray, $email_content->content);

            // $email_data['user_name'] = $user_name;
            // $email_data['user_email'] = $user_email;
            
            // $email_data['subject'] = $email_content->subject;
            // $email_data['content'] = $content;

            // $inData['from_email']     =  'test1@gmail.com';
            // $inData['subject']     =  $email_content->subject;
            // $inData['user_email']     =  $user_email;

            // Mail::send('admin.email_template.sendemail',$email_data, function ($message) use ($inData) {
            //     $message->from($inData['from_email'],'Online Lab');
            //     $message->to($inData['user_email']);
            //     $message->subject($inData['subject']);
            // });

            $sender_id = Auth::user()->id; 
            $data2 = $family_member_name.' added in your family';

            // $message = $user_name.' had added you as family member';
            // $title = 'Add Family Member';
            // $title_ar = 'Add Family Member';
            // $message = $message;
            // $message_ar = $message;
            // $JsonData = [
            //     'sender_id' => $sender_id,
            //     'receiver_id' => $sender_id,
            //     'title' => $title,
            //     'title_ar' => $title_ar,
            //     'message' => $message,
            //     'message_ar' => $message_ar,
            // ];
            // $JsonData = json_encode($JsonData);
            // $Notification = new Notification();
            // $Notification->sender_id = $sender_id;
            // $Notification->receiver_id = $sender_id;
            // $Notification->title = $title;
            // $Notification->title_ar = $title_ar;
            // $Notification->message = $message;
            // $Notification->message_ar = $message_ar;
            // $Notification->json_data = $JsonData;
            // $Notification->save();
           
            //=================End Email Code===============
            
            return response()->json(['status'=>true, 'message'=>$langData['family_member_success'],'data' =>url('/dashboard#success'),'data2' =>$data2]); 
        }else{
            return response()->json(['status'=>true, 'message'=>$langData['family_member_error'],'data' =>url('/dashboard#success'),'data2' =>$data2]); 
        }
    }
    public function searchFamilyMember(Request $request){
        $inputs   = $request->all();
        //$inputs   = Request::all();
        $langData   = trans('front_end');
        $langData = $langData['Validation'];
        $inputs     = $request->all();
        $user_id    = Auth::user()->id;
        $UserFamilyMember  = UserFamilyMember::select('*')
                                ->where(function ($query) use ($inputs) {
                                    if($inputs['search_family_member']){
                                        $search_family_member = $inputs['search_family_member'];
                                        $query->where('first_name', 'like', "%{$search_family_member}%");
                                        $query->orWhere('last_name', 'like', "%{$search_family_member}%");
                                    }
                                })
                                ->where('user_id',$user_id)
                                ->get();
        return response()->json(['status'=>true, 'message'=>'Record found','data' =>$UserFamilyMember]); 
    }

    public function addAuthentcateMember(Request $request){
        $inputs   = $request->all();
        //$inputs   = Request::all();
        $langData   = trans('front_end');
        $langData = $langData['Validation'];
        $user_id    = Auth::user()->id;
        $Member = User::where('role','2')->where('email',$inputs['authentcate_member_email'])->where('id','!=',$user_id)->first();
        if($Member){
            if(password_verify($inputs['authentcate_member_password'], $Member->password) ) {
                $CheckUserFamilyMember = UserFamilyMember::where('member_user_id',$Member->id)->where('user_id',Auth::user()->id)->first();
                if(!$CheckUserFamilyMember){

                    $UserFamilyMember = new UserFamilyMember();
                    $UserFamilyMember->user_id = $user_id;
                    $UserFamilyMember->first_name = $Member->name;
                    $UserFamilyMember->last_name = $Member->last_name;
                    $UserFamilyMember->gender = $Member->gender;
                    $UserFamilyMember->date_of_birth = $Member->date_of_birth;
                    $UserFamilyMember->relation = $inputs['authentcate_member_relationship'];
                    $UserFamilyMember->civil_id_no = $Member->civil_id_no;
                    $UserFamilyMember->civil_id_expiry_date = $Member->civil_id_expiry_date;
                    $UserFamilyMember->upload_civil_id = $Member->upload_civil_id;
                    $UserFamilyMember->email = $Member->email;
                    $UserFamilyMember->phone_number = $Member->phone_number;
                    $UserFamilyMember->status = '1';
                    $UserFamilyMember->authentcate_member = '1';
                    $UserFamilyMember->member_user_id = $Member->id;
                    
                    if($UserFamilyMember->save()){
                        //=================Email Code Hear===============
                        $receiver_id = $Member->id;
                        $family_member_name = $UserFamilyMember->first_name.' '.$UserFamilyMember->last_name;
                        $family_member_email = $UserFamilyMember->email;
                        
                        $user_name = Auth::user()->name;
                        $user_email = Auth::user()->email;

                        $email_content = EmailTemplate::where('id', 14)->first();
                        $searchArray = array("{user_name}", "{family_member_name}", "{family_member_email}", "{logo_url}" , "{site_url}");
                        $replaceArray = array($user_name , $family_member_name, $family_member_email, url('/admin_assets/images/logo.png'), url('/'));
                        $content = str_replace($searchArray, $replaceArray, $email_content->content);

                        $email_data['family_member_name'] = $family_member_name;
                        $email_data['family_member_email'] = $family_member_email;

                        $email_data['subject'] = $email_content->subject.' '.$user_name;
                        $email_data['content'] = $content;

                        $inData['from_email']     =  'test1@gmail.com';
                        $inData['subject']     =  $email_content->subject.' '.$user_name;
                        $inData['family_member_email']     =  $family_member_email;

                        Mail::send('admin.email_template.sendemail',$email_data, function ($message) use ($inData) {
                            $message->from($inData['from_email'],'Online Lab');
                            $message->to($inData['family_member_email']);
                            $message->subject($inData['subject']);
                        });

                        // $email_content = EmailTemplate::where('id', 15)->first();
                        // $searchArray = array("{user_name}", "{family_member_name}", "{email}", "{logo_url}" , "{site_url}");
                        // $replaceArray = array($user_name , $family_member_name, $user_email, url('/admin_assets/images/logo.png'), url('/'));
                        // $content = str_replace($searchArray, $replaceArray, $email_content->content);

                        // $email_data['user_name'] = $user_name;
                        // $email_data['user_email'] = $user_email;
                        
                        // $email_data['subject'] = $email_content->subject;
                        // $email_data['content'] = $content;

                        // $inData['from_email']     =  'test1@gmail.com';
                        // $inData['subject']     =  $email_content->subject;
                        // $inData['user_email']     =  $user_email;

                        // Mail::send('admin.email_template.sendemail',$email_data, function ($message) use ($inData) {
                        //     $message->from($inData['from_email'],'Online Lab');
                        //     $message->to($inData['user_email']);
                        //     $message->subject($inData['subject']);
                        // });

                        $sender_id = Auth::user()->id;
                        $data2 = $family_member_name.' added in your family';
                        $message = $user_name.' had added you as family member';
                        $title = 'Add Family Member';
                        $title_ar = 'Add Family Member';
                        $message = $message;
                        $message_ar = $message;
                        $JsonData = [
                            'sender_id' => $sender_id,
                            'receiver_id' => $receiver_id,
                            'title' => $title,
                            'title_ar' => $title_ar,
                            'message' => $message,
                            'message_ar' => $message_ar,
                        ];
                        $JsonData = json_encode($JsonData);
                        $Notification = new Notification();
                        $Notification->sender_id = $sender_id;
                        $Notification->receiver_id = $receiver_id;
                        $Notification->title = $title;
                        $Notification->title_ar = $title_ar;
                        $Notification->message = $message;
                        $Notification->message_ar = $message_ar;
                        $Notification->json_data = $JsonData;
                        $Notification->save();

                        return response(['status' => true , 'message' => $langData['family_member_success'],'data' =>url('/dashboard#success'),'data2' =>$data2]);
                    }else{
                        return response(['status' => false , 'message' => $langData['family_member_error']]);
                    }
                }else{
                    return response(['status' => false , 'message' => $langData['family_member_already_added']]);
                }
                
            }else{
                return response(['status' => false , 'message' => $langData['family_member_password_error']]);
            }
        }else{
            return response()->json(['status'=>false, 'message'=>$langData['family_member_email_error']]); 
        }
    }
    public function getMemberDetails(Request $request){
        $inputs   = $request->all();
        //$inputs   = Request::all();
        $langData   = trans('front_end');
        $langData = $langData['Validation'];
        $user_id    = Auth::user()->id;
        if($inputs['type']=='1'){
            $CheckUserFamilyMember = User::where('id',$user_id)->first();
        }else{
            $CheckUserFamilyMember = UserFamilyMember::where('id',$inputs['family_member_id'])->first();
        }
        
        if($CheckUserFamilyMember){
            return response()->json(['status'=>true, 'message'=>$langData['record_success'], 'data'=>$CheckUserFamilyMember]); 
        }else{
            return response()->json(['status'=>false, 'message'=>$langData['record_error']]);   
        }
    }

    public function deleteMember(Request $request){
        $inputs   = $request->all();
        //$inputs   = Request::all();
        $langData   = trans('front_end');
        $langData = $langData['Validation'];
        $user_id    = Auth::user()->id;
        $UserFamilyMember = UserFamilyMember::find($inputs['family_member_id']);
        if($UserFamilyMember){
            if($UserFamilyMember->authentcate_member=='0'){
                if($UserFamilyMember->upload_civil_id){
                    if(File::exists('uploads/contract_store/'.$UserFamilyMember->upload_civil_id)){
                        File::delete('uploads/contract_store/'.$UserFamilyMember->upload_civil_id);
                    }
                }
            }
            if($UserFamilyMember->delete()){
                return response()->json(['status'=>true, 'message'=>$langData['member_delete_success']]);
            }else{
                return response()->json(['status'=>true, 'message'=>$langData['member_delete_error']]);
            }  
        }else{
            return response()->json(['status'=>false, 'message'=>$langData['record_error']]);   
        }
    }
    public function searchBookings(Request $request){
        $inputs   = $request->all();
        //$inputs   = Request::all();
        $langData   = trans('front_end');
        $langData = $langData['Validation'];
        $user_id    = Auth::user()->id;
        $Booking = Booking::select('*')
                    ->where(function ($query) use ($inputs) {
                        if($inputs['search_bookings']){
                            $search_bookings = $inputs['search_bookings'];
                            $query->where('booking_id', 'like', "%{$search_bookings}%");
                        }
                    })
                    ->where('status','1')
                    ->where('master_user_id',$user_id)
                    ->get();
        if($Booking){
            foreach ($Booking as $b_key => $b_value) {
                $b_value->lab_name = $b_value->bookingProduct[0]->lab->lab_name;
                if($b_value->user_type=='1'){
                    $b_value->patient_name = $b_value->user->name.' '.$b_value->user->last_name;
                    $b_value->patient_id = $b_value->user->id;
                }else{
                    $b_value->patient_name = $b_value->familyMember->first_name.' '.$b_value->familyMember->last_name;
                    $b_value->patient_id = $b_value->familyMember->id;
                }
            }
        }
        return response()->json(['status'=>true, 'message'=>'Record found','data' =>$Booking]); 
    }

    public function searchReports(Request $request){
        $inputs     = $request->all();
        $user_id    = Auth::user()->id;
        //====Show report on dashboard====
        $TestReport = TestReport::where('user_id',$user_id)
                            ->whereHas('booking', function($query) use ($inputs){
                                $search_report = $inputs['search_report'];
                                $query->where('booking_id','like','%'. $search_report . '%');
                           })
                        ->get();
        //return $TestReport;
        foreach ($TestReport as $tr_key => $tr_value) {
            $tr_value->report_file_url = ImageHelper::getTestReportFile($tr_value->report_file);
            if($tr_value->bookingProduct){
                if($tr_value->bookingProduct->type=='1'){
                    if($tr_value->bookingProduct->test){
                        $tr_value->test_package_name = $tr_value->bookingProduct->test->test_name;
                    }else{
                        $tr_value->test_package_name = 'N/A';
                    }
                }else{
                    if($tr_value->bookingProduct->package){
                        $tr_value->test_package_name = $tr_value->bookingProduct->package->package_name;
                    }else{
                        $tr_value->test_package_name = 'N/A';
                    }  
                } 
            }else{
                $tr_value->test_package_name = 'N/A';
            }

            if($tr_value->booking){
                $tr_value->booking_id_show = $tr_value->booking->booking_id;
                if($tr_value->booking->user_type=='1'){
                    if($tr_value->booking->user){
                        $tr_value->patient_name = $tr_value->booking->user->name.' '.$tr_value->booking->user->last_name;
                        $tr_value->date_of_birth = $tr_value->booking->user->date_of_birth;
                    }else{
                        $tr_value->patient_name = 'N/A';
                        $tr_value->date_of_birth = 'N/A';
                    }   
                }else{
                    if($tr_value->booking->familyMember){
                        $tr_value->patient_name = $tr_value->booking->familyMember->first_name.' '.$tr_value->booking->familyMember->last_name;
                        $tr_value->date_of_birth = $tr_value->booking->familyMember->date_of_birth;
                    }else{
                        $tr_value->patient_name = 'N/A';
                        $tr_value->date_of_birth = 'N/A';
                    }
                }
            }else{
                $tr_value->booking_id_show = 'N/A';
            }
        }
        return response()->json(['status'=>true, 'message'=>'Record found','data' =>$TestReport]);
    }

    

    public function passowrdLink(Request $request){
        $inputs   = $request->all();
        //$inputs   = Request::all();
        $langData   = trans('front_end');
        $langData = $langData['Validation'];
        $user_id = Auth::id();

        $User  = User::find($user_id);
        $User->password_change_status='0';
        $User->save();
        
        $email_content = EmailTemplate::where('id', 1)->first();
        $searchArray = array("{user_name}", "{email}", "{reset_url}" , "{logo_url}" ,  "{site_url}");
        $replaceArray = array($User->name , $User->email, url('/dashboard?id='.encrypt(0)), url('/admin_assets/images/logo.png'), url('/'));
        $content = str_replace($searchArray, $replaceArray, $email_content->content);

        $email_data['name'] = $User->name;
        $email_data['email'] = $User->email;
        $email_data['subject'] = $email_content->subject;
        $email_data['content'] = $content;

        $inData['from_email']     =  'test1@gmail.com';
        $inData['subject']     =  $email_content->subject;
        $inData['email']     =  $User->email;

        Mail::send('admin.email_template.sendemail',$email_data, function ($message) use ($inData){
            $message->from($inData['from_email'],'Online Lab');
            $message->to($inData['email']);
            $message->subject($inData['subject']);
        });
        return response()->json(['status'=>true, 'message'=>$langData['passowrd_link_success']]);
    }
    public function updatePassword(Request $request){
        $inputs   = $request->all();
        //$inputs   = Request::all();
        $langData   = trans('front_end');
        $langData = $langData['Validation'];
        $user_id = Auth::id();
        $rules = [
            'old_password' => 'required|min:8',
            'new_password'      => 'min:8|required_with:confirm_password|same:confirm_password',
            'confirm_password'  => 'required|min:8',
        ];
        $this->validate($request,$rules);
        if (!(Hash::check($request->old_password, Auth::user()->password))) {
            return array('status' => false , 'message' => 'Your old password does not matches with the current password, Please try again');
        }
        if(strcmp($request->old_password, $request->new_password) == 0){
            return array('status' => false , 'message' => $langData['update_password_same']);
        }
        $User           = User::find($user_id);
        $User->password = Hash::make($request->new_password);
        $User->password_change_status='1';
        if($User->update()){
            return array('status' => true , 'message' => $langData['update_password_success'], 'data'=>url('dashboard'));
        }else{
            return array('status' => false , 'message' => $langData['update_password_error']);
        }
    }

    public function getBookingProduct(Request $request){
        $inputs = $request->all();
        $BookingProduct = BookingProduct::where('booking_id',$inputs['booking_id'])->get();
        if($BookingProduct){
            foreach ($BookingProduct as $bp_key => $bp_value) {
                $bp_value->lab_name = $bp_value->lab->lab_name;
                if($bp_value->type=='1'){
                    $bp_value->test_package_name = $bp_value->test->test_name;
                    $bp_value->test_package_name_ar = $bp_value->test->test_name_ar;
                }elseif($bp_value->type=='2'){
                    $bp_value->test_package_name = $bp_value->package->package_name;
                    $bp_value->test_package_name_ar = $bp_value->package->package_name_ar;
                }
                if($bp_value->test_status=='0'){
                    $test_status_show = 'Pending';
                }elseif($bp_value->test_status=='1'){
                    $test_status_show = 'Accepted';
                }elseif($bp_value->test_status=='2'){
                    $test_status_show = 'Rejected';
                }elseif($bp_value->test_status=='3'){
                    $test_status_show = 'Ready To Collect Sample';
                }elseif($bp_value->test_status=='4'){
                    $test_status_show = 'Sample Collected';
                }elseif($bp_value->test_status=='5'){
                    $test_status_show = 'Report Awaiting';
                }elseif($bp_value->test_status=='6'){
                    $test_status_show = 'Final Report';
                }else{
                    $test_status_show = 'No Status';
                }
                $bp_value->test_status_show = $test_status_show;
                $bp_value->price_show = 'KD '.$bp_value->price;
            }
            return array('status' => true , 'message' => 'Record found', 'data'=>$BookingProduct);
        }else{
            return array('status' => false , 'message' => 'Record not found');
        }
    }

    public function getNotification(Request $request){
        $inputs = $request->all();
        $user_id = Auth::user()->id;

        $Notification = Notification::where('receiver_id',$user_id)->orderBy('id','desc')->limit(10)->get();
        foreach ($Notification as $n_key => $n_value) {
            // $created_at = strtotime($n_value->created_at);
            // $n_value->created_at = date('Y-m-d', $created_at);
            
        }
        return ['status'=>true,'message'=>'Record found' ,'data'=>$Notification];
    }
    public function notificationCount(Request $request){
        $inputs = $request->all();
        $user_id = Auth::user()->id;
        $NotificationCount = Notification::where('receiver_id',$user_id)->where('read_status','0')->count();
        return ['status'=>true,'message'=>'Record found' ,'data'=>$NotificationCount];
    }
    public function changeNotificationStatus(Request $request){
        $inputs = $request->all();
        $id = $inputs['id'];
        $user_id = Auth::user()->id;
        $Notification = Notification::where('id',$id)->first();
        $Notification->read_status = '1';
        if($Notification->save()){
            $NotificationCount = Notification::where('receiver_id',$user_id)->where('read_status','0')->count();
            return ['status'=>true,'message'=>'Record found' ,'data'=>$Notification,'data2'=>$NotificationCount];
        }else{
            return ['status'=>false,'message'=>'Record not found'];
        }
    }
}
