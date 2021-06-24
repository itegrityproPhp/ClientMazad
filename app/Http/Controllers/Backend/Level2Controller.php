<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Level2;
use App\Models\Level1;
use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class Level2Controller extends Controller{
   public function index(Request $request){
        $Level2 = Level2::orderBy('id','desc')->get();
        $data['Level2']=$Level2;
        return view('backend.level2.index')->with($data);
    }

    public function create(Request $request){
        $data = [];
        $Level1 = Level1::all()->pluck('name','id')->prepend('Select Level 1','');
        $data['Level1'] = $Level1;
        return view('backend.level2.create')->with($data);
    }
    public function store(Request $request){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'name'                => 'required',
            'name_ar'             => 'required',
            'select_level_1'      => 'required',
        ];
        $messages = [
            'name.required'                => $Validation['name'],
            'name_ar.required'             => $Validation['name_ar'],
            'select_level_1.required'      => $Validation['select_level_1'],
        ];
        $this->validate($request,$rules,$messages);
        $Level2                       = new Level2();
        $Level2->name                 = $inputs['name'];
        $Level2->name_ar              = $inputs['name_ar'];
        $Level2->level_1_id           = $inputs['select_level_1'];
        if($Level2->save()){
            return Redirect('backend/level2')->with('success',$Messages['level2_add_success']);
        }else{
            return back()->with('error',$Messages['level2_add_error']);
        }
    }

    public function edit(Request $request , $id){
        $Level2          = Level2::find($id);
        $Level1          = Level1::all()->pluck('name','id')->prepend('Select Level 1','');
        $data['Level2']  = $Level2;
        $data['Level1']     = $Level1;
        return view('backend.level2.edit')->with($data);
    }

    public function update(Request $request,$id){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'name'                => 'required',
            'name_ar'             => 'required',
            'select_level_1'      => 'required',
        ];
        $messages = [
            'name.required'                => $Validation['name'],
            'name_ar.required'             => $Validation['name_ar'],
            'select_level_1.required'      => $Validation['select_level_1'],
        ];
        $this->validate($request,$rules,$messages);
        $Level2                      = Level2::find($id);
        $Level2->name                = $inputs['name'];
        $Level2->name_ar             = $inputs['name_ar'];
        $Level2->level_1_id          = $inputs['select_level_1'];
        if($Level2->save()){
            return Redirect('backend/level2')->with('success',$Messages['level2_update_success']);
        }else{
            return back()->with('error',$Messages['level2_update_error']);
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
        $Level2       =  Level2::find($id);
        if($Level2){
            // if(File::exists(ImageHelper::$getFormPath.$Form->form)){
            //     File::delete(ImageHelper::$getFormPath.$Form->form);
            // }
            if($Level2->delete()){
                return ['status'=>'success','message'=>$Messages['level2_delete_success']];
            }else{
                return ['status'=>'failed','message'=>$Messages['level2_delete_error']];
            }
        }
    }
}
