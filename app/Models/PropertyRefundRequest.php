<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;

class PropertyRefundRequest extends Model{
   	//use SoftDeletes;
	protected $table = 'property_refund_requests';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'user_id','property_id','property_bid_id','refund_amount','status',
    ];
    public function user(){
       return  $this->hasOne('App\Models\User','id' , 'user_id');
    }
}