<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use App\Models\AdvertisementCategory;
use App\Models\AdvertisementPlanTime;
use App\Models\AdvertisementPoint;
use App\Models\Advertiser;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use Carbon\Carbon;

use App\Http\Controllers\Controller;
class AdvertisementHomeController extends Controller{
    public function __construct(){
        $this->middleware('auth');
    }
    public function index(){
        $data = [];
        $TotalExpiredAds = 0;
        $TotalInactiveAds = 0;
        $TotalRunningAds = 0;
        $TotalAdvertisementCategories    = AdvertisementCategory::orderBy('id','desc')->count();
        $TotalAdvertisementPlanTimes     = AdvertisementPlanTime::orderBy('id','desc')->count();
        $TotalAdvertisementPoints        = AdvertisementPoint::orderBy('id','desc')->count();
        $TotalAdvertisers                = Advertiser::orderBy('id','desc')->count();

        $AdvertisementCategories   = AdvertisementCategory::orderBy('id','desc')->take(10)->get();
        $AdvertisementPlanTimes    = AdvertisementPlanTime::orderBy('id','desc')->take(10)->get();
        foreach ($AdvertisementPlanTimes as $apt_key => $apt_value) {
            $days            = '+'.$apt_value->days.' day';
            $created_date    =  $apt_value->created_at;
            $ad_expire_date  =  date('Y-m-d H:i:s', strtotime($days, strtotime($created_date)));
            if($ad_expire_date<=date('Y-m-d H:i:s')){
                $TotalExpiredAds+=1;
            }else{
                $TotalRunningAds+=1;
            }
            if($apt_value->status==2){
                $TotalInactiveAds+=1;
            }
        }
        $AdvertisementPoints       = AdvertisementPoint::orderBy('id','desc')->take(10)->get();
        $Advertisers               = Advertiser::orderBy('id','desc')->take(10)->get();

        //=======Monthly Data Show Of Year=======
        $AdvertisementPlanTimeYear = AdvertisementPlanTime::select('id', 'created_at')
                            ->where('status','1')
                            ->get()
                            ->groupBy(function($date) {
                                return Carbon::parse($date->created_at)->format('m');
                            });
                            
        $AdvertisementPlanTimeMonthCount = [];
        $AdvertisementPlanTimeMonthly = [];
        foreach ($AdvertisementPlanTimeYear as $key => $value) {
            $AdvertisementPlanTimeMonthCount[(int)$key] = count($value);
        }
        
        for($i = 1; $i <= 12; $i++){
            if(date('m')>=$i){
                $month_tmp = [];
                if(!empty($AdvertisementPlanTimeMonthCount[$i])){
                    $month_tmp['x'] = date("M", mktime(0, 0, 0, $i, 10));
                    $month_tmp['y'] = $AdvertisementPlanTimeMonthCount[$i];    
                }else{
                    $month_tmp['x'] = date("M", mktime(0, 0, 0, $i, 10));
                    $month_tmp['y'] = 0;  
                }
                array_push($AdvertisementPlanTimeMonthly,$month_tmp);
            }
        }

        //return $AdvertisementPlanTimeMonthly;

        $data['TotalAdvertisementCategories']    = $TotalAdvertisementCategories;
        $data['TotalAdvertisementPlanTimes']     = $TotalAdvertisementPlanTimes;
        $data['TotalAdvertisementPoints']        = $TotalAdvertisementPoints;
        $data['TotalAdvertisers']                = $TotalAdvertisers;

        $data['TotalExpiredAds']                = $TotalExpiredAds;
        $data['TotalRunningAds']                = $TotalRunningAds;
        $data['TotalInactiveAds']               = $TotalInactiveAds;

        $data['AdvertisementCategories']    = $AdvertisementCategories;
        $data['AdvertisementPlanTimes']     = $AdvertisementPlanTimes;
        $data['AdvertisementPoints']        = $AdvertisementPoints;
        $data['Advertisers']                = $Advertisers;
        $data['AdvertisementPlanTimeMonthly']                = $AdvertisementPlanTimeMonthly;
        
        return view('backend.advertisement_home.index')->with($data);
    }
}
