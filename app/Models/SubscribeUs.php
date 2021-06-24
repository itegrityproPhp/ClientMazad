<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;

class SubscribeUs extends Model
{
   	//use SoftDeletes;
	protected $table = 'subscribe_us';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'email'
    ];
}