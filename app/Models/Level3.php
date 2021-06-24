<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;

class Level3 extends Model
{
   	//use SoftDeletes;
	protected $table = 'level_3';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'level_2_id','name','name_ar'
    ];
    public function level2(){
       return  $this->hasOne('App\Models\Level2','id' , 'level_2_id');
    }
}