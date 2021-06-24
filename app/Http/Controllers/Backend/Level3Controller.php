<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Level3;
use App\Models\Level2;
use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class Level3Controller extends Controller{
   public function index(Request $request){
        $Level3 = Level3::orderBy('id','desc')->get();
        $data['Level3']=$Level3;
        return view('backend.level3.index')->with($data);
    }

    public function create(Request $request){
        $data = [];
        $Level2 = Level2::all()->pluck('name','id')->prepend('Select Level 2','');
        $data['Level2'] = $Level2;
        return view('backend.level3.create')->with($data);
    }
    public function store(Request $request){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'name'                => 'required',
            'name_ar'             => 'required',
            'select_level_2'      => 'required',
        ];
        $messages = [
            'name.required'                => $Validation['name'],
            'name_ar.required'             => $Validation['name_ar'],
            'select_level_2.required'      => $Validation['select_level_2'],
        ];
        $this->validate($request,$rules,$messages);
        $Level3                       = new Level3();
        $Level3->name                 = $inputs['name'];
        $Level3->name_ar              = $inputs['name_ar'];
        $Level3->level_2_id           = $inputs['select_level_2'];
        if($Level3->save()){
            return Redirect('backend/level3')->with('success',$Messages['level3_add_success']);
        }else{
            return back()->with('error',$Messages['level3_add_error']);
        }
    }

    public function edit(Request $request , $id){
        $Level3          = Level3::find($id);
        $Level2          = Level2::all()->pluck('name','id')->prepend('Select Level 2','');
        $data['Level3']  = $Level3;
        $data['Level2']     = $Level2;
        return view('backend.level3.edit')->with($data);
    }

    public function update(Request $request,$id){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'name'                => 'required',
            'name_ar'             => 'required',
            'select_level_2'      => 'required',
        ];
        $messages = [
            'name.required'                => $Validation['name'],
            'name_ar.required'             => $Validation['name_ar'],
            'select_level_2.required'      => $Validation['select_level_2'],
        ];
        $this->validate($request,$rules,$messages);
        $Level3                      = Level3::find($id);
        $Level3->name                = $inputs['name'];
        $Level3->name_ar             = $inputs['name_ar'];
        $Level3->level_2_id          = $inputs['select_level_2'];
        if($Level3->save()){
            return Redirect('backend/level3')->with('success',$Messages['level3_update_success']);
        }else{
            return back()->with('error',$Messages['level3_update_error']);
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
        $Level3       =  Level3::find($id);
        if($Level3){
            // if(File::exists(ImageHelper::$getFormPath.$Form->form)){
            //     File::delete(ImageHelper::$getFormPath.$Form->form);
            // }
            if($Level3->delete()){
                return ['status'=>'success','message'=>$Messages['level3_delete_success']];
            }else{
                return ['status'=>'failed','message'=>$Messages['level3_delete_error']];
            }
        }
    }
}
