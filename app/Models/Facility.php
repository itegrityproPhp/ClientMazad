<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Facility extends Model{
   	//use SoftDeletes;
	protected $table = 'facilities';
	protected $primaryKey = 'id';
	
    protected $fillable = [
    	'facility_name',
		'facility_name_ar',
    ];
    
}