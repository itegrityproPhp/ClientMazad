<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;

class AgentTask extends Model
{
   	//use SoftDeletes;
	protected $table = 'agent_task';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'agent_id','property_id','fair_value','highest_value','minimum_value','property_reports','status','accpted_date','rejected_date','task_submited_date'
    ];
    public function property(){
      return  $this->hasOne('App\Models\Property','id' , 'property_id');
    }
    public function agent(){
      return  $this->hasOne('App\Models\User','id' , 'agent_id');
    }
    public function getFairValueAttribute($value){
      return is_null($value) ? '' : $value;
    }
    public function getHighestValueAttribute($value){
      return is_null($value) ? '' : $value;
    }
    public function getMinimumValueAttribute($value){
      return is_null($value) ? '' : $value;
    }
    public function getPropertyReportsAttribute($value){
      return is_null($value) ? '' : $value;
    }
    public function getAccptedDateAttribute($value){
      return is_null($value) ? '' : $value;
    }
    public function getRejectedDateAttribute($value){
      return is_null($value) ? '' : $value;
    }
    public function getTaskSubmitedDateAttribute($value){
      return is_null($value) ? '' : $value;
    }
    public function getReportSubmitedDateAttribute($value){
      return is_null($value) ? '' : $value;
    }
}