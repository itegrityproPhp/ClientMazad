<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use DB;
use Auth;
use App\Models\Setting;
use App\Models\PermissionAdministration;


class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot(){
        //View::share('key', 'value');
        //Schema::defaultStringLength(191);
        $Setting=Setting::where('id',1)->first();
        
        $PermissionAdministration = [];

        config(['Setting' => $Setting,'PermissionAdministration' => $PermissionAdministration]);
    }
}
