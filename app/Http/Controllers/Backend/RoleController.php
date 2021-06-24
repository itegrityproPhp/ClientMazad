<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Role;
use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class RoleController extends Controller{
   public function index(Request $request){
        $Roles = Role::orderBy('id','desc')->get();
        $data['Roles']=$Roles;
        return view('backend.role.index')->with($data);
    }

    public function create(Request $request){
        $data = [];
        return view('backend.role.create')->with($data);
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
        $Role                       = new Role();
        $Role->type                 = $inputs['type'];
        $Role->name                 = $inputs['name'];
        $Role->name_ar              = $inputs['name_ar'];
        if($Role->save()){
            return Redirect('backend/role')->with('success',$Messages['role_add_success']);
        }else{
            return back()->with('error',$Messages['role_add_error']);
        }
    }

    public function edit(Request $request , $id){
        $Role          = Role::find($id);
        $data['Role']  = $Role;
        return view('backend.role.edit')->with($data);
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
        $Role                      = Role::find($id);
        $Role->type                = $inputs['type'];
        $Role->name                = $inputs['name'];
        $Role->name_ar             = $inputs['name_ar'];
        if($Role->save()){
            return Redirect('backend/role')->with('success',$Messages['role_update_success']);
        }else{
            return back()->with('error',$Messages['role_update_error']);
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
        $Role       =  Role::find($id);
        if($Role){
            // if(File::exists(ImageHelper::$getFormPath.$Form->form)){
            //     File::delete(ImageHelper::$getFormPath.$Form->form);
            // }
            if($Role->delete()){
                return ['status'=>'success','message'=>$Messages['role_delete_success']];
            }else{
                return ['status'=>'failed','message'=>$Messages['role_delete_error']];
            }
        }
    }
}
