<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;

class FaqCategory extends Model
{
   	//use SoftDeletes;
	protected $table = 'faq_category';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'id','title','title_ar','sequence','status'
    ];

    // public function subCategory(){
    //    return  $this->hasOne('App\Models\Category','id' , 'parent_cat_id');
    // }
}