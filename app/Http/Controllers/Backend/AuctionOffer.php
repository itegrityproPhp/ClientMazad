<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\PropertyMakeAnOffer;
use App\Helpers\ImageHelper;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;
use Datatables;
use File;

class AuctionOffer extends Controller{
    public function index(Request $request){
        $PropertyMakeAnOffers = PropertyMakeAnOffer::orderBy('id','desc')->get();
        $data['PropertyMakeAnOffers']=$PropertyMakeAnOffers;
        return view('backend.auction_offer.index')->with($data);
    }
    public function view(Request $request , $id){
        $PropertyMakeAnOffer          = PropertyMakeAnOffer::find($id);
        $data['PropertyMakeAnOffer']  = $PropertyMakeAnOffer;
        return view('backend.auction_offer.view')->with($data);
    }
}
