<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Country;
use App\Models\City;
use App\Models\Area;

use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class CityController extends Controller{
   public function index(Request $request){
        $Cities = City::orderBy('id','desc')->get();
        $data['Cities']=$Cities;
        return view('backend.city.index')->with($data);
    }

    public function create(Request $request){
        $Countries = Country::all()->pluck('country_name','id')->prepend('Select Country','');
        //return $Countries;
        $data['Countries'] = $Countries;
        return view('backend.city.create')->with($data);
    }

    public function store(Request $request){
        $inputs   = $request->all();
        $rules = [
            'select_country'         => 'required',
            'select_area'         => 'required',
            'city_name'              => 'required',
            'city_name_ar'           => 'required',
        ];
        $messages = [
            'select_country.required'         => 'The select country field is required.',
            'select_area.required'         => 'The select area field is required.',
            'city_name.required'              => 'The city name field is required.',
            'city_name_ar.required'           => 'The city name ar field is required.',
        ];
        $this->validate($request,$rules,$messages);
        $City                     = new City();
        $City->country_id         = $inputs['select_country'];
        $City->state_id         = $inputs['select_area'];
        $City->city_name          = $inputs['city_name'];
        $City->city_name_ar       = $inputs['city_name_ar'];
        if($City->save()){
            return Redirect('backend/city')->with('success','City added successfully');
        }else{
            return back()->with('error','City added failed , please try again');
        }
    }

    public function edit(Request $request , $id){
        $Countries  = Country::all()->pluck('country_name','id')->prepend('Select Country','');
        $areas  = Area::all()->pluck('area_name','id')->prepend('Select Area','');
        $City       = City::find($id);
        $data['Countries']  = $Countries;
        $data['areas']  = $areas;
        $data['City']       = $City;
        return view('backend.city.edit')->with($data);
    }

    public function update(Request $request,$id){
        $inputs   = $request->all();
        $rules = [
            'select_country'         => 'required',
            'select_area'         => 'required',
            'city_name'              => 'required',
            'city_name_ar'           => 'required',
        ];
        $messages = [
            'select_country.required'         => 'The select country field is required.',
            'select_area.required'         => 'The select area field is required.',
            'city_name.required'              => 'The city name field is required.',
            'city_name_ar.required'           => 'The city name ar field is required.',
        ];
        $this->validate($request,$rules,$messages);
        $City                     = City::find($id);
        $City->country_id         = $inputs['select_country'];
        $City->state_id         = $inputs['select_area'];
        $City->city_name          = $inputs['city_name'];
        $City->city_name_ar       = $inputs['city_name_ar'];
        if($City->save()){
            return Redirect('backend/city')->with('success','City updated successfully');
        }else{
            return back()->with('error','City updated failed , please try again');
        }
    }

    public function view(Request $request , $id){
        $data['city']  = City::find($id);
        $data['js'] = ['city/view.js'];
        return view('admin.city.view',compact('data'));
    }
    public function destroy($id){
        $City =  City::find($id);
        if($City){
            // if(File::exists('uploads/category/'.$Category->image)){
            //     File::delete('uploads/category/'.$Category->image);
            // }
            if($City->delete()){
                return ['status'=>'success','message'=>'City deleted successfully'];
            }else{
                return ['status'=>'failed','message'=>'City deleted failed,please try again'];
            }
        }
    }
    public function get_area_by_country(Request $request){
        $id = $request->id;
        
        $areas = Area::where('country_id',$id)->get();
        if(count($areas) > 0){
            return response()->json(['status'=>true,'message'=>'success','data'=>$areas], 200);
        }else{
            return response()->json(['status'=>false,'message'=>'No Area Found'], 200);
        }
        
    }
}
