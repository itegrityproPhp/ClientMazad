<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;

class Level1 extends Model
{
   	//use SoftDeletes;
	protected $table = 'leval_1';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'name','name_ar'
    ];
}