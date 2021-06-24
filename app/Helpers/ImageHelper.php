<?php

namespace App\Helpers;

use Session;
use App;
use Carbon\Carbon;
use url;
use DateTime;

class ImageHelper {
  public static $userPlaceholderImage = 'uploads/others/user_placeholder.png';
  public static $getProfileImagePath  = 'uploads/profile/';
  public static $getResidencePermitPath  = 'uploads/residence_permit/';
  public static $getRegistryCopyPath  = 'uploads/registry_copy/';
  public static $getAgencyPath  = 'uploads/agency/';
  public static $getDocumentCopyPath  = 'uploads/document_copy/';
  public static $getLogoPath  = 'uploads/logo/';
  public static $getCountryFlagPath  = 'uploads/country_flag/';
  public static $getPropertyImagePath  = 'uploads/property_image/';
  public static $getUserTrainingPath  = 'uploads/user_training/';
  public static $getFormPath  = 'uploads/form/';
  public static $getTaskReportPath  = 'uploads/task_report/';
  public static $getIdCardPath  = 'uploads/id_card/';
  public static $getCmsImagePath  = 'uploads/cms_image/';
  public static $getMakeAnOfferPath  = 'uploads/make_an_offer/';
  public static $getAdvertisementPath  = 'uploads/advertisement/';
  
  
  public static function getPlaceholderImage(){
    return url('uploads/others/user_placeholder.png');
  }

  public static function getProfileImage($image){
    if($image){
      if(file_exists(STATIC::$getProfileImagePath.$image)){
        return url(STATIC::$getProfileImagePath.$image);
      }
    }
    return url(STATIC::$userPlaceholderImage);
  }

  public static function getResidencePermit($file){
    if($file){
      if(file_exists(STATIC::$getResidencePermitPath.$file)){
        return url(STATIC::$getResidencePermitPath.$file);
      }
    }
    return url(STATIC::$userPlaceholderImage);
  }

  public static function getRegistryCopy($file){
    if($file){
      if(file_exists(STATIC::$getRegistryCopyPath.$file)){
        return url(STATIC::$getRegistryCopyPath.$file);
      }
    }
    return url(STATIC::$userPlaceholderImage);
  }

  public static function getAgency($file){
    if($file){
      if(file_exists(STATIC::$getAgencyPath.$file)){
        return url(STATIC::$getAgencyPath.$file);
      }
    }
    return url(STATIC::$userPlaceholderImage);
  }

  public static function getDocumentCopy($file){
    if($file){
      if(file_exists(STATIC::$getDocumentCopyPath.$file)){
        return url(STATIC::$getDocumentCopyPath.$file);
      }
    }
    return url(STATIC::$userPlaceholderImage);
  }

  public static function getLogoPath($file){
    if($file){
      if(file_exists(STATIC::$getLogoPath.$file)){
        return url(STATIC::$getLogoPath.$file);
      }
    }
    return url(STATIC::$userPlaceholderImage);
  }

  public static function getCountryFlagPath($file){
    if($file){
      if(file_exists(STATIC::$getCountryFlagPath.$file)){
        return url(STATIC::$getCountryFlagPath.$file);
      }
    }
    return url(STATIC::$userPlaceholderImage);
  }

  public static function getPropertyImage($image){
    if($image){
      if(file_exists(STATIC::$getPropertyImagePath.$image)){
        return url(STATIC::$getPropertyImagePath.$image);
      }
    }
    return url(STATIC::$userPlaceholderImage);
  }

  public static function getUserTrainingPath($file){
    if($file){
      if(file_exists(STATIC::$getUserTrainingPath.$file)){
        return url(STATIC::$getUserTrainingPath.$file);
      }
    }
    return url(STATIC::$userPlaceholderImage);
  }

  public static function getFormPath($file){
    if($file){
      if(file_exists(STATIC::$getFormPath.$file)){
        return url(STATIC::$getFormPath.$file);
      }
    }
    return url(STATIC::$userPlaceholderImage);
  }

  public static function getTaskReportPath($file){
    if($file){
      if(file_exists(STATIC::$getTaskReportPath.$file)){
        return url(STATIC::$getTaskReportPath.$file);
      }
    }
    return url(STATIC::$userPlaceholderImage);
  }

  public static function getIdCardPath($file){
    if($file){
      if(file_exists(STATIC::$getIdCardPath.$file)){
        return url(STATIC::$getIdCardPath.$file);
      }
    }
    return url(STATIC::$userPlaceholderImage);
  }
  
  public static function getCmsImagePath($file){
    if($file){
      if(file_exists(STATIC::$getCmsImagePath.$file)){
        return url(STATIC::$getCmsImagePath.$file);
      }
    }
    return url(STATIC::$userPlaceholderImage);
  }

  public static function getMakeAnOfferPath($file){
    if($file){
      if(file_exists(STATIC::$getMakeAnOfferPath.$file)){
        return url(STATIC::$getMakeAnOfferPath.$file);
      }
    }
    return url(STATIC::$userPlaceholderImage);
  }

  public static function getAdvertisementPath($file){
    if($file){
      if(file_exists(STATIC::$getAdvertisementPath.$file)){
        return url(STATIC::$getAdvertisementPath.$file);
      }
    }
    return url(STATIC::$userPlaceholderImage);
  }

  

  

  
  
}
