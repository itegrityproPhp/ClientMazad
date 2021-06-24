<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Mail;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\WalletTranction;
use App\Helpers\ImageHelper;
use App\Helpers\ApiHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;

class WalletController extends Controller{
    public function Bidder(Request $request){
        $Bidders = User::whereIn('role',['2'])->orderBy('id','desc')->get();
        foreach ($Bidders as $key => $value) {
            $value->profile_image=ImageHelper::getProfileImage($value->profile_image);
        }
        $data['Bidders']=$Bidders;
        return view('backend.wallet.bidder')->with($data);
    }
    public function Auctioner(Request $request){
        $Auctioners = User::whereIn('role',['3'])->orderBy('id','desc')->get();
        foreach ($Auctioners as $key => $value) {
            $value->profile_image=ImageHelper::getProfileImage($value->profile_image);
        }
        $data['Auctioners']=$Auctioners;
        return view('backend.wallet.auctioner')->with($data);
    }
    public function evaluator(Request $request){
        $Evaluators = User::whereIn('role',['4'])->orderBy('id','desc')->get();
        foreach ($Evaluators as $key => $value) {
            $value->profile_image=ImageHelper::getProfileImage($value->profile_image);
        }
        $data['Evaluators']=$Evaluators;
        return view('backend.wallet.evaluator')->with($data);
    }
    public function Tranction(Request $request,$id){
        $WalletTranctions = WalletTranction::where('user_id',$id)->orderBy('id','desc')->get();
        $data['WalletTranctions']=$WalletTranctions;
        //return $data;
        return view('backend.wallet.tranction')->with($data);
    }
      
}