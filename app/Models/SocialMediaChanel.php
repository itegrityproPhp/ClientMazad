<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;

class SocialMediaChanel extends Model
{
   	//use SoftDeletes;
	protected $table = 'social_media_chanels';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'title','description','link','user','password','responsible_person','called_him','mobile','location'
    ];
}