<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\ContactUs;
use App\Models\ContactUsReplay;

use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;

class ContactUsController extends Controller{
    public function index(Request $request){
        $ContactUs = ContactUs::get();
        $data['ContactUs']=$ContactUs;
        return view('backend.contact_us.index')->with($data);
    }
    
    public function edit(Request $request , $id){
        $data['ContactUs']  = ContactUs::find($id);
        return view('backend.contact_us.edit')->with($data);
    }

    public function update(Request $request,$id){
        $inputs     = $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'subject'             => 'required',
            'message'             => 'required',
        ];
        $messages = [
            'subject.required'      => $Validation['subject'],
            'message.required'      => $Validation['message'],
        ];
        $this->validate($request,$rules,$messages);
        $ContactUsReplay                      = new ContactUsReplay();
        $ContactUsReplay->contact_us_id       = $id;
        $ContactUsReplay->subject             = $inputs['subject'];
        $ContactUsReplay->message             = $inputs['message'];
        if($ContactUsReplay->save()){
            return Redirect('backend/contact_us')->with('success',$Messages['message_send_success']);
        }else{
            return back()->with('error',$Messages['message_send_error']);
        }
    }
}
