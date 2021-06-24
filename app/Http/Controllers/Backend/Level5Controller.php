<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Level5;
use App\Models\Level4;
use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class Level5Controller extends Controller{
   public function index(Request $request){
        $Level5 = Level5::orderBy('id','desc')->get();
        $data['Level5']=$Level5;
        return view('backend.level5.index')->with($data);
    }

    public function create(Request $request){
        $data = [];
        $Level4 = Level4::all()->pluck('name','id')->prepend('Select Level 4','');
        $data['Level4'] = $Level4;
        return view('backend.level5.create')->with($data);
    }
    public function store(Request $request){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'name'                => 'required',
            'name_ar'             => 'required',
            'select_level_4'      => 'required',
        ];
        $messages = [
            'name.required'                => $Validation['name'],
            'name_ar.required'             => $Validation['name_ar'],
            'select_level_4.required'      => $Validation['select_level_4'],
        ];
        $this->validate($request,$rules,$messages);
        $Level5                       = new Level5();
        $Level5->name                 = $inputs['name'];
        $Level5->name_ar              = $inputs['name_ar'];
        $Level5->level_4_id           = $inputs['select_level_4'];
        if($Level5->save()){
            return Redirect('backend/level5')->with('success',$Messages['level5_add_success']);
        }else{
            return back()->with('error',$Messages['level5_add_error']);
        }
    }

    public function edit(Request $request , $id){
        $Level5          = Level5::find($id);
        $Level4          = Level4::all()->pluck('name','id')->prepend('Select Level 4','');
        $data['Level5']  = $Level5;
        $data['Level4']     = $Level4;
        return view('backend.level5.edit')->with($data);
    }

    public function update(Request $request,$id){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'name'                => 'required',
            'name_ar'             => 'required',
            'select_level_4'      => 'required',
        ];
        $messages = [
            'name.required'                => $Validation['name'],
            'name_ar.required'             => $Validation['name_ar'],
            'select_level_4.required'      => $Validation['select_level_4'],
        ];
        $this->validate($request,$rules,$messages);
        $Level5                      = Level5::find($id);
        $Level5->name                = $inputs['name'];
        $Level5->name_ar             = $inputs['name_ar'];
        $Level5->level_4_id          = $inputs['select_level_4'];
        if($Level5->save()){
            return Redirect('backend/level5')->with('success',$Messages['level5_update_success']);
        }else{
            return back()->with('error',$Messages['level5_update_error']);
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
        $Level5       =  Level5::find($id);
        if($Level5){
            // if(File::exists(ImageHelper::$getFormPath.$Form->form)){
            //     File::delete(ImageHelper::$getFormPath.$Form->form);
            // }
            if($Level5->delete()){
                return ['status'=>'success','message'=>$Messages['level5_delete_success']];
            }else{
                return ['status'=>'failed','message'=>$Messages['level5_delete_error']];
            }
        }
    }
}
