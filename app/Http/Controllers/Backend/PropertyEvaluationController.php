<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Property;
use App\Models\AgentTask;

use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class PropertyEvaluationController extends Controller{
   public function index(Request $request){
        $PropertyEvaluations = AgentTask::orderBy('id','desc')->get();
        $data['PropertyEvaluations']=$PropertyEvaluations;
        return view('backend.property_evaluation.index')->with($data);
    }

    public function view(Request $request , $id){
        $PropertyEvaluation          = AgentTask::find($id);
        $data['PropertyEvaluation']  = $PropertyEvaluation;
        return view('backend.property_evaluation.view')->with($data);
    }

    public function changeAgentTaskStatus(Request $request){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $AgentTask  = AgentTask::find($inputs['id']);
        if($inputs['status']=='1'){
            $AgentTask->status=$inputs['status'];
        }else{
            $AgentTask->status=$inputs['status'];
        }
        $AgentTask->save();
        if($AgentTask->save()){
            if($AgentTask->status=='1'){
                return response()->json(['status'=>true,'status_code'=>'200','message'=>$Messages['agent_task_accepted_success'],'data'=>$AgentTask,'error'=>[]], 200);
            }else{
                return response()->json(['status'=>true,'status_code'=>'200','message'=>$Messages['agent_task_rejected_success'],'data'=>$AgentTask,'error'=>[]], 200);
            }    
        }else{
            return response(['status' => false , 'status_code'=>'401', 'message' => $Messages['record_not_found'], 'data'=>(object)[], 'error'=>[]], 200);
        }
    }
}
