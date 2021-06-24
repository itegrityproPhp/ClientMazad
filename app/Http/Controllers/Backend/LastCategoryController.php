<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\LastCategory;
use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class LastCategoryController extends Controller{
   public function index(Request $request){
        $LastCategories = LastCategory::orderBy('id','desc')->get();
        $data['LastCategories']=$LastCategories;
        //$data['fav_title'] = 'Last Category'; 
        return view('backend.last_category.index')->with($data);
    }

    public function create(Request $request){
        $data = [];
        return view('backend.last_category.create')->with($data);
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
        $LastCategory                        = new LastCategory();
        $LastCategory->name                 = $inputs['name'];
        $LastCategory->name_ar              = $inputs['name_ar'];
        if($LastCategory->save()){
            return Redirect('backend/last_category')->with('success',$Messages['last_category_add_success']);
        }else{
            return back()->with('error',$Messages['last_category_add_error']);
        }
    }

    public function edit(Request $request , $id){
        $LastCategory          = LastCategory::find($id);
        $data['LastCategory']  = $LastCategory;
        return view('backend.last_category.edit')->with($data);
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
        $LastCategory                      = LastCategory::find($id);
        $LastCategory->name                = $inputs['name'];
        $LastCategory->name_ar             = $inputs['name_ar'];
        if($LastCategory->save()){
            return Redirect('backend/last_category')->with('success',$Messages['last_category_update_success']);
        }else{
            return back()->with('error',$Messages['last_category_update_error']);
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
        $LastCategory       =  LastCategory::find($id);
        if($LastCategory){
            // if(File::exists(ImageHelper::$getFormPath.$Form->form)){
            //     File::delete(ImageHelper::$getFormPath.$Form->form);
            // }
            if($LastCategory->delete()){
                return ['status'=>'success','message'=>$Messages['last_category_delete_success']];
            }else{
                return ['status'=>'failed','message'=>$Messages['last_category_delete_error']];
            }
        }
    }
}
