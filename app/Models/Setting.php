<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Helpers\ImageHelper;
//use Illuminate\Database\Eloquent\SoftDeletes;

class Setting extends Model
{
   	//use SoftDeletes;
	protected $table = 'settings';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'logo','email','phone_number','address','address_ar','location','lat','lng','commission_for_auction','commission_for_forced_auction','commission_for_sale_prop','commission_for_rented_prop','notification_sett','auth_desc_app','auth_desc_app_ar'
    ];
    protected $appends = ['logo_url'];

    public function getLogoUrlAttribute(){
    	return ImageHelper::getLogoPath($this->logo);
	}
}