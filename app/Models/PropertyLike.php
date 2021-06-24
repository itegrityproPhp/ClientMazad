<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;

class PropertyLike extends Model{
   	//use SoftDeletes;
	protected $table = 'property_likes';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'user_id','property_id','like_status',
    ];
    public function property(){
       return  $this->hasOne('App\Models\Property','id' , 'property_id');
    }
}