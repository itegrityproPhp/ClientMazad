<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Level1;
use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class Level1Controller extends Controller{
   public function index(Request $request){
        $Level1 = Level1::orderBy('id','desc')->get();
        $data['Level1']=$Level1;
        return view('backend.level1.index')->with($data);
    }

    public function create(Request $request){
        $data = [];
        return view('backend.level1.create')->with($data);
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
        $Level1                        = new Level1();
        $Level1->name                 = $inputs['name'];
        $Level1->name_ar              = $inputs['name_ar'];
        if($Level1->save()){
            return Redirect('backend/level1')->with('success',$Messages['level1_add_success']);
        }else{
            return back()->with('error',$Messages['level1_add_error']);
        }
    }

    public function edit(Request $request , $id){
        $Level1          = Level1::find($id);
        $data['Level1']  = $Level1;
        return view('backend.level1.edit')->with($data);
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
        $Level1                      = Level1::find($id);
        $Level1->name                = $inputs['name'];
        $Level1->name_ar             = $inputs['name_ar'];
        if($Level1->save()){
            return Redirect('backend/level1')->with('success',$Messages['level1_update_success']);
        }else{
            return back()->with('error',$Messages['level1_update_error']);
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
        $Level1       =  Level1::find($id);
        if($Level1){
            // if(File::exists(ImageHelper::$getFormPath.$Form->form)){
            //     File::delete(ImageHelper::$getFormPath.$Form->form);
            // }
            if($Level1->delete()){
                return ['status'=>'success','message'=>$Messages['level1_delete_success']];
            }else{
                return ['status'=>'failed','message'=>$Messages['level1_delete_error']];
            }
        }
    }
}
