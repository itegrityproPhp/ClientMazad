<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCouponsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('coupons', function (Blueprint $table) {
            $table->id();
			$table->string('coupon_code')->nullable();
			$table->string('type')->comment('package,test')->default('package')->nullable();
			$table->string('product_ids')->nullable();
			$table->string('coupon_type')->comment('fixed,percent')->default('fixed')->nullable();
			$table->string('coupon_value')->default('0')->nullable();
			$table->date('coupon_start_date')->nullable();
			$table->date('coupon_end_date')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('coupons');
    }
}
