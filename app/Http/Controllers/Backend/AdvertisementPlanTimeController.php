<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\AdvertisementPlanTime;
use App\Models\AdvertisementCategory;
use App\Models\Country;
use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class AdvertisementPlanTimeController extends Controller{
   public function index(Request $request){
        $AdvertisementPlanTimes = AdvertisementPlanTime::orderBy('id','desc')->get();
        $data['AdvertisementPlanTimes']=$AdvertisementPlanTimes;
        return view('backend.advertisement_plan_time.index')->with($data);
    }

    public function create(Request $request){
        $data = [];
        $AdvertisementCategories = AdvertisementCategory::all()->pluck('name','id')->prepend('Select Advertisement Category','');
        $Countries = Country::all()->pluck('currecy_symbol','id')->prepend('Select Currency','');
        $data['AdvertisementCategories'] = $AdvertisementCategories;
        $data['Countries'] = $Countries;
        return view('backend.advertisement_plan_time.create')->with($data);
    }

    public function store(Request $request){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'select_advertisement_category'      => 'required',
            'currency'                           => 'required',
            'plan_name'                          => 'required',
            'days'                               => 'required',
            'amount'                             => 'required',
        ];
        $messages = [
            'select_advertisement_category.required'   => $Validation['select_advertisement_category'],
            'currency.required'                        => $Validation['currency'],
            'plan_name.required'                       => $Validation['plan_name'],
            'days.required'                            => $Validation['days'],
            'amount.required'                          => $Validation['amount'],
        ];
        $this->validate($request,$rules,$messages);
        $Country                                            = Country::find($inputs['currency']);
        $AdvertisementPlanTime                              = new AdvertisementPlanTime();
        $AdvertisementPlanTime->advertisement_category_id   = $inputs['select_advertisement_category'];
        $AdvertisementPlanTime->country_id                  = $inputs['currency'];
        $AdvertisementPlanTime->currency                    = $Country->currecy_symbol;
        $AdvertisementPlanTime->plan_name                   = $inputs['plan_name'];
        $AdvertisementPlanTime->days                        = $inputs['days'];
        $AdvertisementPlanTime->amount                      = $inputs['amount'];
        if($AdvertisementPlanTime->save()){
            return Redirect('backend/advertisement_plan_time')->with('success',$Messages['advertisement_plan_time_add_success']);
        }else{
            return back()->with('error',$Messages['advertisement_plan_time_add_error']);
        }
    }

    public function edit(Request $request , $id){
        $AdvertisementCategories = AdvertisementCategory::all()->pluck('name','id')->prepend('Select Advertisement Category','');
        $Countries = Country::all()->pluck('currecy_symbol','id')->prepend('Select Currency','');
        $AdvertisementPlanTime              = AdvertisementPlanTime::find($id);
        $data['AdvertisementCategories']    = $AdvertisementCategories;
        $data['Countries']                  = $Countries;
        $data['AdvertisementPlanTime']      = $AdvertisementPlanTime;
        return view('backend.advertisement_plan_time.edit')->with($data);
    }

    public function update(Request $request,$id){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'select_advertisement_category'      => 'required',
            'currency'                           => 'required',
            'plan_name'                          => 'required',
            'days'                               => 'required',
            'amount'                             => 'required',
        ];
        $messages = [
            'select_advertisement_category.required'   => $Validation['select_advertisement_category'],
            'currency.required'                        => $Validation['currency'],
            'plan_name.required'                       => $Validation['plan_name'],
            'days.required'                            => $Validation['days'],
            'amount.required'                          => $Validation['amount'],
        ];
        $this->validate($request,$rules,$messages);
        $Country                                            = Country::find($inputs['currency']);
        $AdvertisementPlanTime                              = AdvertisementPlanTime::find($id);
        $AdvertisementPlanTime->advertisement_category_id   = $inputs['select_advertisement_category'];
        $AdvertisementPlanTime->country_id                  = $inputs['currency'];
        $AdvertisementPlanTime->currency                    = $Country->currecy_symbol;
        $AdvertisementPlanTime->plan_name                   = $inputs['plan_name'];
        $AdvertisementPlanTime->days                        = $inputs['days'];
        $AdvertisementPlanTime->amount                      = $inputs['amount'];
        if($AdvertisementPlanTime->save()){
            return Redirect('backend/advertisement_plan_time')->with('success',$Messages['advertisement_plan_time_update_success']);
        }else{
            return back()->with('error',$Messages['advertisement_plan_time_update_error']);
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
        $AdvertisementPlanTime       =  AdvertisementPlanTime::find($id);
        if($AdvertisementPlanTime){
            // if(File::exists(ImageHelper::$getFormPath.$Form->form)){
            //     File::delete(ImageHelper::$getFormPath.$Form->form);
            // }
            if($AdvertisementPlanTime->delete()){
                return ['status'=>'success','message'=>$Messages['advertisement_plan_time_delete_success']];
            }else{
                return ['status'=>'failed','message'=>$Messages['advertisement_plan_time_delete_error']];
            }
        }
    }

    public function activeInactive(Request $request){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $AdvertisementPlanTime  = AdvertisementPlanTime::find($inputs['id']);
        if($inputs['status']=='1'){
            $AdvertisementPlanTime->status=$inputs['status'];
        }else{
            $AdvertisementPlanTime->status=$inputs['status'];
        }
        if($AdvertisementPlanTime->save()){
            if($AdvertisementPlanTime->status=='1'){
                return response()->json(['status'=>true,'status_code'=>'200','message'=>$Messages['advertisement_plan_time_active_success'],'data'=>$AdvertisementPlanTime,'error'=>[]], 200);
            }else{
                return response()->json(['status'=>true,'status_code'=>'200','message'=>$Messages['advertisement_plan_time_inactive_success'],'data'=>$AdvertisementPlanTime,'error'=>[]], 200);
            }    
        }else{
            return response(['status' => false , 'status_code'=>'401', 'message' => $Messages['record_not_found'], 'data'=>(object)[], 'error'=>[]], 200);
        }
    }
}
