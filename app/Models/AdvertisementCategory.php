<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;

class AdvertisementCategory extends Model
{
   	//use SoftDeletes;
	protected $table = 'advertisement_category';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'name','name_ar','status','type'
    ];
}