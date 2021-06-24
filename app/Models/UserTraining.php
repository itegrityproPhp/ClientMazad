<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;
use App\Helpers\ImageHelper;
class UserTraining extends Model
{
   	//use SoftDeletes;a
	protected $table = 'user_trainings';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'titile','title_ar','content','content_ar','media'
    ];
    protected $appends = ['media_url'];

    public function getMediaUrlAttribute(){
        return ImageHelper::getUserTrainingPath($this->media);
    }
}