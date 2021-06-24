<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use App\Helpers\ImageHelper;
//use Illuminate\Database\Eloquent\SoftDeletes;
class Cms extends Model{
  //use SoftDeletes;
	protected $table = 'cms';
	protected $primaryKey = 'id';
  protected $fillable = [
      'type','heading','heading_ar','description','description_ar','image'
  ];
  protected $appends = ['image_url'];
  public function getImageUrlAttribute(){
      return ImageHelper::getCmsImagePath($this->image);
  }
  public function cmsContents(){
     return  $this->hasMany('App\Models\CmsContent','cms_id' , 'id');
  }
}