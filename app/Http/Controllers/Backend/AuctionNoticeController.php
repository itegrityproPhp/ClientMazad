<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Property;
use App\Models\Notification;

use App\Helpers\ImageHelper;
use App\Helpers\ApiHelper;

use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class AuctionNoticeController extends Controller{
   public function index(Request $request){
        $notification_type = ['new_auction', 'update_auction'];
        $AuctionNotices = Notification::whereIn('notification_type',$notification_type)->orderBy('id','desc')->get();
        foreach ($AuctionNotices as $key => $value) {
            $value->time_elapsed_string = ApiHelper::timeElapsedString($value->created_at,false);
            $json_data           = json_decode($value->json_data);
            if($json_data){
                if(isset($json_data->property_id)){
                    $Property = Property::where('id',$json_data->property_id)->first();
                }else{
                    $Property = [];
                }
            }else{
                $Property = [];
            }
            $value->property = $Property;
        }
        //return $AuctionNotices;
        $data['AuctionNotices']=$AuctionNotices;
        return view('backend.auction_notice.index')->with($data);
    }

    public function view(Request $request , $id){
        $AuctionNotice          = Notification::find($id);
        if($AuctionNotice){
            $AuctionNotice->time_elapsed_string = ApiHelper::timeElapsedString($AuctionNotice->created_at,false);
            $json_data           = json_decode($AuctionNotice->json_data);
            if($json_data){
                if(isset($json_data->property_id)){
                    $Property = Property::where('id',$json_data->property_id)->first();
                }else{
                    $Property = [];
                }
            }else{
                $Property = [];
            }
            $AuctionNotice->property = $Property;
        }
        $data['AuctionNotice']  = $AuctionNotice;
        return view('backend.auction_notice.view')->with($data);
    }

    // public function changeAgentTaskStatus(Request $request){
    //     $inputs     =  $request->all();
    //     $langData   = trans('backend');
    //     $Validation = $langData['Validation'];
    //     $Messages   = $langData['Messages'];
    //     $AgentTask  = AgentTask::find($inputs['id']);
    //     if($inputs['status']=='1'){
    //         $AgentTask->status=$inputs['status'];
    //     }else{
    //         $AgentTask->status=$inputs['status'];
    //     }
    //     $AgentTask->save();
    //     if($AgentTask->save()){
    //         if($AgentTask->status=='1'){
    //             return response()->json(['status'=>true,'status_code'=>'200','message'=>$Messages['agent_task_accepted_success'],'data'=>$AgentTask,'error'=>[]], 200);
    //         }else{
    //             return response()->json(['status'=>true,'status_code'=>'200','message'=>$Messages['agent_task_rejected_success'],'data'=>$AgentTask,'error'=>[]], 200);
    //         }    
    //     }else{
    //         return response(['status' => false , 'status_code'=>'401', 'message' => $Messages['record_not_found'], 'data'=>(object)[], 'error'=>[]], 200);
    //     }
    // }
}
