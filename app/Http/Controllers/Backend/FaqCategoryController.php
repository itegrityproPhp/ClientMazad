<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\FaqCategory;
use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class FaqCategoryController extends Controller{
   public function index(Request $request){
        $FaqCategories = FaqCategory::orderBy('id','desc')->get();
        $data['FaqCategories']=$FaqCategories;
        return view('backend.faq_category.index')->with($data);
    }

    public function create(Request $request){
        $data = [];
        return view('backend.faq_category.create')->with($data);
    }

    public function store(Request $request){
        $inputs   = $request->all();
        $rules = [
            'title'             => 'required',
            'title_ar'          => 'required',
            'sequence'          => 'required',
            'status'            => 'required',
        ];
        $messages = [
            'title.required'            => 'The title field is required.',
            'title_ar.required'         => 'The title ar field is required.',
            'sequence.required'         => 'The sequence field is required.',
            'status.required'           => 'The status field is required.',
        ];
        $this->validate($request,$rules,$messages);
        $FaqCategory                = new FaqCategory();
        $FaqCategory->title         = $inputs['title'];
        $FaqCategory->title_ar      = $inputs['title_ar'];
        $FaqCategory->sequence      = $inputs['sequence'];
        $FaqCategory->status        = $inputs['status'];
        if($FaqCategory->save()){
            return Redirect('backend/faq_category')->with('success','Faq category added successfully');
        }else{
            return back()->with('error','Faq category added failed , please try again');
        }
    }

    public function edit(Request $request , $id){
        $FaqCategory =  FaqCategory::find($id);
        $data['FaqCategory']       = $FaqCategory;
        return view('backend.faq_category.edit')->with($data);
    }

    public function update(Request $request,$id){
        $inputs   = $request->all();
        $rules = [
            'title'             => 'required',
            'title_ar'          => 'required',
            'sequence'          => 'required',
            'status'            => 'required',
        ];
        $messages = [
            'title.required'            => 'The title field is required.',
            'title_ar.required'         => 'The title ar field is required.',
            'sequence.required'         => 'The sequence field is required.',
            'status.required'           => 'The status field is required.',
        ];
        $this->validate($request,$rules,$messages);
        $FaqCategory                = FaqCategory::find($id);
        $FaqCategory->title         = $inputs['title'];
        $FaqCategory->title_ar      = $inputs['title_ar'];
        $FaqCategory->sequence      = $inputs['sequence'];
        $FaqCategory->status        = $inputs['status'];
        if($FaqCategory->save()){
            return Redirect('backend/faq_category')->with('success','Faq updated added successfully');
        }else{
            return back()->with('error','Faq category updated failed , please try again');
        }
    }

    public function view(Request $request , $id){
        $data['city']  = City::find($id);
        $data['js'] = ['city/view.js'];
        return view('admin.city.view',compact('data'));
    }
    public function destroy($id){
        $FaqCategory =  FaqCategory::find($id);
        if($FaqCategory){
            // if(File::exists('uploads/category/'.$Category->image)){
            //     File::delete('uploads/category/'.$Category->image);
            // }
            if($FaqCategory->delete()){
                return ['status'=>'success','message'=>'Faq category deleted successfully'];
            }else{
                return ['status'=>'failed','message'=>'Faq category deleted failed,please try again'];
            }
        }
    }
}
