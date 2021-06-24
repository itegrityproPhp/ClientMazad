<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Coupon;
use App\Models\Package;
use App\Models\Test;
use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;

class CouponController extends Controller{
   public function index(Request $request){
        $Coupons = Coupon::orderBy('id','desc')->get();
        //$number_key=1;
        // foreach ($coupons as $key => $value) {
        //     $value->number_key=$number_key;
        //     $number_key++;
        // }
        $data['Coupons']=$Coupons;
        //return $data['coupons'][0]->package->package_name;
        return view('backend.coupon.index')->with($data);
    }

    public function create(Request $request){
        $data = [];
        return view('backend.coupon.create')->with($data);
    }

    public function store(Request $request){
        $inputs   = $request->all();
        $rules = [
            'coupon_code'               => 'required',
            'select_coupon_type'        => 'required',
            'coupon_value'              => 'required',
            'coupon_start_date'         => 'required',
            'coupon_end_date'           => 'required',
        ];
        $this->validate($request,$rules);
        $Coupon                     = new Coupon();
        $Coupon->coupon_code        = $inputs['coupon_code'];
        $Coupon->coupon_type        = $inputs['select_coupon_type'];
        $Coupon->coupon_value       = $inputs['coupon_value'];
        $Coupon->coupon_start_date  = $inputs['coupon_start_date'];
        $Coupon->coupon_end_date    = $inputs['coupon_end_date'];
        if($Coupon->save()){
            return Redirect('backend/coupon')->with('success','Coupon added successfully');
        }else{
            return back()->with('error','Coupon added failed , please try again');
        }
    }

    public function edit(Request $request , $id){
        $Coupon = Coupon::find($id);
        $data['Coupon'] = $Coupon;
        return view('backend.coupon.edit')->with($data);
    }

    public function update(Request $request,$id){
        $inputs   = $request->all();
        $rules = [
            'coupon_code'               => 'required',
            'select_coupon_type'        => 'required',
            'coupon_value'              => 'required',
            'coupon_start_date'         => 'required',
            'coupon_end_date'           => 'required',
        ];
        $this->validate($request,$rules);
        $Coupon                     = Coupon::find($id);
        $Coupon->coupon_code        = $inputs['coupon_code'];
        $Coupon->coupon_type        = $inputs['select_coupon_type'];
        $Coupon->coupon_value       = $inputs['coupon_value'];
        $Coupon->coupon_start_date  = $inputs['coupon_start_date'];
        $Coupon->coupon_end_date    = $inputs['coupon_end_date'];
        if($Coupon->save()){
            return Redirect('backend/coupon')->with('success','Coupon updated successfully');
        }else{
            return back()->with('error','Coupon updated failed , please try again');
        }
    }

    public function view(Request $request , $id){
        $data['coupon']  = Coupon::find($id);
        $data['js'] = ['coupon/view.js'];
        return view('admin.coupon.view',compact('data'));
    }
    public function destroy($id){
        $Coupon =  Coupon::find($id);
        if($Coupon){
            // if(File::exists(public_path('uploads/banner/'.$Banner->image))){
            //     File::delete(public_path('uploads/banner/'.$Banner->image));
            // }
            if($Coupon->delete()){
                return ['status'=>'success','message'=>'Coupon deleted successfully'];
            }else{
                return ['status'=>'failed','message'=>'Coupon deleted failed,please try again'];
            }
        }
    }
}
