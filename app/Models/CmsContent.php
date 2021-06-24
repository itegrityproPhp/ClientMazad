<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use App\Helpers\ImageHelper;
//use Illuminate\Database\Eloquent\SoftDeletes;
class CmsContent extends Model{
  //use SoftDeletes;
	protected $table = 'cms_content';
	protected $primaryKey = 'id';
  protected $fillable = [
      'cms_id','title','title_ar','description','description_ar','image','link','first_name','last_name','role','facebook_link','twitter_link','instagram_link'
  ];
  protected $appends = ['image_url'];
  public function getImageUrlAttribute(){
      return ImageHelper::getCmsImagePath($this->image);
  }
  public function cms(){
       return  $this->hasOne('App\Models\Cms','id' , 'cms_id');
    }
}