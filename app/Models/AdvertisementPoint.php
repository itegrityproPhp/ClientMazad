<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;

class AdvertisementPoint extends Model
{
   	//use SoftDeletes;
	protected $table = 'advertisement_points';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'user_name','phone_number','email','ads_point','comment','date','point_status'
    ];
}