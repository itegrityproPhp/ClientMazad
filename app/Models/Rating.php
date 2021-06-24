<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;

class Rating extends Model
{
   	//use SoftDeletes;
	protected $table = 'ratings';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'type','sender_id','receiver_id','property_id','rating_star','review','status'
    ];

    public function senderUser(){
       return  $this->hasOne('App\Models\User','id' , 'sender_id');
    }

    public function receiverUser(){
       return  $this->hasOne('App\Models\User','id' , 'receiver_id');
    }
}