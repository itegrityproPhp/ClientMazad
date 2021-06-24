<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;

class PropertySavedSearch extends Model{
   	//use SoftDeletes;
	protected $table = 'property_saved_search';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'user_id','title','description'
    ];
}