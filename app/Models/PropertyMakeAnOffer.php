<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;

class PropertyMakeAnOffer extends Model{
   	//use SoftDeletes;
	protected $table = 'property_make_an_offers';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'property_id',
    		'user_id',
    		'first_name',
    		'second_name',
    		'email',
    		'phone_number',
    		'offer_price',
    		'validation_date',
    		'accept_terms',
    		'status'
    ];
    public function property(){
       return  $this->hasOne('App\Models\Property','id' , 'property_id');
    }
    public function user(){
       return  $this->hasOne('App\Models\User','id' , 'user_id');
    }
}