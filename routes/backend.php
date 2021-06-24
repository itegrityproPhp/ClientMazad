<?php
Auth::routes();
Route::get('500', function () {
	return view('errors.500');
})->name('500');
Route::group(['middleware' => ['auth']], function () {
	//Route::get('500', 'Backend\HomeController@index')->name('backend-dashboard');
	Route::get('/backend/dashboard', 'Backend\HomeController@index')->name('backend-dashboard');
	Route::get('/backend/get_notification', 'Backend\HomeController@getNotification')->name('backend-get_notification');
	Route::post('/backend/upload', 'Backend\HomeController@upload')->name('upload');
	Route::get('/backend/profile' , 'Backend\ProfileController@show')->name('backend-profile');
	Route::put('/backend/profile_update' , 'Backend\ProfileController@update')->name('backend-profile_update');
	Route::put('/backend/update_password' , 'Backend\ProfileController@updatePassword')->name('backend-update_password');
	
	Route::put('/backend/update_profile_image' , 'Backend\ProfileController@updateProfileImage')->name('backend-update_profile_image');

	Route::put('/backend/passowrd_send' , 'Backend\ProfileController@passowrdSend')->name('backend-passowrdSend');
	Route::get('/backend/passowrd_change' , 'Backend\ProfileController@passowrdChange')->name('backend-passowrd_change');

	Route::name('backend/advertisement_home/')->group(function(){
		Route::get('backend/advertisement_home' , 'Backend\AdvertisementHomeController@index')->name('index');
	});

	Route::name('backend/private_auction_home/')->group(function(){
		Route::get('backend/private_auction_home' , 'Backend\PrivateAuctionHomeController@index')->name('index');
	});
	Route::name('backend/setting/')->group(function(){
		Route::get('backend/setting' , 'Backend\SettingController@index')->name('index');
		Route::put('backend/setting/update/{id?}' , 'Backend\SettingController@update')->name('update');
	});

	Route::name('backend/auction_offer/')->group(function(){
		Route::get('backend/auction_offer' , 'Backend\AuctionOffer@index')->name('index');
		Route::get('backend/auction_offer/view/{id?}' , 'Backend\AuctionOffer@view')->name('view');
		Route::put('backend/auction_offer/update/{id?}' , 'Backend\AuctionOffer@update')->name('update');
	});

	
	Route::name('backend/payment/')->group(function(){
		Route::get('backend/payment' , 'Backend\PaymentController@index')->name('index');
		Route::put('backend/payment/update/{id?}' , 'Backend\PaymentController@update')->name('update');
	});
	Route::name('backend/locale_file/')->group(function(){
		Route::get('backend/locale_file' , 'Backend\LocaleFileController@changeLang')->name('index');
		Route::put('backend/locale_file/update/{id?}' , 'Backend\LocaleFileController@update')->name('update');
	});

	Route::name('backend/advertisement_category/')->group(function(){
		Route::get('backend/advertisement_category' , 'Backend\AdvertisementCategoryController@index')->name('index');
		Route::get('backend/advertisement_category/create' , 'Backend\AdvertisementCategoryController@create')->name('create');
		Route::put('backend/advertisement_category/store' , 'Backend\AdvertisementCategoryController@store')->name('store');
		Route::get('backend/advertisement_category/edit/{id?}' , 'Backend\AdvertisementCategoryController@edit')->name('edit');
	 	Route::put('backend/advertisement_category/update/{id?}' , 'Backend\AdvertisementCategoryController@update')->name('update');
	 	Route::get('backend/advertisement_category/view/{id?}' , 'Backend\AdvertisementCategoryController@view')->name('view');
	 	Route::get('backend/advertisement_category/destroy/{id?}' , 'Backend\AdvertisementCategoryController@destroy')->name('destroy');
	 	Route::get('backend/advertisement_category/active_inactive' , 'Backend\AdvertisementCategoryController@activeInactive')->name('active_inactive');
	});

	Route::name('backend/advertisement_point/')->group(function(){
		Route::get('backend/advertisement_point' , 'Backend\AdvertisementPointController@index')->name('index');
		Route::get('backend/advertisement_point/create' , 'Backend\AdvertisementPointController@create')->name('create');
		Route::put('backend/advertisement_point/store' , 'Backend\AdvertisementPointController@store')->name('store');
		Route::get('backend/advertisement_point/edit/{id?}' , 'Backend\AdvertisementPointController@edit')->name('edit');
	 	Route::put('backend/advertisement_point/update/{id?}' , 'Backend\AdvertisementPointController@update')->name('update');
	 	Route::get('backend/advertisement_point/view/{id?}' , 'Backend\AdvertisementPointController@view')->name('view');
	 	Route::get('backend/advertisement_point/destroy/{id?}' , 'Backend\AdvertisementPointController@destroy')->name('destroy');
	 	Route::get('backend/advertisement_point/active_inactive' , 'Backend\AdvertisementPointController@activeInactive')->name('active_inactive');
	});

	Route::name('backend/advertisement_plan_time/')->group(function(){
		Route::get('backend/advertisement_plan_time' , 'Backend\AdvertisementPlanTimeController@index')->name('index');
		Route::get('backend/advertisement_plan_time/create' , 'Backend\AdvertisementPlanTimeController@create')->name('create');
		Route::put('backend/advertisement_plan_time/store' , 'Backend\AdvertisementPlanTimeController@store')->name('store');
		Route::get('backend/advertisement_plan_time/edit/{id?}' , 'Backend\AdvertisementPlanTimeController@edit')->name('edit');
	 	Route::put('backend/advertisement_plan_time/update/{id?}' , 'Backend\AdvertisementPlanTimeController@update')->name('update');
	 	Route::get('backend/advertisement_plan_time/view/{id?}' , 'Backend\AdvertisementPlanTimeController@view')->name('view');
	 	Route::get('backend/advertisement_plan_time/destroy/{id?}' , 'Backend\AdvertisementPlanTimeController@destroy')->name('destroy');
	 	Route::get('backend/advertisement_plan_time/active_inactive' , 'Backend\AdvertisementPlanTimeController@activeInactive')->name('active_inactive');
	});

	Route::name('backend/advertiser/')->group(function(){
		Route::get('backend/advertiser' , 'Backend\AdvertiserController@index')->name('index');
		Route::get('backend/advertiser/create' , 'Backend\AdvertiserController@create')->name('create');
		Route::put('backend/advertiser/store' , 'Backend\AdvertiserController@store')->name('store');
		Route::get('backend/advertiser/edit/{id?}' , 'Backend\AdvertiserController@edit')->name('edit');
	 	Route::put('backend/advertiser/update/{id?}' , 'Backend\AdvertiserController@update')->name('update');
	 	Route::get('backend/advertiser/view/{id?}' , 'Backend\AdvertiserController@view')->name('view');
	 	Route::get('backend/advertiser/destroy/{id?}' , 'Backend\AdvertiserController@destroy')->name('destroy');
	 	Route::get('backend/advertiser/active_inactive' , 'Backend\AdvertiserController@activeInactive')->name('active_inactive');
	});

	Route::name('backend/advertisement/')->group(function(){
		Route::get('backend/advertisement' , 'Backend\AdvertisementController@index')->name('index');
		Route::get('backend/advertisement/create' , 'Backend\AdvertisementController@create')->name('create');
		Route::put('backend/advertisement/store' , 'Backend\AdvertisementController@store')->name('store');
		Route::get('backend/advertisement/edit/{id?}' , 'Backend\AdvertisementController@edit')->name('edit');
	 	Route::put('backend/advertisement/update/{id?}' , 'Backend\AdvertisementController@update')->name('update');
	 	Route::get('backend/advertisement/view/{id?}' , 'Backend\AdvertisementController@view')->name('view');
	 	Route::get('backend/advertisement/destroy/{id?}' , 'Backend\AdvertiserController@destroy')->name('destroy');
	 	Route::get('backend/advertisement/active_inactive' , 'Backend\AdvertisementController@activeInactive')->name('active_inactive');
	});

	

	Route::name('backend/api/')->group(function(){
		Route::get('backend/api' , 'Backend\ApiController@index')->name('index');
		Route::get('backend/api/create' , 'Backend\ApiController@create')->name('create');
		Route::put('backend/api/store' , 'Backend\ApiController@store')->name('store');
		Route::get('backend/api/edit/{id?}' , 'Backend\ApiController@edit')->name('edit');
	 	Route::put('backend/api/update/{id?}' , 'Backend\ApiController@update')->name('update');
	 	Route::get('backend/api/view/{id?}' , 'Backend\ApiController@view')->name('view');
	 	Route::get('backend/api/destroy/{id?}' , 'Backend\ApiController@destroy')->name('destroy');
	 	Route::get('backend/api/active_inactive' , 'Backend\ApiController@activeInactive')->name('active_inactive');
	});

	Route::name('backend/private_auction/')->group(function(){
		Route::get('backend/private_auction' , 'Backend\PrivateAuctionController@index')->name('index');
		Route::get('backend/private_auction/create' , 'Backend\PrivateAuctionController@create')->name('create');
		Route::post('backend/private_auction/store' , 'Backend\PrivateAuctionController@store')->name('store');
		
		Route::get('backend/private_auction/edit/{id?}' , 'Backend\PrivateAuctionController@edit')->name('edit');
	 	Route::post('backend/private_auction/update/{id?}' , 'Backend\PrivateAuctionController@update')->name('update');

		Route::get('backend/private_auction/view/{id?}' , 'Backend\PrivateAuctionController@view')->name('view');
		Route::get('backend/private_auction/activate_user' , 'Backend\PrivateAuctionController@activateUser')->name('activate_user');
	 	Route::get('backend/private_auction/destroy/{id?}' , 'Backend\PrivateAuctionController@destroy')->name('destroy');

	 	Route::get('backend/private_auction/transaction/{id?}' , 'Backend\PrivateAuctionController@transaction')->name('transaction');
	 	
	 	Route::get('backend/private_auction/get_city' , 'Backend\PrivateAuctionController@getCity')->name('get_city');

	 	Route::get('backend/private_auction/email_check' , 'Backend\PrivateAuctionController@emailCheck')->name('email_check');

	 	Route::get('backend/private_auction/edit_document/{id?}' , 'Backend\PrivateAuctionController@editDocument')->name('edit_document');

	 	Route::post('backend/private_auction/update_document/{id?}' , 'Backend\PrivateAuctionController@updateDocument')->name('update_document');
	});

	Route::name('backend/country/')->group(function(){
		Route::get('backend/country' , 'Backend\CountryController@index')->name('index');
		Route::get('backend/country/create' , 'Backend\CountryController@create')->name('create');
		Route::put('backend/country/store' , 'Backend\CountryController@store')->name('store');
		Route::get('backend/country/edit/{id?}' , 'Backend\CountryController@edit')->name('edit');
	 	Route::put('backend/country/update/{id?}' , 'Backend\CountryController@update')->name('update');
	 	Route::get('backend/country/view/{id?}' , 'Backend\CountryController@view')->name('view');
	 	Route::get('backend/country/destroy/{id?}' , 'Backend\CountryController@destroy')->name('destroy');
	});

	Route::name('backend/city/')->group(function(){
		Route::get('backend/city' , 'Backend\CityController@index')->name('index');
		Route::get('backend/city/create' , 'Backend\CityController@create')->name('create');
		Route::put('backend/city/store' , 'Backend\CityController@store')->name('store');
		Route::get('backend/city/edit/{id?}' , 'Backend\CityController@edit')->name('edit');
	 	Route::put('backend/city/update/{id?}' , 'Backend\CityController@update')->name('update');
	 	Route::get('backend/city/view/{id?}' , 'Backend\CityController@view')->name('view');
	 	Route::get('backend/city/destroy/{id?}' , 'Backend\CityController@destroy')->name('destroy');
	 	
	});
	
	Route::post('get-area-by-country' , 'Backend\CityController@get_area_by_country');
	
	Route::name('backend/area/')->group(function(){
		Route::get('backend/area' , 'Backend\AreaController@index')->name('index');
		Route::get('backend/area/create' , 'Backend\AreaController@create')->name('create');
		Route::put('backend/area/store' , 'Backend\AreaController@store')->name('store');
		Route::get('backend/area/edit/{id?}' , 'Backend\AreaController@edit')->name('edit');
	 	Route::put('backend/area/update/{id?}' , 'Backend\AreaController@update')->name('update');
	 	Route::get('backend/area/view/{id?}' , 'Backend\AreaController@view')->name('view');
	 	Route::get('backend/area/destroy/{id?}' , 'Backend\AreaController@destroy')->name('destroy');
	 	
	});

	
	Route::name('backend/property/')->group(function(){
		Route::get('backend/property' , 'Backend\PropertyController@index')->name('index');
		Route::get('backend/property/create' , 'Backend\PropertyController@create')->name('create');
		Route::put('backend/property/store' , 'Backend\PropertyController@store')->name('store');
		Route::get('backend/property/edit/{id?}' , 'Backend\PropertyController@edit')->name('edit');
	 	Route::put('backend/property/update/{id?}' , 'Backend\PropertyController@update')->name('update');
	 	Route::get('backend/property/view/{id?}' , 'Backend\PropertyController@view')->name('view');
	 	Route::get('backend/property/destroy/{id?}' , 'Backend\PropertyController@destroy')->name('destroy');
	});
	
	Route::get('backend/property/requests/{id?}' , 'Backend\RentController@requests')->name('requests');
	Route::get('backend/property/chats/{id?}' , 'Backend\RentController@chats')->name('chats');
	Route::get('backend/property/messages/{id?}/{other_id?}/{prop_id?}' , 'Backend\RentController@messages')->name('messages');
	
	Route::name('backend/rent/')->group(function(){
		Route::get('backend/rent' , 'Backend\RentController@index')->name('index');
		Route::get('backend/rent/create' , 'Backend\RentController@create')->name('create');
		Route::put('backend/rent/store' , 'Backend\RentController@store')->name('store');
		Route::get('backend/rent/edit/{id?}' , 'Backend\RentController@edit')->name('edit');
	 	Route::put('backend/rent/update/{id?}' , 'Backend\RentController@update')->name('update');
	 	Route::get('backend/rent/view/{id?}' , 'Backend\RentController@view')->name('view');
	 	Route::get('backend/rent/destroy/{id?}' , 'Backend\RentController@destroy')->name('destroy');
	 	Route::get('backend/rent/change_buy_req_status' , 'Backend\RentController@change_buy_req_status')->name('change_buy_req_status');
	 	Route::get('backend/rent/change_tour_req_status' , 'Backend\RentController@change_tour_req_status')->name('change_tour_req_status');
	});

	Route::name('backend/auction/')->group(function(){
		Route::get('backend/auction' , 'Backend\AuctionController@index')->name('index');
		Route::get('backend/auction/create' , 'Backend\AuctionController@create')->name('create');
		Route::put('backend/auction/store' , 'Backend\AuctionController@store')->name('store');
		Route::get('backend/auction/edit/{id?}' , 'Backend\AuctionController@edit')->name('edit');
	 	Route::put('backend/auction/update/{id?}' , 'Backend\AuctionController@update')->name('update');
	 	Route::get('backend/auction/destroy/{id?}' , 'Backend\AuctionController@destroy')->name('destroy');
		Route::get('backend/auction/view/{id?}' , 'Backend\AuctionController@view')->name('view');
		Route::get('backend/auction/change_admin_status' , 'Backend\AuctionController@changeAdminStatus')->name('change_admin_status');
		Route::get('backend/auction/get_sub_category' , 'Backend\AuctionController@getSubCategory')->name('get_sub_category');
		Route::get('backend/auction/get_level' , 'Backend\AuctionController@getLevel')->name('get_level');
		Route::get('backend/auction/get_evaluator' , 'Backend\AuctionController@getEvaluator')->name('get_evaluator');
		
		
	});

	Route::name('backend/notification/')->group(function(){
		Route::get('backend/notification' , 'Backend\NotificationController@index')->name('index');
		Route::get('backend/notification/send_notification' , 'Backend\NotificationController@sendNotification')->name('send_notification');
		Route::get('backend/notification/get_user' , 'Backend\NotificationController@getUser')->name('get_user');
		Route::put('backend/notification/store_send_notification' , 'Backend\NotificationController@storeSendNotification')->name('store_send_notification');
		Route::get('backend/notification/create' , 'Backend\NotificationController@create')->name('create');
		Route::put('backend/notification/store' , 'Backend\NotificationController@store')->name('store');
		Route::get('backend/notification/edit/{id?}' , 'Backend\NotificationController@edit')->name('edit');
	 	Route::put('backend/notification/update/{id?}' , 'Backend\NotificationController@update')->name('update');
	 	Route::get('backend/notification/view/{id?}' , 'Backend\NotificationController@view')->name('view');
	 	Route::get('backend/notification/destroy/{id?}' , 'Backend\NotificationController@destroy')->name('destroy');
	});

	Route::name('backend/notification_template/')->group(function(){
		Route::get('backend/notification_template' , 'Backend\NotificationTemplateController@index')->name('index');
		Route::get('backend/notification_template/create' , 'Backend\NotificationTemplateController@create')->name('create');
		Route::put('backend/notification_template/store' , 'Backend\NotificationTemplateController@store')->name('store');
		Route::get('backend/notification_template/edit/{id?}' , 'Backend\NotificationTemplateController@edit')->name('edit');
	 	Route::put('backend/notification_template/update/{id?}' , 'Backend\NotificationTemplateController@update')->name('update');
	 	Route::get('backend/notification_template/view/{id?}' , 'Backend\NotificationTemplateController@view')->name('view');
	 	Route::get('backend/notification_template/destroy/{id?}' , 'Backend\NotificationTemplateController@destroy')->name('destroy');
	});
	
	Route::name('backend/auction_location/')->group(function(){
		Route::get('backend/auction_location' , 'Backend\AuctionLocationController@index')->name('index');
	 	Route::get('backend/auction_location/view/{id?}' , 'Backend\AuctionLocationController@view')->name('view');
	});
	
	Route::name('backend/refund_request/')->group(function(){
		Route::get('backend/refund_request/bidder' , 'Backend\RefundRequestController@Bidder')->name('bidder');
	 	Route::get('backend/refund_request/auctioner' , 'Backend\RefundRequestController@Auctioner')->name('auctioner');
	 	Route::get('backend/refund_request/evaluator' , 'Backend\RefundRequestController@Evaluator')->name('evaluator');
	 	Route::get('backend/refund_request/change_refund_status' , 'Backend\RefundRequestController@changeRefundStatus')->name('change_refund_status');
	 	
	});

	Route::name('backend/wallet/')->group(function(){
		Route::get('backend/wallet/bidder' , 'Backend\WalletController@Bidder')->name('bidder');
	 	Route::get('backend/wallet/auctioner' , 'Backend\WalletController@Auctioner')->name('auctioner');
	 	Route::get('backend/wallet/tranction/{id?}' , 'Backend\WalletController@Tranction')->name('tranction');
	 	Route::get('backend/wallet/evaluator' , 'Backend\WalletController@Evaluator')->name('evaluator');
	});

	

	Route::name('backend/sms_bank/')->group(function(){
		Route::get('backend/sms_bank' , 'Backend\SmsBankController@index')->name('index');
	 	Route::get('backend/sms_bank/view/{id?}' , 'Backend\SmsBankController@view')->name('view');
	});
	Route::name('backend/page/')->group(function(){
		Route::get('backend/page' , 'Backend\PageController@index')->name('index');
		Route::get('backend/page/create' , 'Backend\PageController@create')->name('create');
		Route::put('backend/page/store' , 'Backend\PageController@store')->name('store');
		Route::get('backend/page/edit/{id?}' , 'Backend\PageController@edit')->name('edit');
	 	Route::put('backend/page/update/{id?}' , 'Backend\PageController@update')->name('update');
	 	Route::get('backend/page/view/{id?}' , 'Backend\PageController@view')->name('view');
	 	Route::get('backend/page/destroy/{id?}' , 'Backend\PageController@destroy')->name('destroy');
	});


	Route::name('backend/rating/')->group(function(){
		Route::get('backend/rating/private' , 'Backend\RatingController@privateRating')->name('private');
		Route::get('backend/rating/forced' , 'Backend\RatingController@forcedRating')->name('forced');
		Route::get('backend/rating/destroy/{id?}' , 'Backend\RatingController@destroy')->name('destroy');
	});
	
	Route::name('backend/comment/')->group(function(){
		Route::get('backend/comment/private' , 'Backend\CommentController@privateComment')->name('private');
		Route::get('backend/comment/forced' , 'Backend\CommentController@forcedComment')->name('forced');
		Route::get('backend/comment/view/{id?}' , 'Backend\CommentController@view')->name('view');
	 	Route::get('backend/comment/destroy/{id?}' , 'Backend\CommentController@destroy')->name('destroy');
	 	Route::get('backend/comment/destroy/{id?}' , 'Backend\CommentController@destroy')->name('destroy');
	 	Route::put('backend/comment/store' , 'Backend\CommentController@store')->name('store');
	});
	Route::name('backend/coupon/')->group(function(){
		Route::get('backend/coupon' , 'Backend\CouponController@index')->name('index');
		Route::get('backend/coupon/create' , 'Backend\CouponController@create')->name('create');
		Route::put('backend/coupon/store' , 'Backend\CouponController@store')->name('store');
		Route::get('backend/coupon/edit/{id?}' , 'Backend\CouponController@edit')->name('edit');
	 	Route::put('backend/coupon/update/{id?}' , 'Backend\CouponController@update')->name('update');
	 	Route::get('backend/coupon/view/{id?}' , 'Backend\CouponController@view')->name('view');
	 	Route::get('backend/coupon/destroy/{id?}' , 'Backend\CouponController@destroy')->name('destroy');
	});

	Route::name('backend/category/')->group(function(){
		Route::get('backend/category' , 'Backend\CategoryController@index')->name('index');
		Route::get('backend/category/create' , 'Backend\CategoryController@create')->name('create');
		Route::put('backend/category/store' , 'Backend\CategoryController@store')->name('store');
		Route::get('backend/category/edit/{id?}' , 'Backend\CategoryController@edit')->name('edit');
	 	Route::put('backend/category/update/{id?}' , 'Backend\CategoryController@update')->name('update');
	 	Route::get('backend/category/view/{id?}' , 'Backend\CategoryController@view')->name('view');
	 	Route::get('backend/category/destroy/{id?}' , 'Backend\CategoryController@destroy')->name('destroy');
	});


	Route::name('backend/role/')->group(function(){
		Route::get('backend/role' , 'Backend\RoleController@index')->name('index');
		Route::get('backend/role/create' , 'Backend\RoleController@create')->name('create');
		Route::put('backend/role/store' , 'Backend\RoleController@store')->name('store');
		Route::get('backend/role/edit/{id?}' , 'Backend\RoleController@edit')->name('edit');
	 	Route::put('backend/role/update/{id?}' , 'Backend\RoleController@update')->name('update');
	 	Route::get('backend/role/view/{id?}' , 'Backend\RoleController@view')->name('view');
	 	Route::get('backend/role/destroy/{id?}' , 'Backend\RoleController@destroy')->name('destroy');
	});
	Route::name('backend/level1/')->group(function(){
		Route::get('backend/level1' , 'Backend\Level1Controller@index')->name('index');
		Route::get('backend/level1/create' , 'Backend\Level1Controller@create')->name('create');
		Route::put('backend/level1/store' , 'Backend\Level1Controller@store')->name('store');
		Route::get('backend/level1/edit/{id?}' , 'Backend\Level1Controller@edit')->name('edit');
	 	Route::put('backend/level1/update/{id?}' , 'Backend\Level1Controller@update')->name('update');
	 	Route::get('backend/level1/view/{id?}' , 'Backend\Level1Controller@view')->name('view');
	 	Route::get('backend/level1/destroy/{id?}' , 'Backend\Level1Controller@destroy')->name('destroy');
	});
	Route::name('backend/level2/')->group(function(){
		Route::get('backend/level2' , 'Backend\Level2Controller@index')->name('index');
		Route::get('backend/level2/create' , 'Backend\Level2Controller@create')->name('create');
		Route::put('backend/level2/store' , 'Backend\Level2Controller@store')->name('store');
		Route::get('backend/level2/edit/{id?}' , 'Backend\Level2Controller@edit')->name('edit');
	 	Route::put('backend/level2/update/{id?}' , 'Backend\Level2Controller@update')->name('update');
	 	Route::get('backend/level2/view/{id?}' , 'Backend\Level2Controller@view')->name('view');
	 	Route::get('backend/level2/destroy/{id?}' , 'Backend\Level2Controller@destroy')->name('destroy');
	});
	Route::name('backend/level3/')->group(function(){
		Route::get('backend/level3' , 'Backend\Level3Controller@index')->name('index');
		Route::get('backend/level3/create' , 'Backend\Level3Controller@create')->name('create');
		Route::put('backend/level3/store' , 'Backend\Level3Controller@store')->name('store');
		Route::get('backend/level3/edit/{id?}' , 'Backend\Level3Controller@edit')->name('edit');
	 	Route::put('backend/level3/update/{id?}' , 'Backend\Level3Controller@update')->name('update');
	 	Route::get('backend/level3/view/{id?}' , 'Backend\Level3Controller@view')->name('view');
	 	Route::get('backend/level3/destroy/{id?}' , 'Backend\Level3Controller@destroy')->name('destroy');
	});
	Route::name('backend/level4/')->group(function(){
		Route::get('backend/level4' , 'Backend\Level4Controller@index')->name('index');
		Route::get('backend/level4/create' , 'Backend\Level4Controller@create')->name('create');
		Route::put('backend/level4/store' , 'Backend\Level4Controller@store')->name('store');
		Route::get('backend/level4/edit/{id?}' , 'Backend\Level4Controller@edit')->name('edit');
	 	Route::put('backend/level4/update/{id?}' , 'Backend\Level4Controller@update')->name('update');
	 	Route::get('backend/level4/view/{id?}' , 'Backend\Level4Controller@view')->name('view');
	 	Route::get('backend/level4/destroy/{id?}' , 'Backend\Level4Controller@destroy')->name('destroy');
	});
	Route::name('backend/level5/')->group(function(){
		Route::get('backend/level5' , 'Backend\Level5Controller@index')->name('index');
		Route::get('backend/level5/create' , 'Backend\Level5Controller@create')->name('create');
		Route::put('backend/level5/store' , 'Backend\Level5Controller@store')->name('store');
		Route::get('backend/level5/edit/{id?}' , 'Backend\Level5Controller@edit')->name('edit');
	 	Route::put('backend/level5/update/{id?}' , 'Backend\Level5Controller@update')->name('update');
	 	Route::get('backend/level5/view/{id?}' , 'Backend\Level5Controller@view')->name('view');
	 	Route::get('backend/level5/destroy/{id?}' , 'Backend\Level5Controller@destroy')->name('destroy');
	});
	
	Route::name('backend/facility/')->group(function(){
		Route::get('backend/facility' , 'Backend\FacilityController@index')->name('index');
		Route::get('backend/facility/create' , 'Backend\FacilityController@create')->name('create');
		Route::put('backend/facility/store' , 'Backend\FacilityController@store')->name('store');
		Route::get('backend/facility/edit/{id?}' , 'Backend\FacilityController@edit')->name('edit');
	 	Route::put('backend/facility/update/{id?}' , 'Backend\FacilityController@update')->name('update');
	 	Route::get('backend/facility/destroy/{id?}' , 'Backend\FacilityController@destroy')->name('destroy');
	});
	
	
	
	Route::name('backend/sub_category/')->group(function(){
		Route::get('backend/sub_category' , 'Backend\SubCategoryController@index')->name('index');
		Route::get('backend/sub_category/create' , 'Backend\SubCategoryController@create')->name('create');
		Route::put('backend/sub_category/store' , 'Backend\SubCategoryController@store')->name('store');
		Route::get('backend/sub_category/edit/{id?}' , 'Backend\SubCategoryController@edit')->name('edit');
	 	Route::put('backend/sub_category/update/{id?}' , 'Backend\SubCategoryController@update')->name('update');
	 	Route::get('backend/sub_category/view/{id?}' , 'Backend\SubCategoryController@view')->name('view');
	 	Route::get('backend/sub_category/destroy/{id?}' , 'Backend\SubCategoryController@destroy')->name('destroy');
	});

	Route::name('backend/last_category/')->group(function(){
		Route::get('backend/last_category' , 'Backend\LastCategoryController@index')->name('index');
		Route::get('backend/last_category/create' , 'Backend\LastCategoryController@create')->name('create');
		Route::put('backend/last_category/store' , 'Backend\LastCategoryController@store')->name('store');
		Route::get('backend/last_category/edit/{id?}' , 'Backend\LastCategoryController@edit')->name('edit');
	 	Route::put('backend/last_category/update/{id?}' , 'Backend\LastCategoryController@update')->name('update');
	 	Route::get('backend/last_category/view/{id?}' , 'Backend\LastCategoryController@view')->name('view');
	 	Route::get('backend/last_category/destroy/{id?}' , 'Backend\LastCategoryController@destroy')->name('destroy');
	});

	Route::name('backend/contact_us/')->group(function(){
		Route::get('backend/contact_us' , 'Backend\ContactUsController@index')->name('index');
		Route::get('backend/contact_us/edit/{id?}' , 'Backend\ContactUsController@edit')->name('edit');
	 	Route::put('backend/contact_us/update/{id?}' , 'Backend\ContactUsController@update')->name('update');
	});
	Route::name('backend/form/')->group(function(){
		Route::get('backend/form' , 'Backend\FormController@index')->name('index');
		Route::get('backend/form/create' , 'Backend\FormController@create')->name('create');
		Route::put('backend/form/store' , 'Backend\FormController@store')->name('store');
		Route::get('backend/form/edit/{id?}' , 'Backend\FormController@edit')->name('edit');
	 	Route::put('backend/form/update/{id?}' , 'Backend\FormController@update')->name('update');
	 	Route::get('backend/form/view/{id?}' , 'Backend\FormController@view')->name('view');
	 	Route::get('backend/form/destroy/{id?}' , 'Backend\FormController@destroy')->name('destroy');
	});

	Route::name('backend/faq_category/')->group(function(){
		Route::get('backend/faq_category' , 'Backend\FaqCategoryController@index')->name('index');
		Route::get('backend/faq_category/create' , 'Backend\FaqCategoryController@create')->name('create');
		Route::put('backend/faq_category/store' , 'Backend\FaqCategoryController@store')->name('store');
		Route::get('backend/faq_category/edit/{id?}' , 'Backend\FaqCategoryController@edit')->name('edit');
	 	Route::put('backend/faq_category/update/{id?}' , 'Backend\FaqCategoryController@update')->name('update');
	 	Route::get('backend/faq_category/view/{id?}' , 'Backend\FaqCategoryController@view')->name('view');
	 	Route::get('backend/faq_category/destroy/{id?}' , 'Backend\FaqCategoryController@destroy')->name('destroy');
	});

	Route::name('backend/faq/')->group(function(){
		Route::get('backend/faq' , 'Backend\FaqController@index')->name('index');
		Route::get('backend/faq/create' , 'Backend\FaqController@create')->name('create');
		Route::put('backend/faq/store' , 'Backend\FaqController@store')->name('store');
		Route::get('backend/faq/edit/{id?}' , 'Backend\FaqController@edit')->name('edit');
	 	Route::put('backend/faq/update/{id?}' , 'Backend\FaqController@update')->name('update');
	 	Route::get('backend/faq/view/{id?}' , 'Backend\FaqController@view')->name('view');
	 	Route::get('backend/faq/destroy/{id?}' , 'Backend\FaqController@destroy')->name('destroy');
	});

	Route::name('backend/user_training/')->group(function(){
		Route::get('backend/user_training' , 'Backend\UserTrainingController@index')->name('index');
		Route::get('backend/user_training/create' , 'Backend\UserTrainingController@create')->name('create');
		Route::put('backend/user_training/store' , 'Backend\UserTrainingController@store')->name('store');
		Route::get('backend/user_training/edit/{id?}' , 'Backend\UserTrainingController@edit')->name('edit');
	 	Route::put('backend/user_training/update/{id?}' , 'Backend\UserTrainingController@update')->name('update');
	 	Route::get('backend/user_training/view/{id?}' , 'Backend\UserTrainingController@view')->name('view');
	 	Route::get('backend/user_training/destroy/{id?}' , 'Backend\UserTrainingController@destroy')->name('destroy');
	});

	

	Route::name('backend/email_template/')->group(function(){
		Route::get('backend/email_template' , 'Backend\EmailTemplateController@index')->name('index');
		Route::get('backend/email_template/create' , 'Backend\EmailTemplateController@create')->name('create');
		Route::put('backend/email_template/store' , 'Backend\EmailTemplateController@store')->name('store');
		Route::get('backend/email_template/edit/{id?}' , 'Backend\EmailTemplateController@edit')->name('edit');
	 	Route::put('backend/email_template/update/{id?}' , 'backend\EmailTemplateController@update')->name('update');
	 	Route::get('backend/email_template/view/{id?}' , 'Backend\EmailTemplateController@view')->name('view');
	 	Route::get('backend/email_template/destroy/{id?}' , 'Backend\EmailTemplateController@destroy')->name('destroy');
	});

	Route::name('backend/content/')->group(function(){
		Route::get('backend/content' , 'Backend\ContentController@index')->name('index');
		Route::get('backend/content/create' , 'Backend\ContentController@create')->name('create');
		Route::put('backend/content/store' , 'Backend\ContentController@store')->name('store');
		Route::get('backend/content/edit/{id?}' , 'Backend\ContentController@edit')->name('edit');
	 	Route::put('backend/content/update/{id?}' , 'Backend\ContentController@update')->name('update');
	 	Route::get('backend/content/view/{id?}' , 'Backend\ContentController@view')->name('view');
	 	Route::get('backend/content/destroy/{id?}' , 'Backend\ContentController@destroy')->name('destroy');
	});

	Route::name('backend/social_media_chanel/')->group(function(){
		Route::get('backend/social_media_chanel' , 'Backend\SocialMediaChanelController@index')->name('index');
		Route::get('backend/social_media_chanel/create' , 'Backend\SocialMediaChanelController@create')->name('create');
		Route::put('backend/social_media_chanel/store' , 'Backend\SocialMediaChanelController@store')->name('store');
		Route::get('backend/social_media_chanel/edit/{id?}' , 'Backend\SocialMediaChanelController@edit')->name('edit');
	 	Route::put('backend/social_media_chanel/update/{id?}' , 'Backend\SocialMediaChanelController@update')->name('update');
	 	Route::get('backend/social_media_chanel/view/{id?}' , 'Backend\SocialMediaChanelController@view')->name('view');
	 	Route::get('backend/social_media_chanel/destroy/{id?}' , 'Backend\SocialMediaChanelController@destroy')->name('destroy');
	});

	Route::name('backend/property_evaluation/')->group(function(){
		Route::get('backend/property_evaluation' , 'Backend\PropertyEvaluationController@index')->name('index');
		Route::get('backend/property_evaluation/change_agent_task_status' , 'Backend\PropertyEvaluationController@changeAgentTaskStatus')->name('change_agent_task_status');
		Route::get('backend/property_evaluation/view/{id?}' , 'Backend\PropertyEvaluationController@view')->name('view');
	});

	
	Route::name('backend/permission/')->group(function(){
		Route::get('backend/permission' , 'Backend\PermissionController@index')->name('index');
		Route::get('backend/permission/create' , 'Backend\PermissionController@create')->name('create');
		Route::put('backend/permission/store' , 'Backend\PermissionController@store')->name('store');
		Route::get('backend/permission/edit/{id?}' , 'Backend\PermissionController@edit')->name('edit');
	 	Route::put('backend/permission/update/{id?}' , 'Backend\PermissionController@update')->name('update');
		Route::get('backend/permission/view/{id?}' , 'Backend\PermissionController@view')->name('view');
		Route::get('backend/permission/destroy/{id?}' , 'Backend\PermissionController@destroy')->name('destroy');
	});

	Route::name('backend/permission_administration/')->group(function(){
		Route::get('backend/permission_administration' , 'Backend\PermissionAdministrationController@index')->name('index');
		Route::get('backend/permission_administration/create' , 'Backend\PermissionAdministrationController@create')->name('create');
		Route::put('backend/permission_administration/store' , 'Backend\PermissionAdministrationController@store')->name('store');
		Route::get('backend/permission_administration/edit/{id?}' , 'Backend\PermissionAdministrationController@edit')->name('edit');
	 	Route::put('backend/permission_administration/update/{id?}' , 'Backend\PermissionAdministrationController@update')->name('update');
		Route::get('backend/permission_administration/view/{id?}' , 'Backend\PermissionAdministrationController@view')->name('view');
		Route::get('backend/permission_administration/destroy/{id?}' , 'Backend\PermissionAdministrationController@destroy')->name('destroy');
	});

	
	Route::name('backend/administration/')->group(function(){
		Route::get('backend/administration' , 'Backend\AdministrationController@index')->name('index');
		Route::get('backend/administration/create' , 'Backend\AdministrationController@create')->name('create');
		Route::post('backend/administration/store' , 'Backend\AdministrationController@store')->name('store');
		Route::get('backend/administration/edit/{id?}' , 'Backend\AdministrationController@edit')->name('edit');
	 	Route::post('backend/administration/update/{id?}' , 'Backend\AdministrationController@update')->name('update');
		Route::get('backend/administration/view/{id?}' , 'Backend\AdministrationController@view')->name('view');
		Route::get('backend/administration/administration_activate' , 'Backend\AdministrationController@administrationActivate')->name('administration_activate');
	 	Route::get('backend/administration/destroy/{id?}' , 'Backend\AdministrationController@destroy')->name('destroy');
	 	Route::get('backend/administration/get_city' , 'backend\AdministrationController@getCity')->name('get_city');
	});
	
	Route::name('backend/auction_notice/')->group(function(){
		Route::get('backend/auction_notice' , 'Backend\AuctionNoticeController@index')->name('index');
		Route::get('backend/auction_notice/view/{id?}' , 'Backend\AuctionNoticeController@view')->name('view');
	});

	Route::name('backend/cms/')->group(function(){
		Route::get('backend/cms' , 'Backend\CmsController@index')->name('index');
		Route::get('backend/cms/create' , 'Backend\CmsController@create')->name('create');
		Route::put('backend/cms/store' , 'Backend\CmsController@store')->name('store');
		Route::get('backend/cms/edit/{id?}' , 'Backend\CmsController@edit')->name('edit');
	 	Route::put('backend/cms/update/{id?}' , 'Backend\CmsController@update')->name('update');
		Route::get('backend/cms/view/{id?}' , 'Backend\CmsController@view')->name('view');
		Route::get('backend/cms/destroy/{id?}' , 'Backend\CmsController@destroy')->name('destroy');
	});

	Route::name('backend/cms_content/')->group(function(){
		Route::get('backend/cms_content' , 'Backend\CmsContentController@index')->name('index');
		Route::get('backend/cms_content/create' , 'Backend\CmsContentController@create')->name('create');
		Route::put('backend/cms_content/store' , 'Backend\CmsContentController@store')->name('store');
		Route::get('backend/cms_content/edit/{id?}' , 'Backend\CmsContentController@edit')->name('edit');
	 	Route::put('backend/cms_content/update/{id?}' , 'Backend\CmsContentController@update')->name('update');
		Route::get('backend/cms_content/view/{id?}' , 'Backend\CmsContentController@view')->name('view');
		Route::get('backend/cms_content/destroy/{id?}' , 'Backend\CmsContentController@destroy')->name('destroy');
	});
	
	Route::resource('property_make_an_offer','Backend\PropertyMakeAnOfferController')->middleware('auth');
	
});

?>