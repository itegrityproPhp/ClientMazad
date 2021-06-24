<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;

class Faq extends Model
{
   	//use SoftDeletes;
	protected $table = 'faqs';
	protected $primaryKey = 'id';
	
    protected $fillable = [
        'faq_category_id','title','title_ar','question','question_ar','ans','ans_ar','sequence','type','status'
    ];

    public function faqCategory(){
       return  $this->hasOne('App\Models\FaqCategory','id' , 'faq_category_id');
    }
}