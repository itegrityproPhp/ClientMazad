<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;
use App\Helpers\ImageHelper;

class Advertisement extends Model{
   	//use SoftDeletes;
	protected $table = 'advertisements';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'advertiser_id','advertisement_plan_id','advertisement','start_date','end_date','status'
    ];
    public function advertiser(){
       return  $this->hasOne('App\Models\Advertiser','id' , 'advertiser_id');
    }
    public function advertisementPlanTime(){
       return  $this->hasOne('App\Models\AdvertisementPlanTime','id' , 'advertisement_plan_id');
    }
    protected $appends = ['advertisement_url'];
    public function getAdvertisementUrlAttribute(){
      return ImageHelper::getAdvertisementPath($this->advertisement);
  	}
}