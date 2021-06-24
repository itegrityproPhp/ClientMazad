<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;

class NotificationTemplate extends Model
{
   	//use SoftDeletes;
	protected $table = 'notification_template';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'title','title_ar','content','content_ar','template_type','template_type_name'
    ];
}