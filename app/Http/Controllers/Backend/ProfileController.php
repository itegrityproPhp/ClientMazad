<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Validation\Rule;
use App\Models\User;
use App\Models\EmailTemplate;
use Validator;
use Auth;
use Hash;
use Illuminate\Support\Facades\Mail;
use App\Mail\NotifyMail;
use Illuminate\Support\Str;
use App\Helpers\ImageHelper;
class ProfileController extends Controller{
    
    public function __construct(){
        $this->middleware('auth');
    }

    public function show(Request $request){
        try{
            $inputs   = $request->all();
            $user_id = Auth::id();
            $User = User::find($user_id);
            if($User){
                $User->profile_image_url = ImageHelper::getProfileImage($User->profile_image);
            }
            $data['user'] = $User;
            return view('backend.auth.profile')->with($data);
        }catch( \Exception $e) {
            //die('ganes');
            return  redirect()->route('500');
        }
    }

    public function update(Request $request){
        $user_id                    = Auth::id();
        $inputs   = $request->all();
        $rules = [
            'first_name'    => 'required',
            'last_name'     => 'required',
            'email'         => ['required', Rule::unique('users', 'email')->ignore($user_id, 'id')],
            'phone_number'  => ['required', Rule::unique('users', 'phone_number')->ignore($user_id, 'id')],
        ];
        $this->validate($request,$rules);
        //try{
            $profile_image=null;
            if($request->hasFile('profile_image')) {
                $profile_image = Str::random(10).'_'.time().'.'.request()->profile_image->getClientOriginalExtension();
                request()->profile_image->move(ImageHelper::$getProfileImagePath, $profile_image);
            }

            
            $User                       = User::find($user_id);
            $User->first_name           = $inputs['first_name'];
            $User->second_name          = $inputs['last_name'];
            $User->email                = $inputs['email'];
            $User->phone_number         = $inputs['phone_number'];
            if($profile_image){
                $User->profile_image    = $profile_image;
            }
            if($User->update()){
                return back()->with('success','Your profile updated successfully');
            }else{
                return back()->with('success','Your profile updated unsuccessfully');
            }
        // }catch( \Exception $e) {

        //     return  redirect()->route('500');
        // }
    }

    public function updatePassword(Request $request){
        $inputs   = $request->all();
        $rules = [
            'old_password'      => 'required',
            'new_password'      => 'min:8|required_with:confirm_password|same:confirm_password',
            'confirm_password'  => 'required|min:6',
        ];
        $this->validate($request,$rules);
        try{
            $user_id = Auth::id();
            if (!(Hash::check($request->old_password, Auth::user()->password))) {
                return back()->with('error','Your old password does not matches with the current password  , Please try again');
            }
            if(strcmp($request->old_password, $request->new_password) == 0){
                return back()->with('error','New password cannot be same as your current password,Please choose a different new password');
            }
            $User           = User::find($user_id);
            $User->password = Hash::make($request->new_password);
            if($User->update()){ 
                return redirect('backend/profile')->with('success','Your password updated successfully');
            }else{
                return redirect()->with('error','Your password updated unsuccessfully');
            }
        }catch( \Exception $e) {
            return  redirect()->route('500');
        }
    }

    public function updateProfileImage(Request $request){
        $user_id = Auth::id();
        $inputs   = $request->all();

        $rules = [
            'profile_image'      => 'required',
        ];

        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()){
            return array('status' => 'error' , 'message' => 'failed to update new_password'  , 'errors' => $validator->errors());
        }

        $file = $_FILES['profile_image'];
        $file_ext = pathinfo($file['name'], PATHINFO_EXTENSION);
        $file_tmp = $_FILES['profile_image']['tmp_name'];
        $imagename = str_random('10').'_'.time().'.'.$file_ext;
        $destinationPath = public_path(ImageHelper::$serviceImagePath);
        if(move_uploaded_file($file_tmp,$destinationPath.'/'.$imagename)){
            $User                   = User::find($user_id);
            $User->profile_image    = $imagename;
            $User->update();
          return response(['status' => true , 'message' => 'success' , 'data' => $data]);        
        }else{
          return response(['status' => false , 'message' => 'failed' ]);
        }
    }
}
