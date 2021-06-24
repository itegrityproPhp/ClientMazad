<?php
namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\EmailTemplate;

use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;

class EmailTemplateController extends Controller{
   public function index(Request $request){
        $email_templates = EmailTemplate::get();
        $number_key=1;
        foreach ($email_templates as $key => $value) {
            $value->number_key=$number_key;
            $number_key++;
        }
        $data['email_templates']=$email_templates;
        return view('admin.email_template.index',compact('data'));
    }
    
    public function edit(Request $request , $id){
        $data['email_template']  = EmailTemplate::find($id);
        $data['js'] = ['email_template/edit.js'];
        return view('admin.email_template.edit',compact('data'));
    }

    public function update(Request $request,$id){
        $input   = $request->all();
        $rules = [
            'title'              => 'required',
            'subject'           => 'required',
            'content'           => 'required',
        ];
        $this->validate($request,$rules);

        $EmailTemplate                     = EmailTemplate::find($id);
        $EmailTemplate->title              = $input['title'];
        $EmailTemplate->subject            = $input['subject'];
        $EmailTemplate->content            = $input['content'];
        if($EmailTemplate->save()){
            return back()->with('success','Email Template updated successfully');
        }else{
            return back()->with('error','Email Template updated failed , please try again');
        }
    }
}
