<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Country;
use App\Models\Area;

use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class AreaController extends Controller{
   public function index(Request $request){
        $Areas = Area::orderBy('id','desc')->get();
        $data['Areas']=$Areas;
        return view('backend.area.index')->with($data);
    }

    public function create(Request $request){
        $Countries = Country::all()->pluck('country_name','id')->prepend('Select Country','');
        //return $Countries;
        $data['Countries'] = $Countries;
        return view('backend.area.create')->with($data);
    }

    public function store(Request $request){
        $inputs   = $request->all();
        $rules = [
            'select_country'         => 'required',
            'area_name'              => 'required',
            'area_name_ar'           => 'required',
        ];
        $messages = [
            'select_country.required'         => 'The select country field is required.',
            'area_name.required'              => 'The area name field is required.',
            'area_name_ar.required'           => 'The area name ar field is required.',
        ];
        $this->validate($request,$rules,$messages);
        $City                     = new Area();
        $City->country_id         = $inputs['select_country'];
        $City->area_name          = $inputs['area_name'];
        $City->area_name_ar       = $inputs['area_name_ar'];
        if($City->save()){
            return Redirect('backend/area')->with('success','Area added successfully');
        }else{
            return back()->with('error','Area added failed , please try again');
        }
    }

    public function edit(Request $request , $id){
        $Countries  = Country::all()->pluck('country_name','id')->prepend('Select Country','');
        $area       = Area::find($id);
        $data['Countries']  = $Countries;
        $data['area']       = $area;
        return view('backend.area.edit')->with($data);
    }

    public function update(Request $request,$id){
        $inputs   = $request->all();
        $rules = [
            'select_country'         => 'required',
            'area_name'              => 'required',
            'area_name_ar'           => 'required',
        ];
        $messages = [
            'select_country.required'         => 'The select country field is required.',
            'area_name.required'              => 'The area name field is required.',
            'area_name_ar.required'           => 'The area name ar field is required.',
        ];
        $this->validate($request,$rules,$messages);
        $area                     = Area::find($id);
        $area->country_id         = $inputs['select_country'];
        $area->area_name          = $inputs['area_name'];
        $area->area_name_ar       = $inputs['area_name_ar'];
        if($area->save()){
            return Redirect('backend/area')->with('success','Area updated successfully');
        }else{
            return back()->with('error','Area updated failed , please try again');
        }
    }

    public function view(Request $request , $id){
        $data['area']  = Area::find($id);
        $data['js'] = ['area/view.js'];
        return view('admin.area.view',compact('data'));
    }
    public function destroy($id){
        $area =  Area::find($id);
        if($area){
            // if(File::exists('uploads/category/'.$Category->image)){
            //     File::delete('uploads/category/'.$Category->image);
            // }
            if($area->delete()){
                return ['status'=>'success','message'=>'Area deleted successfully'];
            }else{
                return ['status'=>'failed','message'=>'Area deleted failed,please try again'];
            }
        }
    }
}
