<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\UserTraining;
use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class UserTrainingController extends Controller{
   public function index(Request $request){
        $UserTrainings = UserTraining::orderBy('id','desc')->get();
        $data['UserTrainings']=$UserTrainings;
        return view('backend.user_training.index')->with($data);
    }

    public function create(Request $request){
        $data = [];
        return view('backend.user_training.create')->with($data);
    }

    public function store(Request $request){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];

        $inputs   = $request->all();
        $rules = [
            'title'                => 'required',
            'title_ar'             => 'required',
            'content'              => 'required',
            'content_ar'           => 'required',
            'media'                => 'required',
        ];
        $messages = [
            'title.required'         => $Validation['title'],
            'title_ar.required'      => $Validation['title_ar'],
            'content.required'       => $Validation['content'],
            'content_ar.required'    => $Validation['content_ar'],
            'media.required'         => $Validation['media'],
        ];
        $this->validate($request,$rules,$messages);
        $media=null;
        if($request->hasFile('media')) {
            $media = Str::random(10).'_'.time().'.'.request()->media->getClientOriginalExtension();
            request()->media->move(ImageHelper::$getUserTrainingPath, $media);
        }
        $UserTraining                        = new UserTraining();
        $UserTraining->title                 = $inputs['title'];
        $UserTraining->title_ar              = $inputs['title_ar'];
        $UserTraining->content              = $inputs['content'];
        $UserTraining->content_ar           = $inputs['content_ar'];
        if($media){
            $UserTraining->media                = $media; 
        }
        
        if($UserTraining->save()){
            return Redirect('backend/user_training')->with('success',$Messages['user_training_add_success']);
        }else{
            return back()->with('error',$Messages['user_training_add_error']);
        }
    }

    public function edit(Request $request , $id){
        $UserTraining          = UserTraining::find($id);
        //return $UserTraining->media_url;
        $data['UserTraining']  = $UserTraining;
        return view('backend.user_training.edit')->with($data);
    }

    public function update(Request $request,$id){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'title'                => 'required',
            'title_ar'             => 'required',
            'content'              => 'required',
            'content_ar'           => 'required',
        ];
        $messages = [
            'title.required'         => $Validation['title'],
            'title_ar.required'      => $Validation['title_ar'],
            'content.required'       => $Validation['content'],
            'content_ar.required'    => $Validation['content_ar'],
        ];
        $this->validate($request,$rules,$messages);
        $media=null;
        if($request->hasFile('media')) {
            $media = Str::random(10).'_'.time().'.'.request()->media->getClientOriginalExtension();
            request()->media->move(ImageHelper::$getUserTrainingPath, $media);
        }

        $UserTraining                       = UserTraining::find($id);
        $UserTraining->title                = $inputs['title'];
        $UserTraining->title_ar             = $inputs['title_ar'];
        $UserTraining->content              = $inputs['content'];
        $UserTraining->content_ar           = $inputs['content_ar'];
        if($media){
            $UserTraining->media                = $media; 
        }
        
        if($UserTraining->save()){
            return Redirect('backend/user_training')->with('success',$Messages['user_training_update_success']);
        }else{
            return back()->with('error',$Messages['user_training_update_error']);
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
        $UserTraining =  UserTraining::find($id);
        if($UserTraining){
            if(File::exists(ImageHelper::$getUserTrainingPath.$UserTraining->media)){
                File::delete(ImageHelper::$getUserTrainingPath.$UserTraining->media);
            }
            if($UserTraining->delete()){
                return ['status'=>'success','message'=>$Messages['user_training_delete_success']];
            }else{
                return ['status'=>'failed','message'=>$Messages['user_training_delete_error']];
            }
        }
    }
}
