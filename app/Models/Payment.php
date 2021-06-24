<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Helpers\ImageHelper;
//use Illuminate\Database\Eloquent\SoftDeletes;

class Payment extends Model
{
   	//use SoftDeletes;
	protected $table = 'payments';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'iban','country_code','check_digits','bank_code','bank_account_number','terminal_id','password','merchant_key','bank_account_name','bank_name','bank_address'
    ];
}