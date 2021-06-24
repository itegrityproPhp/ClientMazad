<?php
namespace App\Http\Controllers\FrontEnd;
//use Request;
use Illuminate\Http\Request;
use Illuminate\Contracts\Encryption\DecryptException;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Mail;
use App\Mail\NotifyMail;
use App\Models\Cms;
use App\Models\CmsContent;
use App\Models\ContactUs;
use App\Helpers\ImageHelper;
use App\Helpers\ApiHelper;
use App\Models\Page;
use App\Http\Controllers\Controller;
use DB;
use Session;
use Auth;
class HomeController extends Controller{
    public function index(Request $request){
        $data = [];
        $section_1 = Cms::where('type','section_1')->first();
        $section_2 = Cms::where('type','section_2')->first();
        $section_3 = Cms::where('type','section_3')->first();
        $section_4 = Cms::where('type','section_4')->first();
        $section_5 = Cms::where('type','section_5')->first();
        $section_6 = Cms::where('type','section_6')->first();
        $section_7 = Cms::where('type','section_7')->first();
        $section_8 = Cms::where('type','section_8')->first();
        $section_9 = Cms::where('type','section_9')->first();
        $section_10 = Cms::where('type','section_10')->first();
        $section_11 = Cms::where('type','section_11')->first();
        $data['section_1'] = $section_1;
        $data['section_2'] = $section_2;
        $data['section_3'] = $section_3;
        $data['section_4'] = $section_4;
        $data['section_5'] = $section_5;
        $data['section_6'] = $section_6;
        $data['section_7'] = $section_7;
        $data['section_8'] = $section_8;
        $data['section_9'] = $section_9;
        $data['section_10'] = $section_10;
        $data['section_11'] = $section_11;
        //return $data['section_2']->cmsContents;
        return view('frontend.index')->with($data);
    }
    public function terms_condition(Request $request){
        $data = Page::where('page_type','terms_conditions')->first();
        return view('frontend.terms_condition',compact('data'));
    }
    public function privacy_policy(Request $request){
        $data = Page::where('page_type','privacy_policy')->first();
        return view('frontend.privacy_policy',compact('data'));
    }
    public function storeContact(Request $request){
        $inputs     = $request->all();
        $langData   = trans('frontend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'first_name'            => 'required',
            'last_name'             => 'required',
            'email'                 => 'required',
            'phone_number'          => 'required',
            'subject'               => 'required',
            'message'               => 'required',
        ];
        $messages = [
            'first_name.required'           => $Validation['first_name'],
            'last_name.required'            => $Validation['last_name'],
            'email.required'                => $Validation['email'],
            'phone_number.required'         => $Validation['phone_number'],
            'subject.required'              => $Validation['subject'],
            'message.required'              => $Validation['message'],
        ];
        $this->validate($request,$rules,$messages);
        $ContactUs                       = new ContactUs();
        $ContactUs->first_name           = $inputs['first_name'];
        $ContactUs->last_name            = $inputs['last_name'];
        $ContactUs->phone_number         = $inputs['phone_number'];
        $ContactUs->subject              = $inputs['subject'];
        $ContactUs->message              = $inputs['message'];
        if($ContactUs->save()){
            return response()->json(['status'=>true, 'message'=>$Messages['contact_add_success']]);
            //return back()->with('success',$Messages['contact_add_success']);
        }else{
            return response()->json(['status'=>false, 'message'=>$Messages['contact_add_error']]);
            //return back()->with('error',$Messages['contact_add_error']);
        }
    }

    public function subscribeUs(Request $request){
        $inputs     = $request->all();
        $langData   = trans('frontend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $SubscribeUs = new SubscribeUs();
        $SubscribeUs->email = $inputs['email'];
        if($SubscribeUs->save()){
            return response()->json(['status'=>true, 'message'=>$langData['subscribe_us_success'],'data' =>$SubscribeUs]);
        }else{
            return response()->json(['status'=>false, 'message'=>$langData['subscribe_us_error']]);
        }   
    }   
}

