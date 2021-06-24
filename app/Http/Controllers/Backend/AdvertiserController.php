<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Country;
use App\Models\AdvertisementCategory;
use App\Models\Advertiser;
use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class AdvertiserController extends Controller{
   public function index(Request $request){
        $Advertisers = Advertiser::orderBy('id','desc')->get();
        $data['Advertisers']=$Advertisers;
        //die('ganesh');
        return view('backend.advertiser.index')->with($data);
    }

    public function create(Request $request){
        $data = [];
        $AdvertisementCategories = AdvertisementCategory::all()->pluck('name','id')->prepend('Select Advertisement Category','');
        $Countries = Country::all()->pluck('country_name','id')->prepend('Select Country','');
        $data['AdvertisementCategories']    = $AdvertisementCategories;
        $data['Countries']                  = $Countries;
        return view('backend.advertiser.create')->with($data);
    }

    public function store(Request $request){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'select_advertisement_category'      => 'required',
            'select_country'                     => 'required',
            'name'                               => 'required',
            'owner_name'                         => 'required',
            'email'                              => 'required',
            'phone_number'                       => 'required',
            'landline_no'                        => 'required',
        ];
        $messages = [
            'select_advertisement_category.required'   => $Validation['select_advertisement_category'],
            'select_country.required'                  => $Validation['select_country'],
            'name.required'                            => $Validation['name'],
            'owner_name.required'                      => $Validation['owner_name'],
            'email.required'                           => $Validation['email'],
            'phone_number.required'                    => $Validation['phone_number'],
            'landline_no.required'                     => $Validation['landline_no'],
        ];
        $this->validate($request,$rules,$messages);
        $Advertiser                              = new Advertiser();
        $Advertiser->advertisement_category_id   = $inputs['select_advertisement_category'];
        $Advertiser->country_id                  = $inputs['select_country'];
        $Advertiser->name                        = $inputs['name'];
        $Advertiser->owner_name                  = $inputs['owner_name'];;
        $Advertiser->email                       = $inputs['email'];
        $Advertiser->phone_number                = $inputs['phone_number'];
        $Advertiser->landline_no                 = $inputs['landline_no'];
        if($Advertiser->save()){
            return Redirect('backend/advertiser')->with('success',$Messages['advertiser_add_success']);
        }else{
            return back()->with('error',$Messages['advertiser_add_error']);
        }
    }

    public function edit(Request $request , $id){
        $AdvertisementCategories = AdvertisementCategory::all()->pluck('name','id')->prepend('Select Advertisement Category','');
        $Countries = Country::all()->pluck('country_name','id')->prepend('Select Currency','');
        $Advertiser              = Advertiser::find($id);
        $data['Countries']                  = $Countries;
        $data['AdvertisementCategories']                  = $AdvertisementCategories;
        $data['Advertiser']      = $Advertiser;
        return view('backend.advertiser.edit')->with($data);
    }

    public function update(Request $request,$id){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'select_advertisement_category'      => 'required',
            'select_country'                     => 'required',
            'name'                               => 'required',
            'owner_name'                         => 'required',
            'email'                              => 'required',
            'phone_number'                       => 'required',
            'landline_no'                        => 'required',
        ];
        $messages = [
            'select_advertisement_category.required'   => $Validation['select_advertisement_category'],
            'select_country.required'                  => $Validation['select_country'],
            'name.required'                            => $Validation['name'],
            'owner_name.required'                      => $Validation['owner_name'],
            'email.required'                           => $Validation['email'],
            'phone_number.required'                    => $Validation['phone_number'],
            'landline_no.required'                     => $Validation['landline_no'],
        ];
        $this->validate($request,$rules,$messages);
        $Advertiser                              = Advertiser::find($id);
        $Advertiser->advertisement_category_id   = $inputs['select_advertisement_category'];
        $Advertiser->country_id                  = $inputs['select_country'];
        $Advertiser->name                        = $inputs['name'];
        $Advertiser->owner_name                  = $inputs['owner_name'];;
        $Advertiser->email                       = $inputs['email'];
        $Advertiser->phone_number                = $inputs['phone_number'];
        $Advertiser->landline_no                 = $inputs['landline_no'];
        if($Advertiser->save()){
            return Redirect('backend/advertiser')->with('success',$Messages['advertiser_update_success']);
        }else{
            return back()->with('error',$Messages['advertiser_update_error']);
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
        $Advertiser       =  Advertiser::find($id);
        if($Advertiser){
            // if(File::exists(ImageHelper::$getFormPath.$Form->form)){
            //     File::delete(ImageHelper::$getFormPath.$Form->form);
            // }
            if($Advertiser->delete()){
                return ['status'=>'success','message'=>$Messages['advertiser_delete_success']];
            }else{
                return ['status'=>'failed','message'=>$Messages['advertiser_delete_error']];
            }
        }
    }

    public function activeInactive(Request $request){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $Advertiser  = Advertiser::find($inputs['id']);
        if($inputs['status']=='1'){
            $Advertiser->status=$inputs['status'];
        }else{
            $Advertiser->status=$inputs['status'];
        }
        if($Advertiser->save()){
            if($Advertiser->status=='1'){
                return response()->json(['status'=>true,'status_code'=>'200','message'=>$Messages['advertiser_active_success'],'data'=>$Advertiser,'error'=>[]], 200);
            }else{
                return response()->json(['status'=>true,'status_code'=>'200','message'=>$Messages['advertiser_inactive_success'],'data'=>$Advertiser,'error'=>[]], 200);
            }    
        }else{
            return response(['status' => false , 'status_code'=>'401', 'message' => $Messages['record_not_found'], 'data'=>(object)[], 'error'=>[]], 200);
        }
    }
}