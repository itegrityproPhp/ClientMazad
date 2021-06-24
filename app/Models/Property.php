<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;
use App\Helpers\ImageHelper;

class Property extends Model{
   	//use SoftDeletes;
	protected $table = 'properties';
	protected $primaryKey = 'id';
	
    protected $fillable = [
    	'type',
		'property_type',
		'user_id',
		'category_id',
		'address',
		'unit',
		'state_id',
		'city_id',
		'zipcode',
		'location',
		'lat',
		'lng',
		'evaluation',
		'price',
		'security_deposit',
		'home_facts',
		'room_details',
		'utility_details',
		'facility',
		'mobile_number',
		'available_date',
		'beds',
		'bathrooms',
		'short_description',
		'descprition',
		'squarefeet',
		'lease_duration',
		'conctact_information',
		'services',
		'mobile_number',
		'terms_condtions',
		'logo',
		'title',
		'issue_place_of_document',
		'country_id',
		'sub_category_id',
		'last_category_id',
		'evaluator_city_id',
		'number',
		'field',
		'date',
		'max_price',
		'start_date',
		'end_date',
		'start_time',
		'end_time',
		'time',
		'property_value',
		'min_amount_bid',
		'max_amount_bid',
		'land_size',
		'accept_terms'
    ];
    protected $appends = ['logo_url'];
    //=========NullValue=========
    public function propertyImages(){
   	   return  $this->hasMany('App\Models\PropertyImage','property_id' , 'id');
       //return  $this->hasMany('App\Models\PropertyImage','id' , 'property_id');
    }
    public function propertyBids(){
   	   return  $this->hasMany('App\Models\PropertyBid','property_id' , 'id')->orderBy('intial_amount','desc');
       //return  $this->hasMany('App\Models\PropertyImage','id' , 'property_id');
    }
    public function user(){
       return  $this->hasOne('App\Models\User','id' , 'user_id');
    }

    public function country(){
       return  $this->hasOne('App\Models\Country','id' , 'country_id');
    }
    public function city(){
       return  $this->hasOne('App\Models\City','id' , 'city_id');
    }
    public function level1(){
       return  $this->hasOne('App\Models\Level1','id' , 'level_1_id');
    }
    public function level2(){
       return  $this->hasOne('App\Models\Level2','id' , 'level_2_id');
    }
    public function level3(){
       return  $this->hasOne('App\Models\Level3','id' , 'level_3_id');
    }
    public function level4(){
       return  $this->hasOne('App\Models\Level4','id' , 'level_4_id');
    }
    public function level5(){
       return  $this->hasOne('App\Models\Level5','id' , 'level_5_id');
    }
    public function area(){
       return  $this->hasOne('App\Models\Area','id' , 'state_id');
    }
    public function category(){
       return  $this->hasOne('App\Models\Category','id' , 'category_id');
    }
    public function subCategory(){
       return  $this->hasOne('App\Models\SubCategory','id' , 'sub_category_id');
    }
    public function lastCategory(){
       return  $this->hasOne('App\Models\LastCategory','id' , 'last_category_id');
    }
    public function evaluatorCity(){
       return  $this->hasOne('App\Models\City','id' , 'evaluator_city_id');
    }
    public function getLogoUrlAttribute(){
    	return ImageHelper::getLogoPath($this->logo);
	}
	public function getTitleAttribute($value){
		return is_null($value) ? '' : "$value";
	}
	public function getPropertyTypeAttribute($value){
		return is_null($value) ? '' : "$value";
	}
	public function getCategoryIdAttribute($value){
		return is_null($value) ? '' : $value;
	}
	public function getAddressAttribute($value){
		return is_null($value) ? '' : $value;
	}
	
	public function getLocationAttribute($value){
		return is_null($value) ? '' : $value;
	}
	public function getLatAttribute($value){
		return is_null($value) ? '' : $value;
	}
	public function getLngAttribute($value){
		return is_null($value) ? '' : $value;
	}
	public function getPriceAttribute($value){
		return is_null($value) ? '' : $value;
	}
	public function getMaxPriceAttribute($value){
		return is_null($value) ? '' : $value;
	}
	public function getAvailableDateAttribute($value){
		return is_null($value) ? '' : $value;
	}
	public function getBedsAttribute($value){
		return is_null($value) ? '' : $value;
	}
	public function getBathroomsAttribute($value){
		return is_null($value) ? '' : $value;
	}
	public function getStartDateAttribute($value){
		return is_null($value) ? '' : $value;
	}
	public function getEndDateAttribute($value){
		return is_null($value) ? '' : $value;
	}
	public function getServicesAttribute($value){
		return is_null($value) ? '' : $value;
	}
	public function getDateAttribute($value){
		return is_null($value) ? '' : $value;
	}
	public function getTimeAttribute($value){
		return is_null($value) ? '' : $value;
	}
	public function getDescpritionAttribute($value){
		return is_null($value) ? '' : $value;
	}
	public function getShortDescriptionAttribute($value){
		return is_null($value) ? '' : $value;
	}
	
	public function getLandSizeAttribute($value){
		return is_null($value) ? '' : $value;
	}
}