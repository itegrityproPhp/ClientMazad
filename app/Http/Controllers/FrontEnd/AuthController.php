<?php
namespace App\Http\Controllers\FrontEnd;
//use Request;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Cart;
use App\Models\EmailTemplate;
use Validator;
use Auth;
use Hash;
use File;
use App\Helpers\ImageHelper;
use App\Helpers\ApiHelper;
use Illuminate\Support\Facades\Mail;
use App\Mail\NotifyMail;

class AuthController extends Controller{
    
    public function registration(Request $request){
        $inputs   = $request->all();
        //$inputs   = Request::all();
        $langData   = trans('front_end');
        $langData = $langData['Validation'];

        $rules = [
            'first_name'              => 'required',
            'last_name'          => 'required',
            'email'             => 'required|email|unique:users',
            'phone_number'          => 'required',
            'user_name' => 'required',
            'civil_id_number'          => 'required',
            'upload_civil_id'     => 'required',
            //'civil_id_expiry_date'    => 'required',
            'gender'      => 'required',
        ];

        $message = [
            'first_name.required'   => $langData['first_name'],
            'last_name.required'    => $langData['last_name'],
            'email.required'        => $langData['email'],
            'email.email'           => $langData['email_email'],
            'email.unique'          => $langData['email_unique'],
            'phone_number.required'    => $langData['phone_number'],
            'user_name.required'       => $langData['user_name'],
            'civil_id_number.required'  => $langData['civil_id_number'],
            'upload_civil_id.required'  => $langData['upload_civil_id'],
            //'civil_id_expiry_date.required' => $langData['civil_id_expiry_date'],
            'gender.required' => $langData['gender'],
        ];

        $validator = Validator::make($inputs, $rules,$message);
        if ($validator->fails()) {
            $errors =  $validator->errors()->all();
            return response(['status' => false , 'message' => $errors[0]] , 200);              
        }
        $UserCheck =  User::where('phone_number',$inputs['phone_number'])->first();
        if($UserCheck){
            return response()->json(['status'=>false, 'message'=>$langData['phone_number_exist']]);
        }
        $upload_civil_id=null;
        if($request->hasFile('upload_civil_id')) {
            $upload_civil_id = Str::random(10).'_'.time().'.'.request()->upload_civil_id->getClientOriginalExtension();
            request()->upload_civil_id->move(public_path('uploads/contract_store/'), $upload_civil_id);
        }

        $password_show = Str::random(8);
        $password = Hash::make($password_show);
        $User                     = new User();
        $User->role               = '2';
        $User->name               = $inputs['first_name'];
        $User->last_name          = $inputs['last_name'];
        $User->email              = $inputs['email'];
        $User->phone_number        = $inputs['phone_number'];
        $User->username           = $inputs['user_name'];
        $User->civil_id_no      = $inputs['civil_id_number'];
        $User->upload_civil_id     = $inputs['upload_civil_id'];
        //$User->civil_id_expiry_date       = date("Y-m-d", strtotime($inputs['civil_id_expiry_date']));
        if($inputs['date_of_birth']){
            $User->date_of_birth       = date("Y-m-d", strtotime($inputs['date_of_birth']));
        }
        $User->gender    = $inputs['gender'];
        if($inputs['country_code']){
            $User->country_code      = $inputs['country_code'];
        }
        if($inputs['select_city']){
            $User->city_id      = $inputs['select_city'];
        }
        // if($inputs['address']){
        //     $User->address      = $inputs['address'];
        // }
        if($inputs['location']){
            $User->location      = $inputs['location'];
        }
        if($inputs['lat']){
            $User->lat      = $inputs['lat'];
        }
        if($inputs['lng']){
            $User->lng      = $inputs['lng'];
        }


        if($password){
            $User->password      = $password;
        }

        if($upload_civil_id){
            $User->upload_civil_id    = $upload_civil_id;
        }

        if($User->save()){
            $email_content = EmailTemplate::where('id', 11)->first();
            $searchArray = array("{user_name}", "{email}", "{password}", "{logo_url}" , "{site_url}");

            $replaceArray = array($User->name , $User->email, $password_show , url('/admin_assets/images/logo.png'), url('/'));

            $content = str_replace($searchArray, $replaceArray, $email_content->content);

            $email_data['name'] = $User->name;
            $email_data['email'] = $User->email;
            $email_data['passowrd'] = $password_show;
            $email_data['subject'] = $email_content->subject;
            $email_data['content'] = $content;

            $inData['from_email']     =  'test1@gmail.com';
            $inData['subject']     =  $email_content->subject;
            $inData['email']     =  $User->email;

            Mail::send('admin.email_template.sendemail',$email_data, function ($message) use ($inData) {
                $message->from($inData['from_email'],'Online Lab');
                $message->to($inData['email']);
                $message->subject($inData['subject']);
            });
            return response()->json(['status'=>true, 'message'=>$langData['registration_success'],'data' =>$User]);
        }else{
            return response()->json(['status'=>true, 'message'=>$langData['registration_error'],'data' =>'']);
        }
    }

    public function authLogin(Request $request){
        $inputs   = $request->all();
        //$inputs   = Request::all();
        $langData   = trans('front_end');
        $langData = $langData['Validation'];
        $rules = [ 
            'email'  => 'required',
            'password' => 'required',
        ];
        $message = [
            'email.required' => $langData['email'],
            //'email.email'  => $langData['email_email'],
            'password.required' => $langData['password'],
        ];
        $validator = Validator::make($inputs, $rules,$message);
        if ($validator->fails()) {
            $errors =  $validator->errors()->all();
            return response(['status' => false , 'message' => $errors[0]] , 200);              
        }
        
        $User =  User::where('email',$inputs['email'])->orWhere('phone_number',$inputs['email'])->where('role','2')->first();
        if($User){
            $credentials = array(
                'id' => $User->id,
                'password' => $inputs['password'],
                'role' => '2',
            );
            if (Auth::attempt($credentials)){  
                $ip_address = request()->ip();
                $Cart  =  Cart::where('user_type','2')->where('user_id',$ip_address)->get();
                if($Cart){
                    Cart::where('user_type','1')->where('user_id',Auth::user()->id)->delete();
                    $updateCart = [
                        'user_type' => '1',
                        'user_id' => Auth::user()->id,
                    ];
                    Cart::where('user_type','2')->where('user_id',$ip_address)->update($updateCart);
                }
                return response()->json(['status'=>true, 'message'=>$langData['login_success'],'data' =>$credentials]);
            }else{
                return response()->json(['status'=>false, 'message'=>$langData['login_error']]);
            }
        }else{
            return response()->json(['status'=>false, 'message'=>$langData['login_id_not_registerd']]);
        }
    }

    public function otpLogin(Request $request){
        $inputs   = $request->all();
        //$inputs   = Request::all();
        $langData   = trans('front_end');
        $langData = $langData['Validation'];
        $rules = [ 
            'email'             => 'required',
        ];
        $message = [
            'email.required' => $langData['email'],
            //'email.email'  => $langData['email_email'],
        ];
        $validator = Validator::make($inputs, $rules,$message);
        if ($validator->fails()) {
            $errors =  $validator->errors()->all();
            return response(['status' => false , 'message' => $errors[0]] , 200);              
        }
        $User =  User::where('email',$inputs['email'])->orWhere('phone_number',$inputs['email'])->where('role','2')->first();
        //$User =  User::where('email',$inputs['email'])->where('role','2')->first();
        if($User){
            $otpcode = ApiHelper::otpGenrator(6);
            $User->otp = $otpcode;
            $User->otp_verify_status = '0';
            $User->save();
            $id = $User->id;
            /*Email Code Here*/
            $email_content = EmailTemplate::where('id', 10)->first();
            $searchArray = array("{user_name}", "{email}", "{otp}", "{logo_url}" , "{site_url}");

            $replaceArray = array($User->name , $User->email, $otpcode , url('/admin_assets/images/logo.png'), url('/'));
            $content = str_replace($searchArray, $replaceArray, $email_content->content);

            $email_data['name'] = $User->name;
            $email_data['email'] = $User->email;
            $email_data['otp'] = $otpcode;
            $email_data['subject'] = $email_content->subject;
            $email_data['content'] = $content;

            $inData['from_email']     =  'test1@gmail.com';
            $inData['subject']     =  $email_content->subject;
            $inData['email']     =  $User->email;

            Mail::send('admin.email_template.sendemail',$email_data, function ($message) use ($inData) {
                $message->from($inData['from_email'],'Online Lab');
                $message->to($inData['email']);
                $message->subject($inData['subject']);
            });
            return response()->json(['status'=>true, 'message'=>$langData['otp_login_success'],'data' =>$id]);
        }else{
            return response()->json(['status'=>false, 'message'=>$langData['login_id_not_registerd']]);
        }
    }



    public function otpVerify(Request $request){
        $inputs   = $request->all();
        //$inputs   = Request::all();
        $langData   = trans('front_end');
        $langData = $langData['Validation'];
        $rules = [ 
            'otp'             => 'required',
            'user_id'             => 'required',
        ];
        $message = [
            'otp.required' => $langData['otp'],
            'user_id.required'  => $langData['user_id'],
        ];
        $validator = Validator::make($inputs, $rules);
        if ($validator->fails()) {
            $errors =  $validator->errors()->all();
            return response(['status' => false , 'message' => $errors[0]] , 200);              
        }
        $User = User::where('id',$inputs['user_id'])->where('otp',$inputs['otp'])->first();
        if($User){
            if(Auth::loginUsingId($User->id)){
                $ip_address = request()->ip();
                $Cart  =  Cart::where('user_type','2')->where('user_id',$ip_address)->get();
                if($Cart){
                    Cart::where('user_type','1')->where('user_id',Auth::user()->id)->delete();
                    $updateCart = [
                        'user_type' => '1',
                        'user_id' => Auth::user()->id,
                    ];
                    Cart::where('user_type','2')->where('user_id',$ip_address)->update($updateCart);
                }
                return response()->json(['status'=>true, 'message'=>$langData['otp_login_success'],'data' =>$User]);   
            }else{
                return response()->json(['status'=>false, 'message'=>$langData['otp_verify_error']]);
            }
        }else{
            return response()->json(['status'=>false, 'message'=>$langData['otp_verify_error']]);
        }
    }
}
