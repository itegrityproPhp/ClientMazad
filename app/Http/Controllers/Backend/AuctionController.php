<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Category;
use App\Models\SubCategory;
use App\Models\LastCategory;
use App\Models\Level1;
use App\Models\Level2;
use App\Models\Level3;
use App\Models\Level4;
use App\Models\Level5;
use App\Models\Country;
use App\Models\City;
use App\Models\PropertyType;
use App\Models\Property;
use App\Models\PropertyBid;
use App\Models\PropertyImage;
use App\Models\AgentTask;
use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class AuctionController extends Controller{
    public function index(Request $request){
        $Auctions = Property::where('type','2')->orderBy('id','desc')->get();
        $data['Auctions']=$Auctions;
        return view('backend.auction.index')->with($data);
    }

    public function create(Request $request){
        $data = [];
        $Countries              = Country::all()->pluck('country_name','id')->prepend('Select Country','');   
        $Cities                 = City::all()->pluck('city_name','id')->prepend('Select City','');
        $Categories             = Category::all()->pluck('name','id')->prepend('Select Category','');
        $LastCategories         = LastCategory::all()->pluck('name','id')->prepend('Select Last Category','');
        $Level1                 = Level1::all()->pluck('name','id')->prepend('Select Level 1','');
        $data['Countries']          = $Countries;
        $data['Cities']             = $Cities;
        $data['Categories']         = $Categories;
        $data['LastCategories']     = $LastCategories;
        $data['Level1']             = $Level1;
        return view('backend.auction.create')->with($data);
    }

    public function store(Request $request){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $rules = [
            'logo'                      => 'required',
            'title'                     => 'required',
            'issue_place_of_document'   => 'required',
            'country'                => 'required',
            'city'                   => 'required',
            'category'               => 'required',
            'evaluator_city'         => 'required',
            'number'                    => 'required',
            'field'                     => 'required',
            'date'                      => 'required',
            'price'                     => 'required',
            'max_price'                 => 'required',
            'start_date'                => 'required',
            'end_date'                  => 'required',
            'time'                      => 'required',
            'property_value'            => 'required',
            'min_amount_bid'            => 'required',
            'descprition'               => 'required',
            'location'                  => 'required',
            //'lat'                       => 'required',
            //'lng'                       => 'required',
            'land_size'                 => 'required',
            'images'                    => 'required',  
        ];
        $messages = [
            'logo.required'                     => $Validation['logo'],
            'title.required'                    => $Validation['title'],
            'issue_place_of_document.required'  => $Validation['issue_place_of_document'],
            'country.required'               => $Validation['country'],
            'city.required'                  => $Validation['city'],
            'category.required'              => $Validation['category'],
            'evaluator_city.required'        => $Validation['evaluator_city'],
            'number.required'                   => $Validation['number'],
            'field.required'                    => $Validation['field'],
            'date.required'                     => $Validation['date'],
            'price.required'                    => $Validation['price'],
            'max_price.required'                => $Validation['max_price'],
            'start_date.required'               => $Validation['start_date'],
            'end_date.required'                 => $Validation['end_date'],
            'time.required'                     => $Validation['time'],
            'property_value.required'           => $Validation['property_value'],
            'min_amount_bid.required'           => $Validation['min_amount_bid'],
            'descprition.required'              => $Validation['descprition'],
            'location.required'                 => $Validation['location'],
            //'lat.required'                      => $Validation['lat'],
            //'lng.required'                      => $Validation['lng'],
            'land_size.required'                => $Validation['land_size'],
            'images.required'                   => $Validation['images'],
        ];
        $this->validate($request,$rules,$messages);
        $logo=NULL;
        if($request->hasFile('logo')) {
            $logo = Str::random(10).'_'.time().'.'.request()->logo->getClientOriginalExtension();
            request()->logo->move(ImageHelper::$getLogoPath, $logo);
        }
        $numberArr = [];
        if(is_array($inputs['number'])){
            foreach ($inputs['number'] as $key => $value) {
                $numberArr[] = $value;
            }
        }else{
            $number = json_decode($inputs['number']);
            foreach ($number as $key => $value) {
                $numberArr[] = $value;
            }
        }
        $Property = new Property();
        //$Property->user_id = $inputs['user_id'];
        if($logo){
            $Property->logo = $logo;
        }
        $Property->type                     = '2';
        $Property->user_id                  = Auth::user()->id;
        $Property->title                    = $inputs['title'];
        $Property->issue_place_of_document  = $inputs['issue_place_of_document'];
        $Property->country_id               = $inputs['country'];
        $Property->city_id                  = $inputs['city'];
        $Property->category_id              = $inputs['category'];
        if(isset($inputs['level_1'])){
            $Property->level_1_id      = $inputs['level_1'];
        }
        if(isset($inputs['level_2'])){
            $Property->level_2_id      = $inputs['level_2'];
        }
        if(isset($inputs['level_3'])){
            $Property->level_3_id      = $inputs['level_3'];
        }
        if(isset($inputs['level_4'])){
            $Property->level_4_id      = $inputs['level_4'];
        }
        if(isset($inputs['level_5'])){
            $Property->level_5_id      = $inputs['level_5'];
        }
        if(isset($inputs['sub_category'])){
            $Property->sub_category_id      = $inputs['sub_category'];
        }
        if(isset($inputs['last_category'])){
            $Property->last_category_id      = $inputs['last_category'];
        }
        $Property->evaluator_city_id        = $inputs['evaluator_city'];
        $Property->number                   = implode($numberArr);
        $Property->field                    = $inputs['field'];
        $Property->date                     = $inputs['date'];
        $Property->price                    = $inputs['price'];
        $Property->max_price                = $inputs['max_price'];
        $Property->start_date               = $inputs['start_date'];
        $Property->end_date                 = $inputs['end_date'];
        $Property->time                     = $inputs['time'];
        $Property->property_value           = $inputs['property_value'];
        $Property->min_amount_bid           = $inputs['min_amount_bid'];
        $Property->descprition              = $inputs['descprition'];
        $Property->location                 = $inputs['location'];
        if(!empty($inputs['lat'])){
           $Property->lat                      = $inputs['lat']; 
        }
        if(!empty($inputs['lng'])){
           $Property->lng                      = $inputs['lng']; 
        }
        $Property->land_size                = $inputs['land_size'];
        if($Property->save()){
            $property_id = $Property->id;
            //=======Add Image Code Hear=======
            $PropertyImageArr = [];
            if($files=$request->file('images')){
                foreach($files as $file){
                    $tmp = [];
                    $image = Str::random(10).'_'.time().'.'.$file->getClientOriginalExtension();
                    $file->move(ImageHelper::$getPropertyImagePath, $image);
                    $tmp['property_id'] = $property_id;
                    $tmp['image']       = $image;
                    array_push($PropertyImageArr, $tmp);
                }
            }
            if($PropertyImageArr){
                PropertyImage::insert($PropertyImageArr);
            }
            //=======Add Evalutors Code Hear=======
            $AgentTaskArr = [];
            if($numberArr){
                foreach ($numberArr as $n_key => $n_value) {
                    $tmp                = [];
                    $tmp['agent_id']    = $n_value;
                    $tmp['property_id'] = $property_id;
                    $tmp['created_at']  = date('Y-m-d h:i:s');
                    $tmp['updated_at']  = date('Y-m-d h:i:s');
                    array_push($AgentTaskArr,$tmp);
                }
            }
            //return $AgentTaskArr;
            if($AgentTaskArr){
                AgentTask::insert($AgentTaskArr);
            }
            return Redirect('backend/auction')->with('success',$Messages['auction_add_success']);
        }else{
            return back()->with('error',$Messages['auction_add_error']);
        }
    }

    public function edit(Request $request , $id){
        $data = [];
        $Countries              = Country::all()->pluck('country_name','id')->prepend('Select Country','');   
        $Cities                 = City::all()->pluck('city_name','id')->prepend('Select City','');
        $Categories             = Category::all()->pluck('name','id')->prepend('Select Category','');
        $LastCategories         = LastCategory::all()->pluck('name','id')->prepend('Select Last Category','');
        $Level1                 = Level1::all()->pluck('name','id')->prepend('Select Level 1','');
        $Auction                    = Property::find($id);
        $data['Countries']          = $Countries;
        $data['Cities']             = $Cities;
        $data['Categories']         = $Categories;
        $data['LastCategories']     = $LastCategories;
        $data['Level1']             = $Level1;
        $data['Auction']            = $Auction;
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
        $Category                      = Category::find($id);
        $Category->name                = $inputs['name'];
        $Category->name_ar             = $inputs['name_ar'];
        if($Category->save()){
            return Redirect('backend/category')->with('success',$Messages['category_update_success']);
        }else{
            return back()->with('error',$Messages['category_update_error']);
        }
    }
    public function view(Request $request , $id){
        $Auction          = Property::find($id);
        $Auction          = Property::find($id);
        $PropertyBids = PropertyBid::where('property_id',$id)->get();
        $data['Auction']  = $Auction;
        $data['PropertyBids']  = $PropertyBids;
        return view('backend.auction.view')->with($data);
    }
    public function changeAdminStatus(Request $request){
        $inputs         = $request->all();
        $Property       =  Property::find($inputs['id']);
        $Property->admin_status = $inputs['value'];
        if($Property->save()){
            return ['status'=>true,'message'=>'Auction status changed successfully'];
        }else{
            return ['status'=>false,'message'=>'Auction status changed successfully'];
        }
    }

    public function getSubCategory(Request $request){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $data   = [];
        $SubCategory = SubCategory::select('id','name','name_ar')->where('category_id',$inputs['category_id'])->get();
        if($SubCategory->toArray()){
            $data = $SubCategory;
            return response()->json(['status'=>true,'status_code'=>'200','message'=>$Messages['record_found'],'data'=>$data,'error'=>[]], 200);
        }else{
            return response(['status' => false , 'status_code'=>'401', 'message' => $Messages['record_not_found'], 'data'=>[], 'error'=>[]], 200);
        }
    }

    public function getLevel(Request $request){
        $inputs     =  $request->all();
        $langData   = trans('backend');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $data   = [];
        if($inputs['type']=='2'){
            $Level = Level2::select('id','name','name_ar')->where('level_1_id',$inputs['level_id'])->get();
        }elseif($inputs['type']=='3'){
            $Level = Level3::select('id','name','name_ar')->where('level_2_id',$inputs['level_id'])->get();
        }elseif($inputs['type']=='4'){
            $Level = Level4::select('id','name','name_ar')->where('level_3_id',$inputs['level_id'])->get();
        }elseif($inputs['type']=='5'){
            $Level = Level5::select('id','name','name_ar')->where('level_4_id',$inputs['level_id'])->get();
        }else{
            $Level = Level1::select('id','name','name_ar')->get();
        }
        if($Level->toArray()){
            $data = $Level;
            return response()->json(['status'=>true,'status_code'=>'200','message'=>$Messages['record_found'],'data'=>$data,'error'=>[]], 200);
        }else{
            return response(['status' => false , 'status_code'=>'401', 'message' => $Messages['record_not_found'], 'data'=>[], 'error'=>[]], 200);
        }
    }

    public function getEvaluator(Request $request){
        $inputs     =  $request->all();
        $User       =  $request->get('User');
        $langData   = trans('api_auth');
        $Validation = $langData['Validation'];
        $Messages   = $langData['Messages'];
        $data       = [];
        $Evaluator = User::select('id','first_name','second_name')
                        ->where('role','4')->where('registration_process_status','3')
                        ->where('city_id','=',$inputs['evaluator_city'])
                        //->where('id','!=',$User->id)
                        ->where('status','1')
                        ->get();
        if($Evaluator->toArray()){
            $data = $Evaluator;
            return response()->json(['status'=>true,'status_code'=>'200','message'=>$Messages['record_found'],'data'=>$data,'error'=>[]], 200);
        }else{
            return response(['status' => false , 'status_code'=>'401', 'message' => $Messages['record_not_found'], 'data'=>[], 'error'=>''], 200);
        }
    }
}
