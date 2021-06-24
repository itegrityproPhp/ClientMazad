<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;

class Level4 extends Model
{
   	//use SoftDeletes;
	protected $table = 'level_4';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'level_3_id','name','name_ar'
    ];
    public function level3(){
       return  $this->hasOne('App\Models\Level3','id' , 'level_3_id');
    }
}