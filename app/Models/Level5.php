<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;

class Level5 extends Model
{
   	//use SoftDeletes;
	protected $table = 'level_5';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'level_4_id','name','name_ar'
    ];
    public function level4(){
       return  $this->hasOne('App\Models\Level4','id' , 'level_4_id');
    }
}