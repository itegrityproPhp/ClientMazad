<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Role;
use App\Models\Permission;
use App\Models\PermissionAdministration;
use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class PermissionAdministrationController extends Controller{
   public function index(Request $request){
        $Roles  = Role::where('type','3')->get();
        $data['Roles']=$Roles;
        return view('backend.permission_administration.index')->with($data);
    }

    public function create(Request $request){
        $data = [];
        $Roles             = Role::where('type','3')->get()->pluck('name','id')->prepend('Select Role','');
        $Permissions              = Permission::all()->pluck('permission','id')->prepend('Select Permission','');
        $data['Roles']            = $Roles;
        $data['Permissions']      = $Permissions;
        return view('backend.permission_administration.create')->with($data);
    }

    public function store(Request $request){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];

        $inputs   = $request->all();
        $rules = [
            'role'                     => 'required',
            'permission'               => 'required',
        ];
        $messages = [
            'role.required'            => $Validation['role'],
            'permission.required'      => $Validation['permission'],
        ];
        $this->validate($request,$rules,$messages);
        $PermissionAdministrationArr = [];
        if(!empty($inputs['permission'])){
            foreach ($inputs['permission'] as $key => $value) {
                $tmp                        = [];
                $tmp['role_id']             = $inputs['role'];
                $tmp['permission_id']       = $value;
                array_push($PermissionAdministrationArr,$tmp);
            }
        }
        if($PermissionAdministrationArr){
            PermissionAdministration::insert($PermissionAdministrationArr);
            return Redirect('backend/permission_administration')->with('success',$Messages['permission_administration_add_success']);
        }else{
            return back()->with('error',$Messages['permission_administration_add_error']);
        }
    }

    public function edit(Request $request , $id){
        $Role                    = Role::find($id);
        $Permissions              = Permission::all()->pluck('permission','id')->prepend('Select Permission','');
        $data['Role']            = $Role;
        $data['Permissions']      = $Permissions;
        $PermissionAdministration          = PermissionAdministration::where('role_id',$id)->get();
        $PermissionArr = [];
        foreach ($PermissionAdministration as $key => $value) {
           $PermissionArr[]=$value->permission_id;
        }
        $data['PermissionAdministration']  = $PermissionAdministration;
        $data['PermissionArr']  = $PermissionArr;
        //return $PermissionArr;
        return view('backend.permission_administration.edit')->with($data);
    }

    public function update(Request $request,$id){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];

        $inputs   = $request->all();
        $rules = [
            //'role'                     => 'required',
            'permission'               => 'required',
        ];
        $messages = [
            //'role.required'            => $Validation['role'],
            'permission.required'      => $Validation['permission'],
        ];
        $this->validate($request,$rules,$messages);
        $PermissionAdministrationArr = [];
        if(!empty($inputs['permission'])){
            foreach ($inputs['permission'] as $key => $value) {
                $tmp                        = [];
                $tmp['role_id']             = $id;
                $tmp['permission_id']       = $value;
                array_push($PermissionAdministrationArr,$tmp);
            }
        }
        //return $PermissionAdministrationArr;
        if($PermissionAdministrationArr){
            PermissionAdministration::where('role_id',$id)->delete();
            PermissionAdministration::insert($PermissionAdministrationArr);
            return Redirect('backend/permission_administration')->with('success',$Messages['permission_administration_update_success']);
        }else{
            return back()->with('error',$Messages['permission_administration_update_error']);
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
        $PermissionAdministration       =  PermissionAdministration::find($id);
        if($PermissionAdministration){
            // if(File::exists(ImageHelper::$getFormPath.$Form->form)){
            //     File::delete(ImageHelper::$getFormPath.$Form->form);
            // }
            if($PermissionAdministration->delete()){
                return ['status'=>'success','message'=>$Messages['permission_administration_delete_success']];
            }else{
                return ['status'=>'failed','message'=>$Messages['permission_administration_delete_error']];
            }
        }
    }
}
