<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Level4;
use App\Models\Level3;
use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class Level4Controller extends Controller{
   public function index(Request $request){
        $Level4 = Level4::orderBy('id','desc')->get();
        $data['Level4']=$Level4;
        return view('backend.level4.index')->with($data);
    }

    public function create(Request $request){
        $data = [];
        $Level3 = Level3::all()->pluck('name','id')->prepend('Select Level 3','');
        $data['Level3'] = $Level3;
        return view('backend.level4.create')->with($data);
    }
    public function store(Request $request){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'name'                => 'required',
            'name_ar'             => 'required',
            'select_level_3'      => 'required',
        ];
        $messages = [
            'name.required'                => $Validation['name'],
            'name_ar.required'             => $Validation['name_ar'],
            'select_level_3.required'      => $Validation['select_level_3'],
        ];
        $this->validate($request,$rules,$messages);
        $Level4                       = new Level4();
        $Level4->name                 = $inputs['name'];
        $Level4->name_ar              = $inputs['name_ar'];
        $Level4->level_3_id           = $inputs['select_level_3'];
        if($Level4->save()){
            return Redirect('backend/level4')->with('success',$Messages['level4_add_success']);
        }else{
            return back()->with('error',$Messages['level4_add_error']);
        }
    }

    public function edit(Request $request , $id){
        $Level4          = Level4::find($id);
        $Level3          = Level3::all()->pluck('name','id')->prepend('Select Level 3','');
        $data['Level4']  = $Level4;
        $data['Level3']     = $Level3;
        return view('backend.level4.edit')->with($data);
    }

    public function update(Request $request,$id){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'name'                => 'required',
            'name_ar'             => 'required',
            'select_level_3'      => 'required',
        ];
        $messages = [
            'name.required'                => $Validation['name'],
            'name_ar.required'             => $Validation['name_ar'],
            'select_level_3.required'      => $Validation['select_level_3'],
        ];
        $this->validate($request,$rules,$messages);
        $Level4                      = Level4::find($id);
        $Level4->name                = $inputs['name'];
        $Level4->name_ar             = $inputs['name_ar'];
        $Level4->level_3_id          = $inputs['select_level_3'];
        if($Level4->save()){
            return Redirect('backend/level4')->with('success',$Messages['level4_update_success']);
        }else{
            return back()->with('error',$Messages['level4_update_error']);
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
        $Level4       =  Level4::find($id);
        if($Level4){
            // if(File::exists(ImageHelper::$getFormPath.$Form->form)){
            //     File::delete(ImageHelper::$getFormPath.$Form->form);
            // }
            if($Level4->delete()){
                return ['status'=>'success','message'=>$Messages['level4_delete_success']];
            }else{
                return ['status'=>'failed','message'=>$Messages['level4_delete_error']];
            }
        }
    }
}
