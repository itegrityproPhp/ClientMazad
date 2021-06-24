<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;

class AdvertisementPlanTime extends Model
{
   	//use SoftDeletes;
	protected $table = 'advertisement_plan_times';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'advertisement_category_id','advertisement_category_id','currency','plan_name','days','amount','status'
    ];
    public function advertisementCategory(){
       return  $this->hasOne('App\Models\AdvertisementCategory','id' , 'advertisement_category_id');
    }
}