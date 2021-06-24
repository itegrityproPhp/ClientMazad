<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Role;
use App\Models\Notification;
use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class NotificationController extends Controller{
    public function index(Request $request){
        $sender_id = Auth::user()->id;
        $Notifications = Notification::where('sender_id',$sender_id)->orderBy('id','desc')->get();
        if($Notifications){
            foreach ($Notifications as $key => $value) {
                $user_type = '';
                $value->json_data = json_decode($value->json_data);
                if($value->json_data){
                    if(isset($value->json_data->role)){
                        $Role = Role::where('id',$value->json_data->role)->first();
                        if($Role){
                            $user_type = $Role->name;
                        }
                    }
                }
                $value->user_type = $user_type;
            }
        }
        //return $Notifications;
        $data['Notifications']=$Notifications;
        return view('backend.notification.index')->with($data);
    }
    public function sendNotification(Request $request){
        $data = [];
        $data['Roles'] = Role::all()->pluck('name','id')->prepend('Select User Type','');
        return view('backend.notification.send_notification')->with($data);
    }

    public function getUser(Request $request){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $User = User::where('role',$inputs['user_type'])->get();
        if($User->toArray()){
            return response()->json(['status'=>true,'status_code'=>'200','message'=>$Messages['record_found'],'data'=>$User,'error'=>[]], 200);
        }else{
            return response()->json(['status'=>false,'status_code'=>'200','message'=>$Messages['record_not_found'],'data'=>(object)[],'error'=>[]], 200);
        }
    }
    
    public function storeSendNotification(Request $request){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];

        $inputs   = $request->all();
        $rules = [
            'user_type'               => 'required',
            'select_type'             => 'required',
        ];
        $messages = [
            'user_type.required'        => $Validation['user_type'],
            'select_type.required'      => $Validation['select_type'],
        ];
        $this->validate($request,$rules,$messages);
        if($inputs['select_type']=='1'){
            $User = User::where('role',$inputs['user_type'])->get();
        }else{
            $User = User::where('role',$inputs['user_type'])->whereIn('id',$inputs['select_users'])->get();
        }
        if($User->toArray()){
            $NotificationArr = [];
            foreach ($User as $key => $value) {
                if($value->device_type && $value->device_token){
                    $tmp = [];
                    $sender_id          = Auth::user()->id;
                    $receiver_id        = $value->id;
                    $role               = $value->role;
                    $notification_type  = 'by_admin';
                    $title              = $inputs['title'];
                    $title_ar           = $inputs['title_ar'];
                    $message            = $inputs['message'];
                    $message_ar         = $inputs['message_ar'];
                    $JsonData = [
                        'sender_id'         => $sender_id,
                        'receiver_id'       => $receiver_id,
                        'notification_type' => $notification_type,
                        'role'              => $role,
                        'title'             => $title,
                        'title_ar'          => $title_ar,
                        'message'           => $message,
                        'message_ar'        => $message_ar,
                    ];
                    $JsonData                   = json_encode($JsonData);
                    $tmp['sender_id']           = $sender_id;
                    $tmp['receiver_id']         = $receiver_id;
                    $tmp['title']               = $title;
                    $tmp['title_ar']            = $title_ar;
                    $tmp['message']             = $message;
                    $tmp['message_ar']          = $message_ar;
                    $tmp['json_data']           = $JsonData;
                    array_push($NotificationArr, $tmp);
                }
            }
            
            if($NotificationArr){
                Notification::insert($NotificationArr);
                return Redirect('backend/notification')->with('success',$Messages['notification_send_success']);
            }else{
                return Redirect('backend/notification')->with('success',$Messages['notification_send_error']);
            }
        }else{
            return back()->with('error',$Messages['record_not_found']);
        }
    }
    
    public function create(Request $request){
        $data = [];
        return view('backend.auction.create')->with($data);
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
        $Auction                        = new Property();
        $Auction->name                 = $inputs['name'];
        $Auction->name_ar              = $inputs['name_ar'];
        if($Property->save()){
            return Redirect('backend/auction')->with('success',$Messages['auction_add_success']);
        }else{
            return back()->with('error',$Messages['auction_add_error']);
        }
    }

    public function edit(Request $request , $id){
        $Auction          = Property::find($id);
        $data['Auction']  = $Auction;
        return view('backend.auction.edit')->with($data);
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
        $Auction                      = Property::find($id);
        $Auction->name                = $inputs['name'];
        $Auction->name_ar             = $inputs['name_ar'];
        if($Auction->save()){
            return Redirect('backend/auction')->with('success',$Messages['auction_update_success']);
        }else{
            return back()->with('error',$Messages['auction_update_error']);
        }
    }

    public function view(Request $request , $id){
        $Auction          = Property::find($id);
        //return $Auction->propertyImages;
        $data['Auction']  = $Auction;
        return view('backend.auction.view')->with($data);
    }
    public function destroy(Request $request,$id){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $Property       =  Property::find($id);
        if($Property){
            // if(File::exists(ImageHelper::$getFormPath.$Form->form)){
            //     File::delete(ImageHelper::$getFormPath.$Form->form);
            // }
            if($Property->delete()){
                return ['status'=>'success','message'=>$Messages['auction_delete_success']];
            }else{
                return ['status'=>'failed','message'=>$Messages['auction_delete_error']];
            }
        }
    }
}
