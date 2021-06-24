<?php
namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
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

class ContentController extends Controller{
   public function index(Request $request){
        $contents = Page::get();
        $number_key=1;
        foreach ($contents as $key => $value) {
            $value->number_key=$number_key;
            $number_key++;
        }
        $data['contents']=$contents;
        return view('admin.content.index',compact('data'));
    }
    
    public function edit(Request $request , $id){
        $data['content']  = Page::find($id);
        //$data['js'] = ['content/edit.js'];
        return view('admin.content.edit',compact('data'));
    }

    public function update(Request $request,$id){
        $input   = $request->all();
        $rules = [
            'heading'              => 'required',
            'heading_ar'           => 'required',
            'content'           => 'required',
            'content_ar'           => 'required',
        ];
        $this->validate($request,$rules);

        $Page                     = Page::find($id);
        $Page->heading              = $input['heading'];
        $Page->heading_ar            = $input['heading_ar'];
        $Page->content            = $input['content'];
        $Page->content_ar            = $input['content_ar'];
        if($Page->save()){
            return back()->with('success','Conetnt updated successfully');
        }else{
            return back()->with('error','Conetnt updated failed , please try again');
        }
    }
}
