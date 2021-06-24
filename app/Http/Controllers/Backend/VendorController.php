<?php
namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Mail;
use Illuminate\Validation\Rule;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Category;
use App\Models\EmailTemplate;
use App\Models\City;
use App\Models\Booking;
use App\Models\BookingProduct;
use App\Mail\NotifyMail;
use App\Helpers\ImageHelper;
use App\Helpers\ApiHelper;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class VendorController extends Controller{
   public function index(Request $request){
        $vendors = User::where('role', '=', "3")->orderBy('id','desc')->get();
        $number_key=1;
        foreach ($vendors as $key => $value) {
            $value->number_key=$number_key;
            $number_key++;
            $value->user_image=ImageHelper::getProfileImage($value->user_image);
        }
        $data['vendors']=$vendors;
        return view('admin.vendor.index',compact('data'));
    }

    public function create(Request $request){
        $data['category'] = Category::where('parent_cat_id','0')->get();
        $data['cities'] = City::orderBy('id','desc')->get();
        //$data['js'] = ['user/create.js'];
        return view('admin.vendor.create',compact('data'));
    }

    public function store(Request $request){
        $input   = $request->all();
        $rules = [
            'lab_name'              => 'required',
            'add_lab_logo'          => 'required',
            'name'                  => 'required',
            'email'                 => ['required', Rule::unique('users', 'email')],
            'phone_number'          => ['required','size:8', Rule::unique('users', 'phone_number')],
            'emergency_contact'     => 'required',
            'contract_start_date'   => 'required',
            'contract_end_date'     => 'required',
            'lab_open_time'         => 'required',
            'lab_close_time'        => 'required',
            'select_city'           => 'required',
            'location'              => 'required',
            'lat'                   => 'required',
            'lng'                   => 'required',
            'block'                 => 'required',
            'street_lane'           => 'required',
            'building_number_floor' => 'required',
            'licence_no'            => 'required',
            'licence_expiry_date'   => 'required',
            'upload_licence_file'   => 'required',
            'contract_store_pdf'    => 'required',
            // 'address'           => 'required',
            // 'address_ar'        => 'required',
            //'lab_category'      => 'required',
            //'lab_description'   => 'required',
            //'lab_description_ar'   => 'required',
            //'civil_id_no'=> 'required',
            //'upload_civil_id'=> 'required',
            //'civil_id_expiry_date'=> 'required',
            //'commission'=> 'required',
        ];
        $messages = [
            'lab_name.required'             => 'The name of the lab field is required.',
            'add_lab_logo.required'         => 'The add lab logo field is required.',
            'name.required'                 => 'The name of contact person field is required.',
            'email.required'                => 'The login email field is required.',
            'phone_number.required'         => 'The phone number field is required.',
            'emergency_contact.required'    => 'The emergency contact number field is required.',
            'location.required'             => 'The select area field is required.',
            'street_lane.required'          => 'The street/lane field is required.',
            'building_number_floor.required'=> 'The building_number/floor field is required.',
            // 'contract_start_date.required'           => 'The login email field is required.',
            // 'contract_end_date.required'           => 'The login email field is required.',
            // 'lab_open_time.required'           => 'The login email field is required.',
            // 'lab_close_time.required'           => 'The login email field is required.',
            // 'select_city.required'           => 'The login email field is required.',
            // 'lat.required'           => 'The login email field is required.',
            // 'lng.required'           => 'The login email field is required.',
            // 'block.required'           => 'The login email field is required.',
            // 'licence_no.required'           => 'The login email field is required.',
            // 'licence_expiry_date.required'           => 'The login email field is required.',
            // 'upload_licence_file.required'           => 'The login email field is required.',
            // 'contract_store_pdf.required'           => 'The login email field is required.',
        ];
        $this->validate($request,$rules,$messages);

        $contract_store_pdf=null;
        if($request->hasFile('contract_store_pdf')) {
            $contract_store_pdf = Str::random(10).'_'.time().'.'.request()->contract_store_pdf->getClientOriginalExtension();
            request()->contract_store_pdf->move(public_path('uploads/contract_store/'), $contract_store_pdf);
        }

        $add_lab_logo=null;
        if($request->hasFile('add_lab_logo')) {
            $add_lab_logo = Str::random(10).'_'.time().'.'.request()->add_lab_logo->getClientOriginalExtension();
            request()->add_lab_logo->move(public_path('uploads/profile/'), $add_lab_logo);
        }

        // $upload_civil_id=null;
        // if($request->hasFile('upload_civil_id')) {
        //     $upload_civil_id = Str::random(10).'_'.time().'.'.request()->upload_civil_id->getClientOriginalExtension();
        //     request()->upload_civil_id->move(public_path('uploads/contract_store/'), $upload_civil_id);
        // }

        $upload_licence_file=null;
        if($request->hasFile('upload_licence_file')) {
            $upload_licence_file = Str::random(10).'_'.time().'.'.request()->upload_licence_file->getClientOriginalExtension();
            request()->upload_licence_file->move(public_path('uploads/contract_store/'), $upload_licence_file);
        }

        $password_show = Str::random(8);
        $password = Hash::make($password_show);
        $Vendor                         = new User();
        $Vendor->role                   = '3';
        $Vendor->lab_name               = $input['lab_name'];
        $Vendor->name                   = $input['name'];
        $Vendor->email                  = $input['email'];
        $Vendor->phone_number           = $input['phone_number']; 
        $Vendor->emergency_contact      = $input['emergency_contact'];
        $Vendor->contract_start_date    = $input['contract_start_date'];
        $Vendor->contract_end_date      = $input['contract_end_date'];
        $Vendor->lab_open_time          = $input['lab_open_time'];
        $Vendor->lab_close_time         = $input['lab_close_time'];
        $Vendor->city_id                = $input['select_city'];
        $Vendor->location               = $input['location'];
        $Vendor->block                  = $input['block'];
        $Vendor->street_lane            = $input['street_lane'];
        $Vendor->building_number_floor  = $input['building_number_floor'];
        $Vendor->licence_no             = $input['licence_no'];
        $Vendor->licence_expiry_date    = $input['licence_expiry_date'];
        // $Vendor->address            = $input['address'];
        // $Vendor->address_ar         = $input['address_ar'];
        //$Vendor->lab_category       = $input['lab_category'];
        // $Vendor->lab_description    = $input['lab_description'];
        // $Vendor->lab_description_ar = $input['lab_description_ar'];
        // $Vendor->civil_id_no        = $input['civil_id_no'];
        // $Vendor->civil_id_expiry_date = $input['civil_id_expiry_date'];
        // if(!empty($input['commission'])){
        //     $Vendor->commission = $input['commission'];
        // }
        if(!empty($input['lat'])){
            $Vendor->lat            = $input['lat'];
        }
        if(!empty($input['lng'])){
            $Vendor->lng            = $input['lng'];
        }
        if($password){
            $Vendor->password      = $password;
        }
        if($add_lab_logo){
            $Vendor->user_image    = $add_lab_logo;
        }
        if($upload_licence_file){
            $Vendor->upload_licence_file    = $upload_licence_file;
        }
        if($contract_store_pdf){
            $Vendor->contract_store_pdf    = $contract_store_pdf;
        }
        // if($upload_civil_id){
        //     $Vendor->upload_civil_id    = $upload_civil_id;
        // }
        

        if($Vendor->save()){
                $email_content = EmailTemplate::where('id', 4)->first();
                $searchArray = array("{user_name}", "{email}", "{password}", "{logo_url}" , "{site_url}");
                $replaceArray = array($Vendor->name , $Vendor->email, $password_show , url('/admin_assets/images/logo.png'), url('/'));

                $content = str_replace($searchArray, $replaceArray, $email_content->content);

                $email_data['name'] = $Vendor->name;
                $email_data['email'] = $Vendor->email;
                $email_data['passowrd'] = $password_show;
                $email_data['subject'] = $email_content->subject;
                $email_data['content'] = $content;

                $inData['from_email']     =  'test1@gmail.com';
                $inData['subject']     =  $email_content->subject;
                $inData['email']     =  $Vendor->email;

                Mail::send('admin.email_template.sendemail',$email_data, function ($message) use ($inData) {
                    $message->from($inData['from_email'],'Online Lab');
                    $message->to($inData['email']);
                    $message->subject($inData['subject']);
                }); 
            return back()->with('success','Vendor added successfully');
        }else{
            return back()->with('error','Vendor added failed , please try again');
        }
    }

    public function edit(Request $request , $id){
        $data['category'] = Category::where('parent_cat_id','0')->get();
        $data['cities'] = City::orderBy('id','desc')->get();
        $data['vendor']  = User::find($id);
        if($data['vendor']){
            $data['vendor']->user_image=ImageHelper::getProfileImage($data['vendor']->user_image);
            $data['vendor']->contract_store_pdf_url=ImageHelper::getContractStorePdf($data['vendor']->contract_store_pdf);
            $data['vendor']->upload_civil_id_url=ImageHelper::getContractStorePdf($data['vendor']->upload_civil_id);
            $data['vendor']->upload_licence_file_url=ImageHelper::getContractStorePdf($data['vendor']->upload_licence_file);
        }
        //$data['js'] = ['user/edit.js'];
        return view('admin.vendor.edit',compact('data'));
    }

    public function update(Request $request,$id){
        $input   = $request->all();
        $rules = [
            'lab_name'              => 'required',
            'name'                  => 'required',
            'email'                 => ['required', Rule::unique('users', 'email')->ignore($id, 'id')],
            'phone_number'          => ['required', Rule::unique('users', 'phone_number')->ignore($id, 'id')],
            'emergency_contact'     => 'required',
            'contract_start_date'   => 'required',
            'contract_end_date'     => 'required',
            'lab_open_time'         => 'required',
            'lab_close_time'        => 'required',
            'select_city'           => 'required',
            'location'              => 'required',
            'lat'                   => 'required',
            'lng'                   => 'required',
            'block'                 => 'required',
            'street_lane'           => 'required',
            'building_number_floor' => 'required',
            'licence_no'            => 'required',
            'licence_expiry_date'   => 'required',
            'reason'   => 'required',
            'reason_ar'    => 'required',
        ];
        $messages = [
            'lab_name.required'             => 'The name of the lab field is required.',
            'name.required'                 => 'The name of contact person field is required.',
            'email.required'                => 'The login email field is required.',
            'phone_number.required'         => 'The phone number field is required.',
            'emergency_contact.required'    => 'The emergency contact number field is required.',
            'location.required'             => 'The select area field is required.',
            'street_lane.required'          => 'The street/lane field is required.',
            'building_number_floor.required'=> 'The building_number/floor field is required.',
        ];
        $this->validate($request,$rules,$messages);

        $Vendor                     = User::find($id);

        $contract_store_pdf=null;
        if($request->hasFile('contract_store_pdf')) {
            $contract_store_pdf = Str::random(10).'_'.time().'.'.request()->contract_store_pdf->getClientOriginalExtension();
            request()->contract_store_pdf->move(public_path('uploads/contract_store/'), $contract_store_pdf);

            if($Vendor->contract_store_pdf){
                if(File::exists('uploads/contract_store/'.$Vendor->contract_store_pdf)){
                    File::delete('uploads/contract_store/'.$Vendor->contract_store_pdf);
                }
            }  
        }

        $add_lab_logo=null;
        if($request->hasFile('add_lab_logo')) {
            $add_lab_logo = Str::random(10).'_'.time().'.'.request()->add_lab_logo->getClientOriginalExtension();
            request()->add_lab_logo->move(public_path('uploads/profile/'), $add_lab_logo);

            if($Vendor->user_image){
                if(File::exists('uploads/profile/'.$Vendor->user_image)){
                    File::delete('uploads/profile/'.$Vendor->user_image);
                }
            }  
        }
        // $upload_civil_id=null;
        // if($request->hasFile('upload_civil_id')) {
        //     $upload_civil_id = Str::random(10).'_'.time().'.'.request()->upload_civil_id->getClientOriginalExtension();
        //     request()->upload_civil_id->move(public_path('uploads/contract_store/'), $upload_civil_id);

        //     if($Vendor->upload_civil_id){
        //         if(File::exists('uploads/contract_store/'.$Vendor->upload_civil_id)){
        //             File::delete('uploads/contract_store/'.$Vendor->upload_civil_id);
        //         }
        //     }
        // }

        $upload_licence_file=null;
        if($request->hasFile('upload_licence_file')) {
            $upload_licence_file = Str::random(10).'_'.time().'.'.request()->upload_licence_file->getClientOriginalExtension();
            request()->upload_licence_file->move(public_path('uploads/contract_store/'), $upload_licence_file);

            if($Vendor->upload_licence_file){
                if(File::exists('uploads/contract_store/'.$Vendor->upload_licence_file)){
                    File::delete('uploads/contract_store/'.$Vendor->upload_licence_file);
                }
            }
        }

        $Vendor->role                   = '3';
        $Vendor->lab_name               = $input['lab_name'];
        $Vendor->name                   = $input['name'];
        $Vendor->email                  = $input['email'];
        $Vendor->phone_number           = $input['phone_number']; 
        $Vendor->emergency_contact      = $input['emergency_contact'];
        $Vendor->contract_start_date    = $input['contract_start_date'];
        $Vendor->contract_end_date      = $input['contract_end_date'];
        $Vendor->lab_open_time          = $input['lab_open_time'];
        $Vendor->lab_close_time         = $input['lab_close_time'];
        $Vendor->city_id                = $input['select_city'];
        $Vendor->location               = $input['location'];
        $Vendor->block                  = $input['block'];
        $Vendor->street_lane            = $input['street_lane'];
        $Vendor->building_number_floor  = $input['building_number_floor'];
        $Vendor->licence_no             = $input['licence_no'];
        $Vendor->licence_expiry_date    = $input['licence_expiry_date'];
        $Vendor->reason                 = $input['reason'];
        $Vendor->reason_ar              = $input['reason_ar'];
        
        if(!empty($input['lat'])){
            $Vendor->lat                    = $input['lat'];
        }
        if(!empty($input['lng'])){
            $Vendor->lng                    = $input['lng'];
        }
        if($add_lab_logo){
            $Vendor->user_image             = $add_lab_logo;
        }
        if($upload_licence_file){
            $Vendor->upload_licence_file    = $upload_licence_file;
        }
        if($contract_store_pdf){
            $Vendor->contract_store_pdf     = $contract_store_pdf;
        }

        if($Vendor->save()){
                $email_content = EmailTemplate::where('id', 5)->first();
                $searchArray = array("{user_name}", "{email}", "{reason}", "{logo_url}" , "{site_url}");
                $replaceArray = array($Vendor->name , $Vendor->email, $Vendor->reason , url('/admin_assets/images/logo.png'), url('/'));
                $content = str_replace($searchArray, $replaceArray, $email_content->content);

                $email_data['name'] = $Vendor->name;
                $email_data['email'] = $Vendor->email;
                $email_data['reason'] = $Vendor->reason;
                $email_data['subject'] = $email_content->subject;
                $email_data['content'] = $content;

                $inData['from_email']     =  'test1@gmail.com';
                $inData['subject']     =  $email_content->subject;
                $inData['email']     =  $Vendor->email;

                Mail::send('admin.email_template.sendemail',$email_data, function ($message) use ($inData) {
                    $message->from($inData['from_email'],'Online Lab');
                    $message->to($inData['email']);
                    $message->subject($inData['subject']);
                });
            return back()->with('success','Vendor updated successfully');
        }else{
            return back()->with('error','Vendor updated failed , please try again');
        }
    }

    public function view(Request $request , $id){
        $data['vendor']  = User::find($id);
        if($data['vendor']){
            $data['vendor']->user_image=ImageHelper::getProfileImage($data['vendor']->user_image);
        }
        // echo $data['vendor']->vendorCategory->name;
        // die;
        //return $data['vendor']->vendorCategory->name;
        $data['js'] = ['user/view.js'];
        return view('admin.vendor.view',compact('data'));
    }

    public function activateVendor(Request $request){
        $inputs      = $request->all();
        $id =  $inputs['vendor_id'];
        $Vendor  = User::find($id);
        if($Vendor->status=='1'){
            $Vendor->status='2';
        }else{
           $Vendor->status='1'; 
        }
        if(!empty($inputs['reason'])){
            $Vendor->reason = $inputs['reason'];
        }
        if(!empty($inputs['reason_ar'])){
            $Vendor->reason_ar = $inputs['reason_ar'];
        }
        if($Vendor->save()){
            if($Vendor->status=='1'){  
                $email_content = EmailTemplate::where('id', 2)->first();
                $searchArray = array("{user_name}", "{email}", "{reason}", "{logo_url}" , "{site_url}");
                $replaceArray = array($Vendor->name , $Vendor->email, $Vendor->reason , url('/admin_assets/images/logo.png'), url('/'));
                $content = str_replace($searchArray, $replaceArray, $email_content->content);

                $email_data['name'] = $Vendor->name;
                $email_data['email'] = $Vendor->email;
                $email_data['reason'] = $Vendor->reason;
                $email_data['subject'] = $email_content->subject;
                $email_data['content'] = $content;

                $inData['from_email']     =  'test1@gmail.com';
                $inData['subject']     =  $email_content->subject;
                $inData['email']     =  $Vendor->email;

                Mail::send('admin.email_template.sendemail',$email_data, function ($message) use ($inData) {
                    $message->from($inData['from_email'],'Online Lab');
                    $message->to($inData['email']);
                    $message->subject($inData['subject']);
                });
                return back()->with('success','User Activate Successfully');
            }else{
                $email_content = EmailTemplate::where('id', 3)->first();
                $searchArray = array("{user_name}", "{email}", "{reason}", "{logo_url}" , "{site_url}");
                $replaceArray = array($Vendor->name , $Vendor->email, $Vendor->reason , url('/admin_assets/images/logo.png'), url('/'));
                $content = str_replace($searchArray, $replaceArray, $email_content->content);

                $email_data['name'] = $Vendor->name;
                $email_data['email'] = $Vendor->email;
                $email_data['reason'] = $Vendor->reason;
                $email_data['subject'] = $email_content->subject;
                $email_data['content'] = $content;

                $inData['from_email']     =  'test1@gmail.com';
                $inData['subject']     =  $email_content->subject;
                $inData['email']     =  $Vendor->email;

                Mail::send('admin.email_template.sendemail',$email_data, function ($message) use ($inData) {
                    $message->from($inData['from_email'],'Online Lab');
                    $message->to($inData['email']);
                    $message->subject($inData['subject']);
                });
                return back()->with('success','User Deactivate Successfully');
            }    
        }else{
            return back()->with('error','Some tecnical issue , please try again');
        }
    }

    public function transaction(Request $request,$id){
        $transactions = Booking::whereHas('bookingProduct', function($query) use ($id){
                                $query->where('lab_id',$id);
                            })
                            ->orderBy('id','desc')
                            ->get();        
        $number_key=1;
        foreach ($transactions as $key => $value) {
            $value->number_key=$number_key;
            $number_key++;
            $BookingProducts = BookingProduct::where('booking_id',$value->id)->where('lab_id',$id)->get();
            $sub_total_amount=0;
            $discount_price=0;
            foreach ($BookingProducts as $bp_key => $bp_value) {
                if($value->coupon_product_type=='test'){
                    if($bp_value->product_id==$value->coupon_product_id){
                        if($value->coupon_type=='fixed'){
                            $discount_price =  $value->coupon_value;
                        }
                        else{
                            $discount_price = ($bp_value->price*$value->coupon_value)/100;
                        }
                    }
                }elseif($value->coupon_product_type=='package'){
                    if($bp_value->product_id==$value->coupon_product_id){
                        if($value->coupon_type=='fixed'){
                            $discount_price =  $value->coupon_value;
                        }
                        else{
                            $discount_price = ($bp_value->price*$value->coupon_value)/100;
                        }
                    }
                }
                $value->lab_id = $bp_value->lab->id;
                $sub_total_amount+= $bp_value->price;
                $discount_price = $discount_price;
            }
            $value->show_sub_total_amount= $sub_total_amount;
            $value->show_discount_price = $discount_price;
            $value->show_total_amount= $sub_total_amount - $discount_price;
            
            //$value->value->booking_product_price = $BookingProductsPrice;
        }
        //return $transactions;
        $data['transactions']=$transactions;
        return view('admin.vendor.transaction',compact('data'));
    }
    public function bookingTestPackage(Request $request,$id,$id1){
        $BookingProducts = BookingProduct::where('booking_id',$id)->where('lab_id',$id1)->get();
        $data['booking_test_packages'] = $BookingProducts;
        return view('admin.vendor.booking_test_package',compact('data'));
    }
}
