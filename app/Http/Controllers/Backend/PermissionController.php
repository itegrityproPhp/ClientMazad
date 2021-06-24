<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Permission;
use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class PermissionController extends Controller{
   public function index(Request $request){
        $Permissions = Permission::orderBy('id','desc')->get();
        $data['Permissions']=$Permissions;
        return view('backend.permission.index')->with($data);
    }

    public function create(Request $request){
        $data = [];
        return view('backend.permission.create')->with($data);
    }

    public function store(Request $request){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];

        $inputs   = $request->all();
        $rules = [
            'permission'                  => 'required',
            'permission_ar'               => 'required',
        ];
        $messages = [
            'permission.required'         => $Validation['permission'],
            'permission_ar.required'      => $Validation['permission_ar'],
        ];
        $this->validate($request,$rules,$messages);
        $Permission                           = new Permission();
        $Permission->permission               = $inputs['permission'];
        $Permission->permission_ar            = $inputs['permission_ar'];
        if($Permission->save()){
            return Redirect('backend/permission')->with('success',$Messages['permission_add_success']);
        }else{
            return back()->with('error',$Messages['permission_add_error']);
        }
    }

    public function edit(Request $request , $id){
        $Permission          = Permission::find($id);
        $data['Permission']  = $Permission;
        return view('backend.permission.edit')->with($data);
    }

    public function update(Request $request,$id){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'permission'                  => 'required',
            'permission_ar'               => 'required',
        ];
        $messages = [
            'permission.required'         => $Validation['permission'],
            'permission_ar.required'      => $Validation['permission_ar'],
        ];
        $this->validate($request,$rules,$messages);
        $Permission                           = Permission::find($id);
        $Permission->permission               = $inputs['permission'];
        $Permission->permission_ar            = $inputs['permission_ar'];
        if($Permission->save()){
            return Redirect('backend/permission')->with('success',$Messages['permission_update_success']);
        }else{
            return back()->with('error',$Messages['permission_update_error']);
        }
    }

    // public function view(Request $request , $id){
    //     $data['city']  = City::find($id);
    //     $data['js'] = ['city/view.js'];
    //     return view('admin.city.view',compact('data'));
    // }
    public function destroy(Request $request,$id){
        $inputs           =  $request->all();
        $langData         = trans('backend');
        $Validation       = $langData['Validation'];
        $Messages         = $langData['Messages'];
        $Permission       =  Permission::find($id);
        if($Permission){
            // if(File::exists(ImageHelper::$getFormPath.$Form->form)){
            //     File::delete(ImageHelper::$getFormPath.$Form->form);
            // }
            if($Permission->delete()){
                return ['status'=>'success','message'=>$Messages['permission_delete_success']];
            }else{
                return ['status'=>'failed','message'=>$Messages['permission_delete_error']];
            }
        }
    }
}
