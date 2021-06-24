<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\PropertyMakeAnOffer;

use Hash;

class PropertyMakeAnOfferController extends Controller{
   public function index(Request $request){
        $offers = PropertyMakeAnOffer::orderBy('id','desc')->get();
        return view('backend.propertyMakeAnOffer.index',compact('offers'));
    }

    public function create(Request $request){
        //
    }

    public function store(Request $request){
        //
    }

    public function edit(Request $request , $id){
        //
    }

    public function update(Request $request,$id){
        //
    }

    public function destroy(Request $request,$id){
        //
    }
}
