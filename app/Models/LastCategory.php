<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;

class LastCategory extends Model
{
   	//use SoftDeletes;
	protected $table = 'last_category';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'name','name_ar'
    ];
}