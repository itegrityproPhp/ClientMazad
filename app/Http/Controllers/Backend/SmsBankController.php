<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Api;
use App\Helpers\ImageHelper;
use App\Helpers\ApiHelper;

use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class SmsBankController extends Controller{
   public function index(Request $request){
        $Apis = Api::where('id','1')->orderBy('id','desc')->get();
        foreach ($Apis as $key => $value) {
            $getSMSBank = ApiHelper::getSMSBank($value->user_name,$value->password);
            $value->remaining_sms = $getSMSBank;
        }
        $data['Apis']=$Apis;
        return view('backend.sms_bank.index')->with($data);
    }
}
