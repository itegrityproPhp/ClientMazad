<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\FaqCategory;
use App\Models\Faq;

use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class FaqController extends Controller{
   public function index(Request $request){
        $Faqs = Faq::orderBy('id','desc')->get();
        $data['Faqs']=$Faqs;
        return view('backend.faq.index')->with($data);
    }

    public function create(Request $request){
        $FaqCategories = FaqCategory::all()->pluck('title','id')->prepend('Select Faq Category','');
        $data['FaqCategories'] = $FaqCategories;
        return view('backend.faq.create')->with($data);
    }

    public function store(Request $request){
        $inputs   = $request->all();
        $rules = [
            'title'                 => 'required',
            'title_ar'              => 'required',
            'question'              => 'required',
            'question_ar'           => 'required',
            'answer'                => 'required',
            'answer_ar'             => 'required',
            'select_faq_category'   => 'required',
            'sequence'              => 'required',
            'type'                  => 'required',
            'status'                => 'required',
        ];
        $messages = [
            'title.required'                => 'The title field is required.',
            'title_ar.required'             => 'The title ar field is required.',
            'question.required'             => 'The question field is required.',
            'question_ar.required'          => 'The question ar field is required.',
            'answer.required'               => 'The answer field is required.',
            'answer_ar.required'            => 'The answer ar field is required.',
            'select_faq_category.required'  => 'The select faq category field is required.',
            'sequence.required'             => 'The sequence field is required.',
            'type.required'                 => 'The type field is required.',
            'status.required'               => 'The status field is required.',
        ];
        $this->validate($request,$rules,$messages);
        $Faq                        = new Faq();
        $Faq->title                 = $inputs['title'];
        $Faq->title_ar              = $inputs['title_ar'];
        $Faq->question              = $inputs['question'];
        $Faq->question_ar           = $inputs['question_ar'];
        $Faq->answer                = $inputs['answer'];
        $Faq->answer_ar             = $inputs['answer_ar'];
        $Faq->faq_category_id       = $inputs['select_faq_category'];
        $Faq->sequence              = $inputs['sequence'];
        $Faq->type                  = $inputs['type'];
        $Faq->status                = $inputs['status'];
        if($Faq->save()){
            return Redirect('backend/faq')->with('success','Faq added successfully');
        }else{
            return back()->with('error','Faq added failed , please try again');
        }
    }

    public function edit(Request $request , $id){
        $FaqCategories = FaqCategory::all()->pluck('title','id')->prepend('Select Faq Category','');
        $data['FaqCategories']  = $FaqCategories;
        $Faq                    = Faq::find($id);
        $data['FaqCategories']  = $FaqCategories;
        $data['Faq']            = $Faq;
        return view('backend.faq.edit')->with($data);
    }

    public function update(Request $request,$id){
        $inputs   = $request->all();
        $rules = [
            'title'                 => 'required',
            'title_ar'              => 'required',
            'question'              => 'required',
            'question_ar'           => 'required',
            'answer'                => 'required',
            'answer_ar'             => 'required',
            'select_faq_category'   => 'required',
            'sequence'              => 'required',
            'type'                  => 'required',
            'status'                => 'required',
        ];
        $messages = [
            'title.required'                => 'The title field is required.',
            'title_ar.required'             => 'The title ar field is required.',
            'question.required'             => 'The question field is required.',
            'question_ar.required'          => 'The question ar field is required.',
            'answer.required'               => 'The answer field is required.',
            'answer_ar.required'            => 'The answer ar field is required.',
            'select_faq_category.required'  => 'The select faq category field is required.',
            'sequence.required'             => 'The sequence field is required.',
            'type.required'                 => 'The type field is required.',
            'status.required'               => 'The status field is required.',
        ];
        $this->validate($request,$rules,$messages);
        $Faq                        = Faq::find($id);
        $Faq->title                 = $inputs['title'];
        $Faq->title_ar              = $inputs['title_ar'];
        $Faq->question              = $inputs['question'];
        $Faq->question_ar           = $inputs['question_ar'];
        $Faq->answer                = $inputs['answer'];
        $Faq->answer_ar             = $inputs['answer_ar'];
        $Faq->faq_category_id       = $inputs['select_faq_category'];
        $Faq->sequence              = $inputs['sequence'];
        $Faq->type                  = $inputs['type'];
        $Faq->status                = $inputs['status'];
        if($Faq->save()){
            return Redirect('backend/faq')->with('success','Faq updated successfully');
        }else{
            return back()->with('error','Faq updated failed , please try again');
        }
    }

    // public function view(Request $request , $id){
    //     $data['city']  = City::find($id);
    //     $data['js'] = ['city/view.js'];
    //     return view('admin.city.view',compact('data'));
    // }
    public function destroy($id){
        $Faq =  Faq::find($id);
        if($Faq){
            // if(File::exists('uploads/category/'.$Category->image)){
            //     File::delete('uploads/category/'.$Category->image);
            // }
            if($Faq->delete()){
                return ['status'=>'success','message'=>'Faq deleted successfully'];
            }else{
                return ['status'=>'failed','message'=>'Faq deleted failed,please try again'];
            }
        }
    }
}
