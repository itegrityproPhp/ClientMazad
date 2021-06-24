<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\SocialMediaChanel;
use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class SocialMediaChanelController extends Controller{
    public function index(Request $request){
        $SocialMediaChanels = SocialMediaChanel::orderBy('id','desc')->get();
        $data['SocialMediaChanels']=$SocialMediaChanels;
        return view('backend.social_media_chanel.index')->with($data);
    }

    public function create(Request $request){
        $data = [];
        return view('backend.social_media_chanel.create')->with($data);
    }

    public function store(Request $request){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'title'                => 'required',
            'description'          => 'required',
            'link'                 => 'required',
            'user'                 => 'required',
            'password'             => 'required',
            'responsible_person'   => 'required',
            'called_him'           => 'required',
            'mobile'               => 'required',
            'location'             => 'required',
        ];
        $messages = [
            'title.required'                => $Validation['title'],
            'description.required'          => $Validation['description'],
            'link.required'                 => $Validation['link'],
            'user.required'                 => $Validation['user'],
            'password.required'             => $Validation['password'],
            'responsible_person.required'   => $Validation['responsible_person'],
            'called_him.required'           => $Validation['called_him'],
            'mobile.required'               => $Validation['mobile'],
            'location.required'             => $Validation['location'],

        ];
        $this->validate($request,$rules,$messages);
        $SocialMediaChanel                          = new SocialMediaChanel();
        $SocialMediaChanel->title                   = $inputs['title'];
        $SocialMediaChanel->description             = $inputs['description'];
        $SocialMediaChanel->link                    = $inputs['link'];
        $SocialMediaChanel->user                    = $inputs['user'];
        $SocialMediaChanel->password                = $inputs['password'];
        $SocialMediaChanel->responsible_person      = $inputs['responsible_person'];
        $SocialMediaChanel->called_him              = $inputs['called_him'];
        $SocialMediaChanel->mobile                  = $inputs['mobile'];
        $SocialMediaChanel->location                = $inputs['location'];
        if($SocialMediaChanel->save()){
            return Redirect('backend/social_media_chanel')->with('success',$Messages['social_media_chanel_add_success']);
        }else{
            return back()->with('error',$Messages['social_media_chanel_add_error']);
        }
    }

    public function edit(Request $request , $id){
        $SocialMediaChanel          = SocialMediaChanel::find($id);
        $data['SocialMediaChanel']  = $SocialMediaChanel;
        return view('backend.social_media_chanel.edit')->with($data);
    }

    public function update(Request $request,$id){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'title'                => 'required',
            'description'          => 'required',
            'link'                 => 'required',
            'user'                 => 'required',
            'password'             => 'required',
            'responsible_person'   => 'required',
            'called_him'           => 'required',
            'mobile'               => 'required',
            'location'             => 'required',
        ];
        $messages = [
            'title.required'                => $Validation['title'],
            'description.required'          => $Validation['description'],
            'link.required'                 => $Validation['link'],
            'user.required'                 => $Validation['user'],
            'password.required'             => $Validation['password'],
            'responsible_person.required'   => $Validation['responsible_person'],
            'called_him.required'           => $Validation['called_him'],
            'mobile.required'               => $Validation['mobile'],
            'location.required'             => $Validation['location'],

        ];
        $this->validate($request,$rules,$messages);
        $SocialMediaChanel                      = SocialMediaChanel::find($id);
        $SocialMediaChanel->title                   = $inputs['title'];
        $SocialMediaChanel->description             = $inputs['description'];
        $SocialMediaChanel->link                    = $inputs['link'];
        $SocialMediaChanel->user                    = $inputs['user'];
        $SocialMediaChanel->password                = $inputs['password'];
        $SocialMediaChanel->responsible_person      = $inputs['responsible_person'];
        $SocialMediaChanel->called_him              = $inputs['called_him'];
        $SocialMediaChanel->mobile                  = $inputs['mobile'];
        $SocialMediaChanel->location                = $inputs['location'];
        if($SocialMediaChanel->save()){
            return Redirect('backend/social_media_chanel')->with('success',$Messages['social_media_chanel_update_success']);
        }else{
            return back()->with('error',$Messages['social_media_chanel_update_error']);
        }
    }

    public function view(Request $request , $id){
        $data['SocialMediaChanel']  = SocialMediaChanel::find($id);
        return view('backend.social_media_chanel.view')->with($data);
    }
    public function destroy(Request $request,$id){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $SocialMediaChanel       =  SocialMediaChanel::find($id);
        if($SocialMediaChanel){
            // if(File::exists(ImageHelper::$getFormPath.$Form->form)){
            //     File::delete(ImageHelper::$getFormPath.$Form->form);
            // }
            if($SocialMediaChanel->delete()){
                return ['status'=>'success','message'=>$Messages['social_media_chanel_delete_success']];
            }else{
                return ['status'=>'failed','message'=>$Messages['social_media_chanel_delete_error']];
            }
        }
    }

    public function activeInactive(Request $request){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $SocialMediaChanel  = SocialMediaChanel::find($inputs['id']);
        if($inputs['status']=='1'){
            $SocialMediaChanel->status=$inputs['status'];
        }else{
            $SocialMediaChanel->status=$inputs['status'];
        }
        $SocialMediaChanel->save();
        if($SocialMediaChanel->save()){
            if($SocialMediaChanel->status=='1'){
                return response()->json(['status'=>true,'status_code'=>'200','message'=>$Messages['social_media_chanel_active_success'],'data'=>$SocialMediaChanel,'error'=>[]], 200);
            }else{
                return response()->json(['status'=>true,'status_code'=>'200','message'=>$Messages['social_media_chanel_inactive_success'],'data'=>$SocialMediaChanel,'error'=>[]], 200);
            }    
        }else{
            return response(['status' => false , 'status_code'=>'401', 'message' => $Messages['record_not_found'], 'data'=>(object)[], 'error'=>[]], 200);
        }
    }
}