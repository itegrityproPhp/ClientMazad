<?php
use Illuminate\Support\Facades\Route;
Auth::routes();
Route::get('locale/{locale}', function ($locale) {
  if (in_array($locale, \Config::get('app.locales'))) {
    session(['locale' => $locale]);
  }
  return redirect()->back();
});

Route::get('/', 'FrontEnd\HomeController@index')->name('/');
Route::get('/terms_condition', 'FrontEnd\HomeController@terms_condition')->name('/terms_condition');
Route::get('/privacy_policy', 'FrontEnd\HomeController@privacy_policy')->name('/privacy_policy');
Route::post('/store_contact', 'FrontEnd\HomeController@storeContact')->name('store_contact');

Route::get('/admin/login', 'Auth\LoginController@showLoginForm')->name('admin_login');
Route::get('/sms_test', 'HomeController@smsTest')->name('/sms_test');

//Cron Routes
Route::get('/notifi_15_min_before_auction_start', 'HomeController@notifi_15_min_before_auction_start')->name('/notifi_15_min_before_auction_start');
Route::get('/auction_started', 'HomeController@auction_started')->name('/auction_started');
Route::get('/notifi_15_min_before_auction_end', 'HomeController@notifi_15_min_before_auction_end')->name('/notifi_15_min_before_auction_end');