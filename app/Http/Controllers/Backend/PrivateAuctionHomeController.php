<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Property;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use Carbon\Carbon;

use App\Http\Controllers\Controller;
class PrivateAuctionHomeController extends Controller{
    public function __construct(){
        $this->middleware('auth');
    }
    public function index(){
        $data = [];
        $role = ['2','3','4'];
        $TotalBidder        = User::where('role','2')->count();
        $TotalAuctioner     = User::where('role','3')->count();
        $TotalEvaluator     = User::where('role','4')->count();
        $LatestBidder       = User::where('role','2')->orderBy('id','desc')->take(10)->get();
        $LatestAuctioner    = User::where('role','3')->orderBy('id','desc')->take(10)->get();
        $LatestEvaluator    = User::where('role','4')->orderBy('id','desc')->take(10)->get();
        $TotalProperty          = Property::whereHas('user', function($query) use ($role){
                                            $query->whereIn('role',$role);
                                        })
                                        ->where('type','1')
                                        ->count();
        $TotalAuctions          = Property::whereHas('user', function($query) use ($role){
                                            $query->whereIn('role',$role);
                                        })
                                        ->where('type','2')
                                        ->count();
        $TotalRentalProperty    = Property::whereHas('user', function($query) use ($role){
                                            $query->whereIn('role',$role);
                                        })
                                        ->where('type','3')
                                        ->count();

        $LatestProperty          = Property::whereHas('user', function($query) use ($role){
                                            $query->whereIn('role',$role);
                                        })
                                        ->orderBy('id','desc')
                                        ->take(10)
                                        ->where('type','1')
                                        ->get();
        $LatestAuctions          = Property::whereHas('user', function($query) use ($role){
                                            $query->whereIn('role',$role);
                                        })
                                        ->orderBy('id','desc')
                                        ->take(10)
                                        ->where('type','2')
                                        ->get();
        $LatestRentalProperty    = Property::whereHas('user', function($query) use ($role){
                                            $query->whereIn('role',$role);
                                        })
                                        ->orderBy('id','desc')
                                        ->take(10)
                                        ->where('type','3')
                                        ->get();
        $data['TotalBidder']            = $TotalBidder;
        $data['TotalAuctioner']         = $TotalAuctioner;
        $data['TotalEvaluator']         = $TotalEvaluator;
        $data['TotalAuctions']          = $TotalAuctions;
        $data['TotalProperty']          = $TotalProperty;
        $data['TotalRentalProperty']    = $TotalRentalProperty;
        $data['LatestBidder']           = $LatestBidder;
        $data['LatestAuctioner']        = $LatestAuctioner;
        $data['LatestEvaluator']        = $LatestEvaluator;
        $data['LatestProperty']         = $LatestProperty;
        $data['LatestAuctions']         = $LatestAuctions;
        $data['LatestRentalProperty']   = $LatestRentalProperty;

        //return $data;
        return view('backend.private_auction_home.index')->with($data);
    }
}