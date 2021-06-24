<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\Payment;
use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class PaymentController extends Controller{
    public function index(Request $request){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $Payment    = Payment::orderBy('id','desc')->first();
        $data['Payment']=$Payment;
        //return $data;
        return view('backend.payment.index')->with($data);
    }

    public function update(Request $request,$id){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $Payment                   = Payment::find($id);
        if(!empty($inputs['iban'])){
            $Payment->iban            = $inputs['iban'];
        }
        if(!empty($inputs['country_code'])){
            $Payment->country_code            = $inputs['country_code'];
        }
        if(!empty($inputs['bank_code'])){
            $Payment->bank_code            = $inputs['bank_code'];
        }
        if(!empty($inputs['bank_account_number'])){
            $Payment->bank_account_number            = $inputs['bank_account_number'];
        }
        if(!empty($inputs['bank_account_name'])){
            $Payment->bank_account_name            = $inputs['bank_account_name'];
        }
        if(!empty($inputs['bank_name'])){
            $Payment->bank_name            = $inputs['bank_name'];
        }
        if(!empty($inputs['bank_address'])){
            $Payment->bank_address            = $inputs['bank_address'];
        }
        if(!empty($inputs['terminal_id'])){
            $Payment->terminal_id            = $inputs['terminal_id'];
        }
        if(!empty($inputs['password'])){
            $Payment->password            = $inputs['password'];
        }
        if(!empty($inputs['merchant_key'])){
            $Payment->merchant_key            = $inputs['merchant_key'];
        }
        if($Payment->update()){
            return Redirect('backend/payment')->with('success',$Messages['payment_update_success']);
        }else{
            return back()->with('error',$Messages['payment_update_error']);
        }
    }
}
