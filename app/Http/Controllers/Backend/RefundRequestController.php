<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Mail;
use App\Http\Controllers\Controller;
use App\Models\PropertyRefundRequest;
use App\Helpers\ImageHelper;
use App\Helpers\ApiHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;

class RefundRequestController extends Controller{
    public function Bidder(Request $request){
        $role = '';
        $Bidders = PropertyRefundRequest::whereHas('user', function( $query ) use ( $role){
                                            $query->whereIn('role',['2']);
                                        })
                                        ->orderBy('id','desc')
                                        ->get();
        foreach ($Bidders as $key => $value) {
            // if($value->user){
            //     $value->profile_image=ImageHelper::getProfileImage($value->profile_image);
            // }
            
        }
        $data['Bidders']=$Bidders;
        return view('backend.refund_request.bidder')->with($data);
    }
    public function Auctioner(Request $request){
        $role = '';
        $Bidders = PropertyRefundRequest::whereHas('user', function( $query ) use ( $role){
                                            $query->whereIn('role',['3']);
                                        })
                                        ->orderBy('id','desc')
                                        ->get();
        foreach ($Bidders as $key => $value) {
            // if($value->user){
            //     $value->profile_image=ImageHelper::getProfileImage($value->profile_image);
            // }
            
        }
        $data['Bidders']=$Bidders;
        return view('backend.refund_request.auctioner')->with($data);
    }
    public function evaluator(Request $request){
        $role = '';
        $Bidders = PropertyRefundRequest::whereHas('user', function( $query ) use ( $role){
                                            $query->whereIn('role',['4']);
                                        })
                                        ->orderBy('id','desc')
                                        ->get();
        foreach ($Bidders as $key => $value) {
            // if($value->user){
            //     $value->profile_image=ImageHelper::getProfileImage($value->profile_image);
            // }
            
        }
        $data['Bidders']=$Bidders;
        return view('backend.refund_request.evaluator')->with($data);
    }
    public function changeRefundStatus(Request $request){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $PropertyRefundRequest  = PropertyRefundRequest::find($inputs['id']);
        if($inputs['status']=='1'){
            $PropertyRefundRequest->status=$inputs['status'];
        }else{
            $PropertyRefundRequest->status=$inputs['status'];
        }
        $PropertyRefundRequest->save();
        if($PropertyRefundRequest->save()){
            if($PropertyRefundRequest->status=='1'){
                return response()->json(['status'=>true,'status_code'=>'200','message'=>$Messages['refunded_success'],'data'=>$PropertyRefundRequest,'error'=>[]], 200);
            }else{
                return response()->json(['status'=>true,'status_code'=>'200','message'=>$Messages['refund_rejected_success'],'data'=>$PropertyRefundRequest,'error'=>[]], 200);
            }    
        }else{
            return response(['status' => false , 'status_code'=>'401', 'message' => $Messages['record_not_found'], 'data'=>(object)[], 'error'=>[]], 200);
        }
    }  
}