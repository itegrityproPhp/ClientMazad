<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\Cms;
use App\Models\Level1;
use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class CmsController extends Controller{
   public function index(Request $request){
        $Cms = Cms::orderBy('id','desc')->get();
        $data['Cms']=$Cms;
        return view('backend.cms.index')->with($data);
    }

    public function create(Request $request){
        $data = [];
        return view('backend.cms.create')->with($data);
    }

    public function store(Request $request){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'type'                => 'required',
        ];
        $messages = [
            'type.required'         => $Validation['type'],
        ];
        $this->validate($request,$rules,$messages);
        $image=null;
        if($request->hasFile('image')) {
            $image = Str::random(10).'_'.time().'.'.request()->image->getClientOriginalExtension();
            request()->image->move(ImageHelper::$getCmsImagePath, $image);
        }
        $Cms                        = new Cms();
        $Cms->type                 = $inputs['type'];
        if(!empty($inputs['heading'])){
            $Cms->heading              = $inputs['heading'];  
        }
        if(!empty($inputs['heading_ar'])){
            $Cms->heading_ar              = $inputs['heading_ar'];  
        }
        if(!empty($inputs['description1'])){
            $Cms->description              = $inputs['description1'];  
        }
        if(!empty($inputs['description_ar'])){
            $Cms->description_ar              = $inputs['description_ar'];  
        }
        if($image){
            $Cms->image              = $image;  
        }
        if($Cms->save()){
            return Redirect('backend/cms')->with('success',$Messages['cms_add_success']);
        }else{
            return back()->with('error',$Messages['cms_add_error']);
        }
    }

    public function edit(Request $request , $id){
        $Cms          = Cms::find($id);
        $data['Cms']  = $Cms;
        return view('backend.cms.edit')->with($data);
    }

    public function update(Request $request,$id){
         $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'type'                => 'required',
        ];
        $messages = [
            'type.required'         => $Validation['type'],
        ];
        $this->validate($request,$rules,$messages);
        $image=null;
        if($request->hasFile('image')) {
            $image = Str::random(10).'_'.time().'.'.request()->image->getClientOriginalExtension();
            request()->image->move(ImageHelper::$getCmsImagePath, $image);
        }
        $Cms                        = Cms::find($id);
        $Cms->type                 = $inputs['type'];
        if(!empty($inputs['heading'])){
            $Cms->heading              = $inputs['heading'];  
        }
        if(!empty($inputs['heading_ar'])){
            $Cms->heading_ar              = $inputs['heading_ar'];  
        }
        if(!empty($inputs['description1'])){
            $Cms->description              = $inputs['description1'];  
        }
        if(!empty($inputs['description_ar'])){
            $Cms->description_ar              = $inputs['description_ar'];  
        }
        if($image){
            $Cms->image              = $image;  
        }
        if($Cms->save()){
            return Redirect('backend/cms')->with('success',$Messages['cms_update_success']);
        }else{
            return back()->with('error',$Messages['cms_update_error']);
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
        $Cms       =  Cms::find($id);
        if($Cms){
            // if(File::exists(ImageHelper::$getFormPath.$Form->form)){
            //     File::delete(ImageHelper::$getFormPath.$Form->form);
            // }
            if($Cms->delete()){
                return ['status'=>'success','message'=>$Messages['cms_delete_success']];
            }else{
                return ['status'=>'failed','message'=>$Messages['cms_delete_error']];
            }
        }
    }
}
