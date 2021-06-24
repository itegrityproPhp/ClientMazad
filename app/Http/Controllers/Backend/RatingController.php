<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Rating;

use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;

class RatingController extends Controller{
    public function privateRating(Request $request){
        $Ratings = Rating::where('type','1')->get();
        $data['Ratings']=$Ratings;
        return view('backend.rating.private')->with($data);
    }
    public function forcedRating(Request $request){
        $Ratings = Rating::where('type','2')->get();
        $data['Ratings']=$Ratings;
        return view('backend.rating.forced')->with($data);
    }
    
    public function edit(Request $request , $id){
        $data['content']  = Page::find($id);
        //$data['js'] = ['content/edit.js'];
        return view('admin.content.edit',compact('data'));
    }
    
    public function destroy($id){
        $rating =  Rating::find($id);
        if($rating){
            if($rating->delete()){
                return ['status'=>'success','message'=>'Rating deleted successfully'];
            }else{
                return ['status'=>'failed','message'=>'Rating deleted failed,please try again'];
            }
        }
    }
}
