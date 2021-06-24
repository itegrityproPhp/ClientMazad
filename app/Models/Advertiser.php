<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;

class Advertiser extends Model
{
   	//use SoftDeletes;
	protected $table = 'advertisers';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'country_id','name','owner_name','email','phone_number','landline_no'
    ];
    public function country(){
       return  $this->hasOne('App\Models\Country','id' , 'country_id');
    }
}