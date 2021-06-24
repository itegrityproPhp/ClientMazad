<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;

class PropertyStatus extends Model
{
   	//use SoftDeletes;
	protected $table = 'property_status';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'status','name','name_ar'
    ];
}