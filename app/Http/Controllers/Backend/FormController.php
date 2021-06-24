<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Form;
use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class FormController extends Controller{
   public function index(Request $request){
        $Forms = Form::orderBy('id','desc')->get();
        $data['Forms']=$Forms;
        return view('backend.form.index')->with($data);
    }

    public function create(Request $request){
        $data = [];
        return view('backend.form.create')->with($data);
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
            'form'                => 'required',
        ];
        $messages = [
            'title.required'         => $Validation['title'],
            'title_ar.required'      => $Validation['title_ar'],
            'form.required'          => $Validation['form'],
        ];
        $this->validate($request,$rules,$messages);
        $form=null;
        if($request->hasFile('form')) {
            $form = Str::random(10).'_'.time().'.'.request()->form->getClientOriginalExtension();
            request()->form->move(ImageHelper::$getFormPath, $form);
        }
        $Form                        = new Form();
        $Form->title                 = $inputs['title'];
        $Form->title_ar              = $inputs['title_ar'];
        if($form){
            $Form->form                = $form; 
        }
        
        if($Form->save()){
            return Redirect('backend/form')->with('success',$Messages['form_add_success']);
        }else{
            return back()->with('error',$Messages['form_add_error']);
        }
    }

    public function edit(Request $request , $id){
        $Form          = Form::find($id);
        $data['Form']  = $Form;
        return view('backend.form.edit')->with($data);
    }

    public function update(Request $request,$id){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'title'                => 'required',
            'title_ar'             => 'required',
        ];
        $messages = [
            'title.required'         => $Validation['title'],
            'title_ar.required'      => $Validation['title_ar'],
        ];
        $this->validate($request,$rules,$messages);
        $media=null;
        if($request->hasFile('media')) {
            $media = Str::random(10).'_'.time().'.'.request()->media->getClientOriginalExtension();
            request()->media->move(ImageHelper::$getFormPath, $media);
        }

        $Form                       = Form::find($id);
        $Form->title                = $inputs['title'];
        $Form->title_ar             = $inputs['title_ar'];
        if($media){
            $Form->media                = $media; 
        }
        
        if($Form->save()){
            return Redirect('backend/form')->with('success',$Messages['form_update_success']);
        }else{
            return back()->with('error',$Messages['form_update_error']);
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
        $Form       =  Form::find($id);
        if($Form){
            if(File::exists(ImageHelper::$getFormPath.$Form->form)){
                File::delete(ImageHelper::$getFormPath.$Form->form);
            }
            if($Form->delete()){
                return ['status'=>'success','message'=>$Messages['form_delete_success']];
            }else{
                return ['status'=>'failed','message'=>$Messages['form_delete_error']];
            }
        }
    }
}
