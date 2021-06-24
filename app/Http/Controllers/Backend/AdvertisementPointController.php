<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\AdvertisementPoint;
use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class AdvertisementPointController extends Controller{
   public function index(Request $request){
        $AdvertisementPoints = AdvertisementPoint::orderBy('id','desc')->get();
        $data['AdvertisementPoints']=$AdvertisementPoints;
        return view('backend.advertisement_point.index')->with($data);
    }

    public function create(Request $request){
        $data = [];
        return view('backend.advertisement_point.create')->with($data);
    }

    public function store(Request $request){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'user_name'                => 'required',
            'phone_number'             => 'required',
            'email'                    => 'required',
            'ads_point'                => 'required',
            'comment'                  => 'required',
            'date'                     => 'required',
        ];
        $messages = [
            'user_name.required'         => $Validation['user_name'],
            'phone_number.required'      => $Validation['phone_number'],
            'email.required'             => $Validation['email'],
            'ads_point.required'         => $Validation['ads_point'],
            'comment.required'           => $Validation['comment'],
            'date.required'              => $Validation['date'],
        ];
        $this->validate($request,$rules,$messages);
        $AdvertisementPoint                       = new AdvertisementPoint();
        $AdvertisementPoint->user_name            = $inputs['user_name'];
        $AdvertisementPoint->phone_number         = $inputs['phone_number'];
        $AdvertisementPoint->email                = $inputs['email'];
        $AdvertisementPoint->ads_point            = $inputs['ads_point'];
        $AdvertisementPoint->comment              = $inputs['comment'];
        $AdvertisementPoint->date                 = $inputs['date'];
        if($AdvertisementPoint->save()){
            return Redirect('backend/advertisement_point')->with('success',$Messages['advertisement_point_add_success']);
        }else{
            return back()->with('error',$Messages['advertisement_point_add_error']);
        }
    }

    public function edit(Request $request , $id){
        $AdvertisementPoint          = AdvertisementPoint::find($id);
        $data['AdvertisementPoint']  = $AdvertisementPoint;
        return view('backend.advertisement_point.edit')->with($data);
    }

    public function update(Request $request,$id){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'user_name'                => 'required',
            'phone_number'             => 'required',
            'email'                    => 'required',
            'ads_point'                => 'required',
            'comment'                  => 'required',
            'date'                     => 'required',
        ];
        $messages = [
            'user_name.required'         => $Validation['user_name'],
            'phone_number.required'      => $Validation['phone_number'],
            'email.required'             => $Validation['email'],
            'ads_point.required'         => $Validation['ads_point'],
            'comment.required'           => $Validation['comment'],
            'date.required'              => $Validation['date'],
        ];
        $this->validate($request,$rules,$messages);
        $AdvertisementPoint                       = AdvertisementPoint::find($id);
        $AdvertisementPoint->user_name            = $inputs['user_name'];
        $AdvertisementPoint->phone_number         = $inputs['phone_number'];
        $AdvertisementPoint->email                = $inputs['email'];
        $AdvertisementPoint->ads_point            = $inputs['ads_point'];
        $AdvertisementPoint->comment              = $inputs['comment'];
        $AdvertisementPoint->date                 = $inputs['date'];
        if($AdvertisementPoint->save()){
            return Redirect('backend/advertisement_point')->with('success',$Messages['advertisement_point_update_success']);
        }else{
            return back()->with('error',$Messages['advertisement_point_update_error']);
        }
    }

    // public function view(Request $request , $id){
    //     $data['city']  = City::find($id);
    //     $data['js'] = ['city/view.js'];
    //     return view('admin.city.view',compact('data'));
    // }
    public function destroy(Request $request,$id){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $AdvertisementPoint       =  AdvertisementPoint::find($id);
        if($AdvertisementPoint){
            // if(File::exists(ImageHelper::$getFormPath.$Form->form)){
            //     File::delete(ImageHelper::$getFormPath.$Form->form);
            // }
            if($AdvertisementPoint->delete()){
                return ['status'=>'success','message'=>$Messages['advertisement_point_delete_success']];
            }else{
                return ['status'=>'failed','message'=>$Messages['advertisement_point_delete_error']];
            }
        }
    }

    public function activeInactive(Request $request){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $AdvertisementPoint  = AdvertisementPoint::find($inputs['id']);
        if($inputs['point_status']=='1'){
            $AdvertisementPoint->point_status=$inputs['point_status'];
        }else{
            $AdvertisementPoint->point_status=$inputs['point_status'];
        }
        if($AdvertisementPoint->save()){
            if($AdvertisementPoint->point_status=='1'){
                return response()->json(['status'=>true,'status_code'=>'200','message'=>$Messages['advertisement_point_active_success'],'data'=>$AdvertisementPoint,'error'=>[]], 200);
            }else{
                return response()->json(['status'=>true,'status_code'=>'200','message'=>$Messages['advertisement_point_inactive_success'],'data'=>$AdvertisementPoint,'error'=>[]], 200);
            }    
        }else{
            return response(['status' => false , 'status_code'=>'401', 'message' => $Messages['record_not_found'], 'data'=>(object)[], 'error'=>[]], 200);
        }
    }
}
