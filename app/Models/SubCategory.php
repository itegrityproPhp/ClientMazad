<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;

class SubCategory extends Model
{
   	//use SoftDeletes;
	protected $table = 'sub_category';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'name','name_ar'
    ];
    public function category(){
       return  $this->hasOne('App\Models\Category','id' , 'category_id');
    }
}