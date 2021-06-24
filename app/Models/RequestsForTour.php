<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RequestsForTour extends Model{
   	//use SoftDeletes;
	protected $table = 'requests_for_tour';
	protected $primaryKey = 'id';
	
    protected $fillable = [
    	'property_id',
		'user_id',
		'name',
		'phone_no',
		'email',
		'timing',
    ];
    
    public function property(){
       return  $this->hasOne('App\Models\Property','id' , 'property_id');
    }
    public function user(){
       return  $this->hasOne('App\Models\User','id' , 'user_id');
    }
}