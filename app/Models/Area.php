<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;

class Area extends Model
{
   	//use SoftDeletes;
	protected $table = 'states';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'country_id','area_name','area_name_ar'
    ];
    public function country(){
       return  $this->hasOne('App\Models\Country','id' , 'country_id');
    }
}