<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\PropertyType;
use App\Models\Property;
use App\Models\RequestsToApply;
use App\Models\RequestsForTour;
use App\Models\Comment;
use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class RentController extends Controller{
   public function index(Request $request){
        $Properties = Property::where('type','3')->orderBy('id','desc')->get();
        $data['Properties']=$Properties;
        return view('backend.rent.index')->with($data);
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
        $Property                        = new Property();
        $Property->name                 = $inputs['name'];
        $Property->name_ar              = $inputs['name_ar'];
        if($Property->save()){
            return Redirect('backend/property')->with('success',$Messages['property_add_success']);
        }else{
            return back()->with('error',$Messages['property_add_error']);
        }
    }

    public function edit(Request $request , $id){
        $Property          = Property::find($id);
        $data['Property']  = $Property;
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
        $Property                      = Property::find($id);
        $Property->name                = $inputs['name'];
        $Property->name_ar             = $inputs['name_ar'];
        if($Property->save()){
            return Redirect('backend/property')->with('success',$Messages['property_update_success']);
        }else{
            return back()->with('error',$Messages['property_update_error']);
        }
    }

    public function view(Request $request , $id){
        $Property          = Property::find($id);
        //return $Auction->propertyImages;
        $data['Property']  = $Property;
        return view('backend.rent.view')->with($data);
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
                return ['status'=>'success','message'=>$Messages['property_delete_success']];
            }else{
                return ['status'=>'failed','message'=>$Messages['property_delete_error']];
            }
        }
    }
    
    public function requests($property_id){
        $RequestsToApply = RequestsToApply::has('property')->has('user')->where('property_id',$property_id)->get();
        $RequestsForTour = RequestsForTour::has('property')->has('user')->where('property_id',$property_id)->get();
        
        return view('backend.rent.requests',compact('RequestsToApply','RequestsForTour'));
    }
    public function change_buy_req_status(Request $request){
        $inputs     = $request->all();
        $req        =  RequestsToApply::find($inputs['id']);
        $req->status = $inputs['value'];
        if($req->save()){
            return ['status'=>true,'message'=>'Requests status changed successfully'];
        }else{
            return ['status'=>false,'message'=>'Unable to change request status'];
        }
    }
    public function change_tour_req_status(Request $request){
        $inputs     = $request->all();
        $req        =  RequestsForTour::find($inputs['id']);
        $req->status = $inputs['value'];
        if($req->save()){
            return ['status'=>true,'message'=>'Requests status changed successfully'];
        }else{
            return ['status'=>false,'message'=>'Unable to change request status'];
        }
    }
    public function chats($property_id){
        $chats = Comment::has('property')->has('senderUser')->has('receiverUser')->where('property_id',$property_id)->get();
        $Property = Property::find($property_id);
        
        $data = array();
		foreach($chats as $chat){
		    if($chat->sender_id != $Property->user_id){
			    
				if(!isset($data[$chat->sender_id])){
					$data[$chat->sender_id] = array(
							"user_id"=>$Property->user_id,
							"other_user_id"=>$chat->sender_id,
							"property_id"=>$property_id,
							"name"=>$chat->receiverUser->first_name.' '.$chat->receiverUser->second_name,
							"other_user_name"=>$chat->senderUser->first_name.' '.$chat->senderUser->second_name
						);
				}
				
			}else if($chat->receiver_id != $Property->user_id){
			    
				if($chat->receiver_id != null){
				    if(!isset($data[$chat->receiver_id])){
						$data[$chat->receiver_id] = array(
							"user_id"=>$Property->user_id,
							"other_user_id"=>$chat->receiver_id,
							"property_id"=>$property_id,
							"name"=>$chat->senderUser->first_name.' '.$chat->senderUser->second_name,
							"other_user_name"=>$chat->receiverUser->first_name.' '.$chat->receiverUser->second_name
						);	
					}
				}
			}
			
		}
        
        return view('backend.rent.chats',compact('data'));
    }
    public function messages($user_id,$other_user_id,$property_id){
        $messages = Comment::has('property')->has('senderUser')->has('receiverUser')
                        ->whereIn('sender_id',[$user_id,$other_user_id])->WhereIn('receiver_id',[$user_id,$other_user_id])
                        ->where('property_id',$property_id)->orderBy('id','desc')->get();
        $data = array();

		foreach($messages as $message){
			
			if($message->sender_id == $user_id){
				$data[]  = array(
							'id'=>$message->id,
							"type"=>"send",
							"message"=>$message->comment,
							"user_name"=>$message->senderUser->first_name.' '.$message->senderUser->second_name,
							"msg_time"=>$message->created_at->diffForHumans()
						);
			}else{
				$data[]  = array(
							'id'=>$message->id,
							"type"=>"receive",
							"message"=>$message->comment,
							"user_name"=>$message->senderUser->first_name.' '.$message->senderUser->second_name,
							"msg_time"=>$message->created_at->diffForHumans()
						);
			}
			
		}
        
        
        return view('backend.rent.messages',compact('data'));
    }
}
