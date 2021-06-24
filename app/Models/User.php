<?php

namespace App\Models;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
//use Illuminate\Database\Eloquent\SoftDeletes;
use App\Helpers\ImageHelper;
class User extends Authenticatable
{
    //use SoftDeletes;
    //use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'profile_image',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
    protected $appends = ['profile_image_url'];

    public function getProfileImageUrlAttribute(){
        return ImageHelper::getProfileImage($this->profile_image);
    }
    public function city(){
       return  $this->hasOne('App\Models\City','id' , 'city_id');
    }
    public function country(){
       return  $this->hasOne('App\Models\Country','id' , 'country_id');
    }
    public function getRole(){
       return  $this->hasOne('App\Models\Role','id' , 'role');
    }

    public function representative(){
       return  $this->hasOne('App\Models\User','id' , 'representative_id');
    }
    public function getTypeAttribute($value){
        return is_null($value) ? '' : "$value";
    }
    public function getRoleAttribute($value){
        return is_null($value) ? '' : "$value";
    }
    public function getIndividualTypeAttribute($value){
        return is_null($value) ? '' : "$value";
    }
    public function getPhoneNumberAttribute($value){
        return is_null($value) ? '' : "$value";
    }
    public function getDateOfBirthAttribute($value){
        return is_null($value) ? '' : "$value";
    }
    public function getCountryIdAttribute($value){
        return is_null($value) ? '' : "$value";
    }
    public function getCityIdAttribute($value){
        return is_null($value) ? '' : "$value";
    }
    public function getLangAttribute($value){
        return is_null($value) ? '' : "$value";
    }
    public function getDeviceTypeAttribute($value){
        return is_null($value) ? '' : "$value";
    }
    public function getDeviceTokenAttribute($value){
        return is_null($value) ? '' : "$value";
    }
    public function getOtpAttribute($value){
        return is_null($value) ? '' : "$value";
    }
    public function getRegistrationProcessStatusAttribute($value){
        return is_null($value) ? '' : "$value";
    }
}
