<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;

class Notification extends Model{
   	//use SoftDeletes;
	protected $table = 'notifications';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'sender_id','receiver_id','title','title_ar','message','message_ar','json_data','notification_for'
    ];
    public function sender(){
       return  $this->hasOne('App\Models\User','id' , 'sender_id');
    }
    public function receiver(){
       return  $this->hasOne('App\Models\User','id' , 'receiver_id');
    }
}