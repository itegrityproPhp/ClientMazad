<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;

class City extends Model
{
   	//use SoftDeletes;
	protected $table = 'cities';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'country_id','state_id','city_name','city_name_ar'
    ];
    public function country(){
       return  $this->hasOne('App\Models\Country','id' , 'country_id');
    }
    public function area(){
       return  $this->hasOne('App\Models\Area','id' , 'state_id');
    }
}