<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\Setting;
use App\Models\Role;
use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class SettingController extends Controller{
    public function index(Request $request){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $Roles             = Role::where('type','3')->get()->pluck('name','id')->prepend('Select Role','');
        $Setting    = Setting::orderBy('id','desc')->first();
        $data['Setting']=$Setting;
        $data['Roles']=$Roles;
        return view('backend.setting.index')->with($data);
    }

    public function update(Request $request,$id){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'role'          => 'required',
            'email'         => 'required',
            'phone_number'  => 'required',
            'address'       => 'required',
            'address_ar'    => 'required',
            'location'      => 'required',
        ];
        $messages = [
            'role.required'             => $Validation['role'],
            'email.required'            => $Validation['email'],
            'phone_number.required'     => $Validation['phone_number'],
            'address.required'          => $Validation['address'],
            'address_ar.required'       => $Validation['address_ar'],
            'location.required'         => $Validation['location'],
        ];
        $this->validate($request,$rules,$messages);

        $logo=null;
        if($request->hasFile('logo')) {
            $logo = Str::random(10).'_'.time().'.'.request()->logo->getClientOriginalExtension();
            request()->logo->move(ImageHelper::$getLogoPath, $logo);
        }
        $Setting                   = Setting::find($id);
        if($logo){
            $Setting->logo    = $logo;
        }
        $Setting->role_id          = $inputs['role'];
        $Setting->email            = $inputs['email'];
        $Setting->phone_number     = $inputs['phone_number'];
        $Setting->address          = $inputs['address'];
        $Setting->address_ar       = $inputs['address_ar'];
        $Setting->location         = $inputs['location'];
        if(!empty($inputs['lat'])){
            $Setting->lat         = $inputs['lat'];
        }
        if(!empty($inputs['lng'])){
            $Setting->lng         = $inputs['lng'];
        }
        if(!empty($inputs['description'])){
            $Setting->description         = $inputs['description'];
        }
        if(!empty($inputs['description_ar'])){
            $Setting->description_ar         = $inputs['description_ar'];
        }
        if(!empty($inputs['facebook_link'])){
            $Setting->facebook_link         = $inputs['facebook_link'];
        }
        if(!empty($inputs['twitter_link'])){
            $Setting->twitter_link         = $inputs['twitter_link'];
        }
        if(!empty($inputs['instagram_link'])){
            $Setting->instagram_link         = $inputs['instagram_link'];
        }
        if(!empty($inputs['pinterest_link'])){
            $Setting->pinterest_link         = $inputs['pinterest_link'];
        }
        if(!empty($inputs['admin_footer'])){
            $Setting->admin_footer         = $inputs['admin_footer'];
        }
        if(!empty($inputs['vat_rate'])){
            $Setting->vat_rate         = $inputs['vat_rate'];
        }
        if(!empty($inputs['tax_rate'])){
            $Setting->tax_rate         = $inputs['tax_rate'];
        }
        if(!empty($inputs['live_broadcast_fee'])){
            $Setting->live_broadcast_fee         = $inputs['live_broadcast_fee'];
        }
        if(!empty($inputs['insurance_amount'])){
            $Setting->insurance_amount         = $inputs['insurance_amount'];
        }
        if(!empty($inputs['judicial_agent_deal'])){
            $Setting->judicial_agent_deal         = $inputs['judicial_agent_deal'];
        }
        if(!empty($inputs['evaluator_fee'])){
            $Setting->evaluator_fee         = $inputs['evaluator_fee'];
        }
        if(!empty($inputs['market_share_deal'])){
            $Setting->market_share_deal         = $inputs['market_share_deal'];
        }
        if(!empty($inputs['financial_recovery_marketer'])){
            $Setting->financial_recovery_marketer         = $inputs['financial_recovery_marketer'];
        }
        if(!empty($inputs['residents_deal'])){
            $Setting->residents_deal         = $inputs['residents_deal'];
        }
        if(!empty($inputs['auction_cancellation_fee'])){
            $Setting->auction_cancellation_fee         = $inputs['auction_cancellation_fee'];
        }
        
        if(!empty($inputs['commission_for_auction'])){
            $Setting->commission_for_auction         = $inputs['commission_for_auction'];
        }
        if(!empty($inputs['commission_for_sale_prop'])){
            $Setting->commission_for_sale_prop         = $inputs['commission_for_sale_prop'];
        }
        if(!empty($inputs['commission_for_forced_auction'])){
            $Setting->commission_for_forced_auction         = $inputs['commission_for_forced_auction'];
        }
        if(!empty($inputs['commission_for_rented_prop'])){
            $Setting->commission_for_rented_prop         = $inputs['commission_for_rented_prop'];
        }
        if(isset($inputs['auth_desc_app'])){
            $Setting->auth_desc_app         = $inputs['auth_desc_app'];
        }
        if(isset($inputs['auth_desc_app_ar'])){
            $Setting->auth_desc_app_ar         = $inputs['auth_desc_app_ar'];
        }
        
        $Setting->notification_sett = $inputs['notification_sett'];
        
        if($Setting->update()){
            
            return Redirect('backend/setting')->with('success',$Messages['setting_update_success']);
        }else{
            return back()->with('error',$Messages['setting_update_error']);
        }
    }
}
