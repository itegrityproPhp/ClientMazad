<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Notification;
use Illuminate\Validation\Rule;
use App\Helpers\ApiHelper;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use Carbon\Carbon;

use App\Http\Controllers\Controller;
class HomeController extends Controller{
    public function __construct(){
        $this->middleware('auth');
    }
    public function index(){
        $data['user_count']             = User::where('role','2')->count();
        return view('backend.dashboard',compact('data'));
    }

    public function getNotification(Request $request){
        $inputs = $request->all();
        $admin_id = Auth::user()->id;
        $Notification = Notification::where('notification_for','admin')->where('receiver_id',$admin_id)->orderBy('id','desc')->limit(10)->get();
        foreach ($Notification as $key => $value) {
            $value->time_elapsed_string = ApiHelper::timeElapsedString($value->created_at,false);
            $value->json_data=json_decode($value->json_data);
        }
        return ['status'=>true,'message'=>'Record found' ,'data'=>$Notification];
    }

    public function upload(Request $request){
        if($request->hasFile('upload')) {
            $originName = $request->file('upload')->getClientOriginalName();
            $fileName = pathinfo($originName, PATHINFO_FILENAME);
            $extension = $request->file('upload')->getClientOriginalExtension();
            $fileName = $fileName.'_'.time().'.'.$extension;
        
            $request->file('upload')->move(public_path('images'), $fileName);
   
            $CKEditorFuncNum = $request->input('CKEditorFuncNum');
            $url = asset('images/'.$fileName); 
            $msg = 'Image uploaded successfully'; 
            $response = "<script>window.parent.CKEDITOR.tools.callFunction($CKEditorFuncNum, '$url', '$msg')</script>";
               
            //@header('Content-type: text/html; charset=utf-8'); 
            return response()->json([ 'fileName' => $fileName, 'uploaded' => true, 'url' => $url, ]);
            //return $response;
            //echo $response;
        }
    }
}
