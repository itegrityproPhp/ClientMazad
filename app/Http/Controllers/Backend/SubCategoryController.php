<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Category;
use App\Models\SubCategory;
use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class SubCategoryController extends Controller{
   public function index(Request $request){
        $SubCategories = SubCategory::orderBy('id','desc')->get();
        $data['SubCategories']=$SubCategories;
        return view('backend.sub_category.index')->with($data);
    }

    public function create(Request $request){
        $data = [];
        $Categories = Category::all()->pluck('name','id')->prepend('Select Category','');
        $data['Categories'] = $Categories;
        return view('backend.sub_category.create')->with($data);
    }

    public function store(Request $request){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'select_category'     => 'required',
            'name'                => 'required',
            'name_ar'             => 'required',
        ];
        $messages = [
            'select_category.required'  => $Validation['select_category'],
            'name.required'             => $Validation['name'],
            'name_ar.required'          => $Validation['name_ar'],
        ];
        $this->validate($request,$rules,$messages);
        $SubCategory                       = new SubCategory();
        $SubCategory->category_id          = $inputs['select_category'];
        $SubCategory->name                 = $inputs['name'];
        $SubCategory->name_ar              = $inputs['name_ar'];
        if($SubCategory->save()){
            return Redirect('backend/sub_category')->with('success',$Messages['sub_category_add_success']);
        }else{
            return back()->with('error',$Messages['sub_category_add_error']);
        }
    }

    public function edit(Request $request , $id){
        $Categories = Category::all()->pluck('name','id')->prepend('Select Category','');
        $SubCategory          = SubCategory::find($id);
        $data['SubCategory']  = $SubCategory;
        $data['Categories']  = $Categories;
        return view('backend.sub_category.edit')->with($data);
    }

    public function update(Request $request,$id){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'select_category'     => 'required',
            'name'                => 'required',
            'name_ar'             => 'required',
        ];
        $messages = [
            'select_category.required'  => $Validation['select_category'],
            'name.required'             => $Validation['name'],
            'name_ar.required'          => $Validation['name_ar'],
        ];
        $this->validate($request,$rules,$messages);
        $SubCategory                       = SubCategory::find($id);
        $SubCategory->category_id          = $inputs['select_category'];
        $SubCategory->name                 = $inputs['name'];
        $SubCategory->name_ar              = $inputs['name_ar'];
        if($SubCategory->save()){
            return Redirect('backend/sub_category')->with('success',$Messages['sub_category_update_success']);
        }else{
            return back()->with('error',$Messages['sub_category_update_error']);
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
        $SubCategory       =  SubCategory::find($id);
        if($SubCategory){
            // if(File::exists(ImageHelper::$getFormPath.$Form->form)){
            //     File::delete(ImageHelper::$getFormPath.$Form->form);
            // }
            if($SubCategory->delete()){
                return ['status'=>'success','message'=>$Messages['sub_category_delete_success']];
            }else{
                return ['status'=>'failed','message'=>$Messages['sub_category_delete_error']];
            }
        }
    }
}
