<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Country;

use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class CountryController extends Controller{
   public function index(Request $request){
        $Countries = Country::orderBy('id','desc')->get();
        if($Countries)
        foreach ($Countries as $key => $value) {
            $value->country_flag_url = ImageHelper::getCountryFlagPath($value->country_flag);
        }
        $data['Countries']=$Countries;
        return view('backend.country.index')->with($data);
    }

    public function create(Request $request){
        $data = [];
        return view('backend.country.create')->with($data);
    }

    public function store(Request $request){
        $inputs   = $request->all();
        $rules = [
            'country_name'              => 'required',
            'country_name_ar'           => 'required',
            'country_sort_name'         => 'required',
            'country_flag'              => 'required',
            'country_code'              => 'required',
            'currency_name'             => 'required',
            'currecy_symbol'            => 'required',
        ];
        $messages = [
            'country_name.required'              => 'The country name field is required.',
            'country_name_ar.required'           => 'The country name ar field is required.',
            'country_sort_name.required'         => 'The country sort name field is required.',
            'country_flag.required'              => 'The country flag field is required.',
            'country_code.required'              => 'The country code field is required.',
            'currency_name.required'             => 'The currency name field is required.',
            'currecy_symbol.required'            => 'The currecy symbol field is required.',
        ];
        $this->validate($request,$rules,$messages);
        $country_flag=null;
        if($request->hasFile('country_flag')) {
            $country_flag = Str::random(10).'_'.time().'.'.request()->country_flag->getClientOriginalExtension();
            request()->country_flag->move(ImageHelper::$getCountryFlagPath, $country_flag);
        }
        $Country                        = new Country();
        $Country->country_name          = $inputs['country_name'];
        $Country->country_name_ar       = $inputs['country_name_ar'];
        $Country->country_sort_name     = $inputs['country_sort_name'];
        $Country->country_code          = $inputs['country_code'];
        $Country->currency_name         = $inputs['currency_name'];
        $Country->currecy_symbol        = $inputs['currecy_symbol'];
        if($country_flag){
            $Country->country_flag      = $country_flag;
        }
        if($Country->save()){
            return Redirect('backend/country')->with('success','Country added successfully');
        }else{
            return Redirect('backend/country')->with('error','Country added failed , please try again');
        }
    }

    public function edit(Request $request , $id){
        $Country = Country::find($id);
        if($Country){
            $Country->country_flag_url =  ImageHelper::getCountryFlagPath($Country->country_flag);
        }
        $data['Country'] = $Country;
        return view('backend.country.edit')->with($data);
    }

    public function update(Request $request,$id){
        $inputs   = $request->all();
        $rules = [
            'country_name'              => 'required',
            'country_name_ar'           => 'required',
            'country_sort_name'         => 'required',
            //'country_flag'              => 'required',
            'country_code'              => 'required',
            'currency_name'             => 'required',
            'currecy_symbol'            => 'required',
        ];
        $messages = [
            'country_name.required'              => 'The country name field is required.',
            'country_name_ar.required'           => 'The country name ar field is required.',
            'country_sort_name.required'         => 'The country sort name field is required.',
            //'country_flag.required'              => 'The country flag field is required.',
            'country_code.required'              => 'The country code field is required.',
            'currency_name.required'             => 'The currency name field is required.',
            'currecy_symbol.required'            => 'The currecy symbol field is required.',
        ];
        $this->validate($request,$rules,$messages);
        $country_flag=null;
        if($request->hasFile('country_flag')) {
            $country_flag = Str::random(10).'_'.time().'.'.request()->country_flag->getClientOriginalExtension();
            request()->country_flag->move(ImageHelper::$getCountryFlagPath, $country_flag);
        }
        $Country                        = Country::find($id);
        $Country->country_name          = $inputs['country_name'];
        $Country->country_name_ar       = $inputs['country_name_ar'];
        $Country->country_sort_name     = $inputs['country_sort_name'];
        $Country->country_code          = $inputs['country_code'];
        $Country->currency_name         = $inputs['currency_name'];
        $Country->currecy_symbol        = $inputs['currecy_symbol'];
        if($country_flag){
            $Country->country_flag      = $country_flag;
        }
        if($Country->save()){
            return Redirect('backend/country')->with('success','Country updated successfully');
        }else{
            return Redirect('backend/country')->with('error','Country updated failed , please try again');
        }
    }

    public function view(Request $request , $id){
        $data['city']  = City::find($id);
        $data['js'] = ['city/view.js'];
        return view('admin.city.view',compact('data'));
    }
    public function destroy($id){
        $Country =  Country::find($id);
        if($Country){
            if($Country->country_flag){
                if(File::exists(ImageHelper::$getCountryFlagPath.$Country->country_flag)){
                    File::delete(ImageHelper::$getCountryFlagPath.$Country->country_flag);
                }
            }
            if($Country->delete()){
                return ['status'=>'success','message'=>'Country deleted successfully'];
            }else{
                return ['status'=>'failed','message'=>'Country deleted failed,please try again'];
            }
        }
    }
}
