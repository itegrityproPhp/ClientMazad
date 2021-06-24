<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;
class ContactUs extends Model
{
   	//use SoftDeletes;
	protected $table = 'contact_us';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'first_name','last_name','email','phone_number','message'
    ];
}