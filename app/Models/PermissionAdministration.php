<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;

class PermissionAdministration extends Model{
   	//use SoftDeletes;
	protected $table = 'permission_administration';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'role_id','user_id','permission_id'
    ];

    public function role(){
       return  $this->hasOne('App\Models\Role','id' , 'role_id');
    }
    public function permission(){
       return  $this->hasOne('App\Models\Permission','id' , 'permission_id');
    }
}