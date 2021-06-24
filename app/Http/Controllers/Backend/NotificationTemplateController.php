<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\NotificationTemplate;
use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class NotificationTemplateController extends Controller{
    public function index(Request $request){
        $NotificationTemplates = NotificationTemplate::orderBy('id','desc')->get();
        $data['NotificationTemplates']=$NotificationTemplates;
        return view('backend.notification_template.index')->with($data);
    }

    public function create(Request $request){
        $data = [];
        return view('backend.notification_template.create')->with($data);
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
            'template_type'        => 'required',
            
        ];
        $messages = [
            'title.required'            => $Validation['title'],
            'title_ar.required'         => $Validation['title_ar'],
            'content.required'          => $Validation['content'],
            'content_ar.required'       => $Validation['content_ar'],
            'template_type.required'    => $Validation['template_type'],
        ];
        $this->validate($request,$rules,$messages);
        $NotificationTemplate                  = new NotificationTemplate();
        $NotificationTemplate->title           = $inputs['title'];
        $NotificationTemplate->title_ar        = $inputs['title_ar'];
        $NotificationTemplate->content         = $inputs['content'];
        $NotificationTemplate->content_ar      = $inputs['content_ar'];
        $NotificationTemplate->template_type   = $inputs['template_type'];
        if($NotificationTemplate->save()){
            return Redirect('backend/notification_template')->with('success',$Messages['notification_template_add_success']);
        }else{
            return back()->with('error',$Messages['notification_template_add_error']);
        }
    }

    public function edit(Request $request , $id){
        $NotificationTemplate          = NotificationTemplate::find($id);
        $data['NotificationTemplate']  = $NotificationTemplate;
        return view('backend.notification_template.edit')->with($data);
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
            'template_type'        => 'required',
            
        ];
        $messages = [
            'title.required'            => $Validation['title'],
            'title_ar.required'         => $Validation['title_ar'],
            'content.required'          => $Validation['content'],
            'content_ar.required'       => $Validation['content_ar'],
            'template_type.required'    => $Validation['template_type'],
        ];
        $this->validate($request,$rules,$messages);
        
        $NotificationTemplate                       = NotificationTemplate::find($id);
        $NotificationTemplate->title                = $inputs['title'];
        $NotificationTemplate->title_ar             = $inputs['title_ar'];
        $NotificationTemplate->content              = $inputs['content'];
        $NotificationTemplate->content_ar           = $inputs['content_ar'];
        $NotificationTemplate->template_type        = $inputs['template_type'];
        if($NotificationTemplate->save()){
            return Redirect('backend/notification_template')->with('success',$Messages['notification_template_update_success']);
        }else{
            return back()->with('error',$Messages['notification_template_update_error']);
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
        $NotificationTemplate       =  NotificationTemplate::find($id);
        if($NotificationTemplate){
            if($NotificationTemplate->delete()){
                return ['status'=>'success','message'=>$Messages['notification_template_delete_success']];
            }else{
                return ['status'=>'failed','message'=>$Messages['notification_template_delete_error']];
            }
        }
    }
}
