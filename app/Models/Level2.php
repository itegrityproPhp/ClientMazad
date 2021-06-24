<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;

class Level2 extends Model
{
   	//use SoftDeletes;
	protected $table = 'level_2';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'level_1_id','name','name_ar'
    ];
    public function level1(){
       return  $this->hasOne('App\Models\Level1','id' , 'level_1_id');
    }
}