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

class PropertyController extends Controller{
   public function index(Request $request){
        $Properties = Property::where('type','1')->orderBy('id','desc')->get();
        $data['Properties']=$Properties;
        return view('backend.property.index')->with($data);
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
        return view('backend.property.view')->with($data);
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
}
