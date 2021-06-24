<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\AdvertisementCategory;
use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class AdvertisementCategoryController extends Controller{
   public function index(Request $request){
        $AdvertisementCategories = AdvertisementCategory::orderBy('id','desc')->get();
        $data['AdvertisementCategories']=$AdvertisementCategories;
        return view('backend.advertisement_category.index')->with($data);
    }

    public function create(Request $request){
        $data = [];
        return view('backend.advertisement_category.create')->with($data);
    }

    public function store(Request $request){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];

        $inputs   = $request->all();
        $rules = [
            'type'                => 'required',
            'name'                => 'required',
            'name_ar'             => 'required',
        ];
        $messages = [
            'type.required'         => $Validation['type'],
            'name.required'         => $Validation['name'],
            'name_ar.required'      => $Validation['name_ar'],
        ];
        $this->validate($request,$rules,$messages);
        $AdvertisementCategory                       = new AdvertisementCategory();
        $AdvertisementCategory->type                 = $inputs['type'];
        $AdvertisementCategory->name                 = $inputs['name'];
        $AdvertisementCategory->name_ar              = $inputs['name_ar'];
        if($AdvertisementCategory->save()){
            return Redirect('backend/advertisement_category')->with('success',$Messages['advertisement_category_add_success']);
        }else{
            return back()->with('error',$Messages['advertisement_category_add_error']);
        }
    }

    public function edit(Request $request , $id){
        $AdvertisementCategory          = AdvertisementCategory::find($id);
        $data['AdvertisementCategory']  = $AdvertisementCategory;
        return view('backend.advertisement_category.edit')->with($data);
    }

    public function update(Request $request,$id){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'name'                => 'required',
            'name_ar'             => 'required',
        ];
        $messages = [
            'name.required'         => $Validation['name'],
            'name_ar.required'      => $Validation['name_ar'],
        ];
        $this->validate($request,$rules,$messages);
        $AdvertisementCategory                      = AdvertisementCategory::find($id);
        $AdvertisementCategory->type                = $inputs['type'];
        $AdvertisementCategory->name                = $inputs['name'];
        $AdvertisementCategory->name_ar             = $inputs['name_ar'];
        if($AdvertisementCategory->save()){
            return Redirect('backend/advertisement_category')->with('success',$Messages['advertisement_category_update_success']);
        }else{
            return back()->with('error',$Messages['advertisement_category_update_error']);
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
        $AdvertisementCategory       =  AdvertisementCategory::find($id);
        if($AdvertisementCategory){
            // if(File::exists(ImageHelper::$getFormPath.$Form->form)){
            //     File::delete(ImageHelper::$getFormPath.$Form->form);
            // }
            if($AdvertisementCategory->delete()){
                return ['status'=>'success','message'=>$Messages['advertisement_category_delete_success']];
            }else{
                return ['status'=>'failed','message'=>$Messages['advertisement_category_delete_error']];
            }
        }
    }

    public function activeInactive(Request $request){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $AdvertisementCategory  = AdvertisementCategory::find($inputs['id']);
        if($inputs['status']=='1'){
            $AdvertisementCategory->status=$inputs['status'];
        }else{
            $AdvertisementCategory->status=$inputs['status'];
        }
        $AdvertisementCategory->save();
        if($AdvertisementCategory->save()){
            if($AdvertisementCategory->status=='1'){
                return response()->json(['status'=>true,'status_code'=>'200','message'=>$Messages['advertisement_category_active_success'],'data'=>$AdvertisementCategory,'error'=>[]], 200);
            }else{
                return response()->json(['status'=>true,'status_code'=>'200','message'=>$Messages['advertisement_category_inactive_success'],'data'=>$AdvertisementCategory,'error'=>[]], 200);
            }    
        }else{
            return response(['status' => false , 'status_code'=>'401', 'message' => $Messages['record_not_found'], 'data'=>(object)[], 'error'=>[]], 200);
        }
    }
}
