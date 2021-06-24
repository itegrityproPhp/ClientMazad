<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;
use App\Helpers\ImageHelper;

class PropertyImage extends Model{
   	//use SoftDeletes;
	protected $table = 'property_images';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'property_id','image'
    ];
    protected $appends = ['image_url'];

    public function getImageUrlAttribute(){
        return ImageHelper::getPropertyImage($this->image);
    }
}