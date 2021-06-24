<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\PropertyType;
use App\Models\Property;
use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class AuctionLocationController extends Controller{
   public function index(Request $request){
        $Auctions = Property::where('type','2')->orderBy('id','desc')->get();
        //return $Auctions;
        $data['Auctions']=$Auctions;
        return view('backend.auction_location.index')->with($data);
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
