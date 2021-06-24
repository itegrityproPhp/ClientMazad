<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;
use App\Helpers\ImageHelper;
class Form extends Model
{
   	//use SoftDeletes;
	protected $table = 'forms';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'title','title_ar','form'
    ];
    protected $appends = ['form_url'];
    public function getFormUrlAttribute(){
        return ImageHelper::getFormPath($this->form);
    }
}