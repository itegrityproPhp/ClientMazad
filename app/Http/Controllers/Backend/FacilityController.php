<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Facility;
use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class FacilityController extends Controller{
    
   public function index(Request $request){
        $Facility = Facility::orderBy('id','desc')->get();
        $data['Facility']=$Facility;
        return view('backend.facility.index')->with($data);
    }

    public function create(Request $request){
        $data = [];
        return view('backend.facility.create')->with($data);
    }

    public function store(Request $request){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];

        $inputs   = $request->all();
        $rules = [
            'name'                => 'required',
            'name_ar'             => 'required',
        ];
        $messages = [
            'name.required'         => $Validation['name'],
            'name_ar.required'      => $Validation['name_ar'],
        ];
        $this->validate($request,$rules,$messages);
        $Facility                   = new Facility();
        $Facility->facility_name      = $inputs['name'];
        $Facility->facility_name_ar   = $inputs['name_ar'];
        if($Facility->save()){
            return Redirect('backend/facility')->with('success',$Messages['facility_add_success']);
        }else{
            return back()->with('error',$Messages['facility_add_error']);
        }
    }

    public function edit(Request $request , $id){
        $Facility          = Facility::find($id);
        $data['Facility']  = $Facility;
        return view('backend.facility.edit')->with($data);
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
        $Facility                      = Facility::find($id);
        $Facility->facility_name      = $inputs['name'];
        $Facility->facility_name_ar   = $inputs['name_ar'];
        if($Facility->save()){
            return Redirect('backend/facility')->with('success',$Messages['facility_update_success']);
        }else{
            return back()->with('error',$Messages['facility_update_error']);
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
        $Facility       =  Facility::find($id);
        if($Facility){
            // if(File::exists(ImageHelper::$getFormPath.$Form->form)){
            //     File::delete(ImageHelper::$getFormPath.$Form->form);
            // }
            if($Facility->delete()){
                return ['status'=>'success','message'=>$Messages['facility_delete_success']];
            }else{
                return ['status'=>'failed','message'=>$Messages['facility_delete_error']];
            }
        }
    }
}
