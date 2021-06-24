<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Category;
use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class CategoryController extends Controller{
   public function index(Request $request){
        $Categories = Category::orderBy('id','desc')->get();
        $data['Categories']=$Categories;
        return view('backend.category.index')->with($data);
    }

    public function create(Request $request){
        $data = [];
        return view('backend.category.create')->with($data);
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
        $Category                        = new Category();
        $Category->name                 = $inputs['name'];
        $Category->name_ar              = $inputs['name_ar'];
        if($Category->save()){
            return Redirect('backend/category')->with('success',$Messages['category_add_success']);
        }else{
            return back()->with('error',$Messages['category_add_error']);
        }
    }

    public function edit(Request $request , $id){
        $Category          = Category::find($id);
        $data['Category']  = $Category;
        return view('backend.category.edit')->with($data);
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
        $Category                      = Category::find($id);
        $Category->name                = $inputs['name'];
        $Category->name_ar             = $inputs['name_ar'];
        if($Category->save()){
            return Redirect('backend/category')->with('success',$Messages['category_update_success']);
        }else{
            return back()->with('error',$Messages['category_update_error']);
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
        $Category       =  Category::find($id);
        if($Category){
            // if(File::exists(ImageHelper::$getFormPath.$Form->form)){
            //     File::delete(ImageHelper::$getFormPath.$Form->form);
            // }
            if($Category->delete()){
                return ['status'=>'success','message'=>$Messages['category_delete_success']];
            }else{
                return ['status'=>'failed','message'=>$Messages['category_delete_error']];
            }
        }
    }
}
