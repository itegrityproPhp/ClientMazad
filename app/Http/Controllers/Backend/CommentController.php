<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Comment;

use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;

class CommentController extends Controller{
    public function privateComment(Request $request){
        $Comments = Comment::where('type','1')->get();
        $data['Comments']=$Comments;
        return view('backend.comment.private')->with($data);
    }
    public function forcedComment(Request $request){
        $Comment = Comment::where('type','2')->get();
        $data['Comment']=$Comment;
        return view('backend.comment.forced')->with($data);
    }
    public function view(Request $request , $id){
        $data['Comment']  = Comment::find($id);
        return view('backend.comment.view')->with($data);
    }
    public function destroy($id){

        $Comment =  Comment::find($id);
        if($Comment){
            if($Comment->delete()){
                return ['status'=>'success','message'=>'Comment deleted successfully'];
            }else{
                return ['status'=>'failed','message'=>'Comment deleted failed,please try again'];
            }
        }
    }
     public function store(Request $request){
        $inputs     = $request->all();
        $Comment                =  Comment::find($inputs['id']);
        $Comment->replay        =  $inputs['comment'];
        $Comment->replay_status = '1';
        if($Comment->save()){
            return back()->with('success','Comment added successfully');
        }else{
            return back()->with('error','Comment added failed,please try again');
        }
    }  
}
