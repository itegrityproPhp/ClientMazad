<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;
class ContactAgent extends Model
{
   	//use SoftDeletes;
	protected $table = 'contact_agents';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'user_id','property_id','agent_id','name','phone_number','email','message'
    ];
}