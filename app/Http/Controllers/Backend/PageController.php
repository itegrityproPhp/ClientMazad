<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Page;
use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class PageController extends Controller{
   public function index(Request $request){
        $Pages = Page::orderBy('id','desc')->get();
        //return $Pages;
        $data['Pages']=$Pages;
        return view('backend.page.index')->with($data);
    }

    public function create(Request $request){
        $data = [];
        return view('backend.page.create')->with($data);
    }

    public function store(Request $request){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];

        $inputs   = $request->all();
        $rules = [
            'page_type'            => 'required',
            'title'                => 'required',
            'title_ar'             => 'required',
            'content'              => 'required',
            'content_ar'           => 'required',
        ];
        $messages = [
            'page_type.required'     => $Validation['page_type'],
            'title.required'         => $Validation['title'],
            'title_ar.required'      => $Validation['title_ar'],
            'content.required'       => $Validation['content'],
            'content_ar.required'    => $Validation['content_ar'],
        ];
        $this->validate($request,$rules,$messages);
        $Page                       = new Page();
        $Page->page_type            = $inputs['page_type'];
        $Page->title                = $inputs['title'];
        $Page->title_ar             = $inputs['title_ar'];
        $Page->content              = $inputs['content'];
        $Page->content_ar           = $inputs['content_ar'];
        if($Page->save()){
            return Redirect('backend/page')->with('success',$Messages['page_add_success']);
        }else{
            return back()->with('error',$Messages['page_add_error']);
        }
    }

    public function edit(Request $request , $id){
        $Page          = Page::find($id);
        $data['Page']  = $Page;
        return view('backend.page.edit')->with($data);
    }

    public function update(Request $request,$id){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'page_type'            => 'required',
            'title'                => 'required',
            'title_ar'             => 'required',
            'content'              => 'required',
            'content_ar'           => 'required',
        ];
        $messages = [
            'page_type.required'     => $Validation['page_type'],
            'title.required'         => $Validation['title'],
            'title_ar.required'      => $Validation['title_ar'],
            'content.required'       => $Validation['content'],
            'content_ar.required'    => $Validation['content_ar'],
        ];
        $this->validate($request,$rules,$messages);
        $media=null;
        if($request->hasFile('media')) {
            $media = Str::random(10).'_'.time().'.'.request()->media->getClientOriginalExtension();
            request()->media->move(ImageHelper::$getUserTrainingPath, $media);
        }

        $Page                       = Page::find($id);
        $Page->page_type            = $inputs['page_type'];
        $Page->title                = $inputs['title'];
        $Page->title_ar             = $inputs['title_ar'];
        $Page->content              = $inputs['content'];
        $Page->content_ar           = $inputs['content_ar'];
        if($Page->save()){
            return back()->with('error',$Messages['page_add_error']);
            //return Redirect('backend/page')->with('success',$Messages['page_update_success']);
        }else{
            return back()->with('error',$Messages['page_update_error']);
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
        $Page       =  Page::find($id);
        if($Page){
            if($Page->delete()){
                return ['status'=>'success','message'=>$Messages['page_delete_success']];
            }else{
                return ['status'=>'failed','message'=>$Messages['page_delete_error']];
            }
        }
    }
}
