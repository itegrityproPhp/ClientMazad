<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;

class Comment extends Model
{
   	//use SoftDeletes;
	protected $table = 'comments';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'type','sender_id','receiver_id','property_id','first_name','last_name','email','comment','role','replay_status'
    ];

    public function senderUser(){
       return  $this->hasOne('App\Models\User','id' , 'sender_id');
    }

    public function receiverUser(){
       return  $this->hasOne('App\Models\User','id' , 'receiver_id');
    }
    public function property(){
       return  $this->hasOne('App\Models\Property','id' , 'property_id');
    }
}