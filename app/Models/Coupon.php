<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;

class Coupon extends Model{
   	//use SoftDeletes;
	protected $table = 'coupons';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'type','coupon_type','coupon_value','coupon_start_date','coupon_end_date'
    ];
}