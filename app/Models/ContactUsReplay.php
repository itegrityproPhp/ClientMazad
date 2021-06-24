<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;
class ContactUsReplay extends Model
{
   	//use SoftDeletes;
	protected $table = 'contact_us_replay';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'contact_us_id','subject','message'
    ];
}