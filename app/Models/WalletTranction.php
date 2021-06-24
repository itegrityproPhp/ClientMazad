<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;
use App\Helpers\ImageHelper;
class WalletTranction extends Model{
   	//use SoftDeletes;a
	protected $table = 'wallet_tranctions';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'user_id','tranction_type','tranction_id','type','current_amount','credit_debit_amount','remaining_amount','title','message'
    ];
    public function user(){
       return  $this->hasOne('App\Models\User','id' , 'user_id');
    }
}