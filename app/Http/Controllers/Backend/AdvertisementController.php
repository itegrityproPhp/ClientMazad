<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Country;
use App\Models\Advertiser;
use App\Models\Advertisement;
use App\Models\AdvertisementPlanTime;
use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class AdvertisementController extends Controller{
    public function index(Request $request){
        $Advertisements = Advertisement::orderBy('id','desc')->get();
        $data['Advertisements']=$Advertisements;
        return view('backend.advertisement.index')->with($data);
    }

    public function create(Request $request){
        $data = [];
        $Advertisers = Advertiser::all()->pluck('owner_name','id')->prepend('Select Advertiser','');
        $AdvertisementPlanTimes = AdvertisementPlanTime::all()->pluck('plan_name','id')->prepend('Select Advertisement Plan Time','');
        $data['Advertisers']                = $Advertisers;
        $data['AdvertisementPlanTimes']     = $AdvertisementPlanTimes;
        return view('backend.advertisement.create')->with($data);
    }

    public function store(Request $request){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'advertiser'            => 'required',
            'advertisement_plan'    => 'required',
            'advertisement'         => 'required',
            'link'                  => 'required',
            'start_date'            => 'required',
        ];
        $messages = [
            'advertiser.required'           => $Validation['advertiser'],
            'advertisement_plan.required'   => $Validation['advertisement_plan'],
            'advertisement.required'        => $Validation['advertisement'],
            'link.required'                 => $Validation['link'],
            'start_date.required'           => $Validation['start_date'],
        ];
        $this->validate($request,$rules,$messages);
        $advertisement=null;
        if($request->hasFile('advertisement')) {
            $advertisement = Str::random(10).'_'.time().'.'.request()->advertisement->getClientOriginalExtension();
            request()->advertisement->move(ImageHelper::$getAdvertisementPath, $advertisement);
        }
        $end_date = date('Y-m-d');
        $AdvertisementPlanTime = AdvertisementPlanTime::find($inputs['advertisement_plan']);
        if($AdvertisementPlanTime){
            if($AdvertisementPlanTime->days){
                $start_date = $inputs['start_date'];
                $end_date   = date('Y-m-d', strtotime($start_date. ' + '.$AdvertisementPlanTime->days.' days'));
            }
        }
        $Advertisement                          = new Advertisement();
        $Advertisement->advertiser_id           = $inputs['advertiser'];
        $Advertisement->advertisement_plan_id   = $inputs['advertisement_plan'];
        $Advertisement->link                    = $inputs['link'];;
        $Advertisement->start_date              = $inputs['start_date'];
        $Advertisement->end_date                = $end_date;
        if($advertisement){
            $Advertisement->advertisement       = $advertisement;
        }
        if($Advertisement->save()){
            return Redirect('backend/advertisement')->with('success',$Messages['advertisement_add_success']);
        }else{
            return back()->with('error',$Messages['advertisement_add_error']);
        }
    }

    public function edit(Request $request , $id){
        $data = [];
        $Advertisers = Advertiser::all()->pluck('owner_name','id')->prepend('Select Advertiser','');
        $AdvertisementPlanTimes = AdvertisementPlanTime::all()->pluck('plan_name','id')->prepend('Select Advertisement Plan Time','');
        
        $Advertisement                      = Advertisement::find($id);
        $data['Advertisers']                = $Advertisers;
        $data['AdvertisementPlanTimes']     = $AdvertisementPlanTimes;
        $data['Advertisement']              = $Advertisement;
        return view('backend.advertisement.edit')->with($data);
    }

    public function update(Request $request,$id){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'advertiser'            => 'required',
            'advertisement_plan'    => 'required',
            //'advertisement'         => 'required',
            'link'                  => 'required',
            'start_date'            => 'required',
        ];
        $messages = [
            'advertiser.required'           => $Validation['advertiser'],
            'advertisement_plan.required'   => $Validation['advertisement_plan'],
            //'advertisement.required'        => $Validation['advertisement'],
            'link.required'                 => $Validation['link'],
            'start_date.required'           => $Validation['start_date'],
        ];
        $this->validate($request,$rules,$messages);
        $advertisement=null;
        if($request->hasFile('advertisement')) {
            $advertisement = Str::random(10).'_'.time().'.'.request()->advertisement->getClientOriginalExtension();
            request()->advertisement->move(ImageHelper::$getAdvertisementPath, $advertisement);
        }
        $end_date = date('Y-m-d');
        $AdvertisementPlanTime = AdvertisementPlanTime::find($inputs['advertisement_plan']);
        if($AdvertisementPlanTime){
            if($AdvertisementPlanTime->days){
                $start_date = $inputs['start_date'];
                $end_date   = date('Y-m-d', strtotime($start_date. ' + '.$AdvertisementPlanTime->days.' days'));
            }
        }
        $Advertisement                          = Advertisement::find($id);
        $Advertisement->advertiser_id           = $inputs['advertiser'];
        $Advertisement->advertisement_plan_id   = $inputs['advertisement_plan'];
        $Advertisement->link                    = $inputs['link'];;
        $Advertisement->start_date              = $inputs['start_date'];
        $Advertisement->end_date                = $end_date;
        if($advertisement){
            $Advertisement->advertisement       = $advertisement;
        }
        if($Advertisement->save()){
            return Redirect('backend/advertisement')->with('success',$Messages['advertisement_update_success']);
        }else{
            return back()->with('error',$Messages['advertisement_update_error']);
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
        $Advertisement       =  Advertisement::find($id);
        if($Advertisement){
            // if(File::exists(ImageHelper::$getFormPath.$Form->form)){
            //     File::delete(ImageHelper::$getFormPath.$Form->form);
            // }
            if($Advertisement->delete()){
                return ['status'=>'success','message'=>$Messages['advertisement_delete_success']];
            }else{
                return ['status'=>'failed','message'=>$Messages['advertisement_delete_error']];
            }
        }
    }

    public function activeInactive(Request $request){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $Advertisement  = Advertisement::find($inputs['id']);
        if($inputs['status']=='1'){
            $Advertisement->status=$inputs['status'];
        }else{
            $Advertisement->status=$inputs['status'];
        }
        if($Advertisement->save()){
            if($Advertisement->status=='1'){
                return response()->json(['status'=>true,'status_code'=>'200','message'=>$Messages['advertisement_active_success'],'data'=>$Advertisement,'error'=>[]], 200);
            }else{
                return response()->json(['status'=>true,'status_code'=>'200','message'=>$Messages['advertisement_inactive_success'],'data'=>$Advertisement,'error'=>[]], 200);
            }    
        }else{
            return response(['status' => false , 'status_code'=>'401', 'message' => $Messages['record_not_found'], 'data'=>(object)[], 'error'=>[]], 200);
        }
    }
}