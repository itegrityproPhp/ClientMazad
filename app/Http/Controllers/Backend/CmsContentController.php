<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\Cms;
use App\Models\CmsContent;
use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class CmsContentController extends Controller{
   public function index(Request $request){
        $CmsContents = CmsContent::orderBy('id','desc')->get();
        $data['CmsContents']=$CmsContents;
        return view('backend.cms_content.index')->with($data);
    }

    public function create(Request $request){
        $data = [];
        $Cms = Cms::all()->pluck('type','id')->prepend('Select Type','');
        $data['Cms'] = $Cms;
        return view('backend.cms_content.create')->with($data);
    }

    public function store(Request $request){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'type'              => 'required',
        ];
        $messages = [
            'type.required'     => $Validation['type'],
        ];
        $this->validate($request,$rules,$messages);
        $image=null;
        if($request->hasFile('image')) {
            $image = Str::random(10).'_'.time().'.'.request()->image->getClientOriginalExtension();
            request()->image->move(ImageHelper::$getCmsImagePath, $image);
        }
        $CmsContent                                 = new CmsContent();
        $CmsContent->cms_id                         = $inputs['type'];
        if(!empty($inputs['title'])){
            $CmsContent->title                      = $inputs['title'];  
        }
        if(!empty($inputs['title_ar'])){
            $CmsContent->title_ar                   = $inputs['title_ar'];  
        }
        if(!empty($inputs['description1'])){
            $CmsContent->description                = $inputs['description1'];  
        }
        if(!empty($inputs['description_ar'])){
            $CmsContent->description_ar             = $inputs['description_ar'];  
        }
        if(!empty($inputs['link'])){
            $CmsContent->link                       = $inputs['link'];  
        }
        if(!empty($inputs['first_name'])){
            $CmsContent->first_name                 = $inputs['first_name'];  
        }
        if(!empty($inputs['last_name'])){
            $CmsContent->last_name                  = $inputs['last_name'];  
        }
        if(!empty($inputs['role'])){
            $CmsContent->role                       = $inputs['role'];  
        }
        if(!empty($inputs['facebook_link'])){
            $CmsContent->facebook_link              = $inputs['facebook_link'];  
        }
        if(!empty($inputs['twitter_link'])){
            $CmsContent->twitter_link               = $inputs['twitter_link'];  
        }
        if(!empty($inputs['instagram_link'])){
            $CmsContent->instagram_link             = $inputs['instagram_link'];  
        }
        if($image){
            $CmsContent->image                      = $image;  
        }
        if($CmsContent->save()){
            return Redirect('backend/cms_content')->with('success',$Messages['cms_content_add_success']);
        }else{
            return back()->with('error',$Messages['cms_content_add_error']);
        }
    }

    public function edit(Request $request , $id){
        $Cms = Cms::all()->pluck('type','id')->prepend('Select Type','');
        $CmsContent          = CmsContent::find($id);
        $data['Cms']         = $Cms;
        $data['CmsContent']  = $CmsContent;
        return view('backend.cms_content.edit')->with($data);
    }

    public function update(Request $request,$id){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'type'              => 'required',
        ];
        $messages = [
            'type.required'     => $Validation['type'],
        ];
        $this->validate($request,$rules,$messages);
        $image=null;
        if($request->hasFile('image')) {
            $image = Str::random(10).'_'.time().'.'.request()->image->getClientOriginalExtension();
            request()->image->move(ImageHelper::$getCmsImagePath, $image);
        }
        $CmsContent                                 = CmsContent::find($id);
        $CmsContent->cms_id                         = $inputs['type'];
        if(!empty($inputs['title'])){
            $CmsContent->title                      = $inputs['title'];  
        }
        if(!empty($inputs['title_ar'])){
            $CmsContent->title_ar                   = $inputs['title_ar'];  
        }
        if(!empty($inputs['description1'])){
            $CmsContent->description                = $inputs['description1'];  
        }
        if(!empty($inputs['description_ar'])){
            $CmsContent->description_ar             = $inputs['description_ar'];  
        }
        if(!empty($inputs['link'])){
            $CmsContent->link                       = $inputs['link'];  
        }
        if(!empty($inputs['first_name'])){
            $CmsContent->first_name                 = $inputs['first_name'];  
        }
        if(!empty($inputs['last_name'])){
            $CmsContent->last_name                  = $inputs['last_name'];  
        }
        if(!empty($inputs['role'])){
            $CmsContent->role                       = $inputs['role'];  
        }
        if(!empty($inputs['facebook_link'])){
            $CmsContent->facebook_link              = $inputs['facebook_link'];  
        }
        if(!empty($inputs['twitter_link'])){
            $CmsContent->twitter_link               = $inputs['twitter_link'];  
        }
        if(!empty($inputs['instagram_link'])){
            $CmsContent->instagram_link             = $inputs['instagram_link'];  
        }
        if($image){
            $CmsContent->image                      = $image;  
        }
        if($CmsContent->save()){
            return Redirect('backend/cms_content')->with('success',$Messages['cms_content_update_success']);
        }else{
            return back()->with('error',$Messages['cms_content_update_error']);
        }
    }

    // public function view(Request $request , $id){
    //     $data['city']  = City::find($id);
    //     $data['js'] = ['city/view.js'];
    //     return view('admin.city.view',compact('data'));
    // }
    public function destroy(Request $request,$id){
        $inputs           =  $request->all();
        $langData         = trans('backend');
        $Validation       = $langData['Validation'];
        $Messages         = $langData['Messages'];
        $CmsContent       =  CmsContent::find($id);
        if($CmsContent){
            // if(File::exists(ImageHelper::$getFormPath.$Form->form)){
            //     File::delete(ImageHelper::$getFormPath.$Form->form);
            // }
            if($CmsContent->delete()){
                return ['status'=>'success','message'=>$Messages['cms_content_delete_success']];
            }else{
                return ['status'=>'failed','message'=>$Messages['cms_content_delete_error']];
            }
        }
    }
}
