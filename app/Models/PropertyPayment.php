<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Helpers\ImageHelper;
//use Illuminate\Database\Eloquent\SoftDeletes;

class PropertyPayment extends Model
{
   	//use SoftDeletes;
	protected $table = 'property_payments';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'property_id','user_id','type','pp_txn_id','amount','pg_txn_id','cheque_image','cheque_no','cheque_issue_date','status','benificery_name'
    ];
}