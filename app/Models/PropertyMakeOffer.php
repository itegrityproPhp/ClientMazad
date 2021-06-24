<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;

class PropertyMakeOffer extends Model{
   	//use SoftDeletes;
	protected $table = 'property_bids';
	protected $primaryKey = 'id';
	
    protected $fillable = [
    	'user_id',
		'property_id',
		'date',
		'time',
		'place',
		'property_display',
		'awarded_buyer',
		'id_card',
		'intial amount',
		'check_number',
		'bank_name',
		'issue_on',
		'remaining_complete_amount',
		'within_working_days',
		'seller_name',
		'seller_card_number',
		'seller_card_date',
		'seller_source',
		'seller_signature',
		'seller_date',
		'buyer_name',
		'buyer_card_number',
		'buyer_card_date',
		'buyer_source',
		'buyer_signature',
		'buyer_date',
		'auction_sale_name',
		'auction_sale_card_number',
		'auction_sale_card_date',
		'auction_sale_source',
		'auction_sale_signature',
		'auction_sale_date',
    ];
    public function property(){
       return  $this->hasOne('App\Models\Property','id' , 'property_id');
    }
}