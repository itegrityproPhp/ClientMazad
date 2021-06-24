<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;

class PropertyFollow extends Model{
   	//use SoftDeletes;
	protected $table = 'property_follows';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'user_id','property_id','other_user_id','follow_status',
    ];
}