<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBookingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bookings', function (Blueprint $table) {
            $table->id();
			$table->string('booking_id')->nullable();
			$table->string('user_id')->nullable();
			$table->string('lab_id')->nullable();
			$table->string('product_id')->comment('package_id,test_id')->nullable();
			$table->string('product_type')->comment('package,test')->nullable();
			$table->date('booking_date')->nullable();
			$table->string('status')->default('1')->nullable();
			$table->string('payment_id')->comment('Txn id')->nullable();
			$table->string('payment_status')->default('0')->nullable();
			$table->string('txn_type')->comment('Cod, Online')->nullable();
			$table->string('booking_amount')->nullable();
			$table->string('discount')->nullable();
			$table->string('total_order_amount')->nullable();
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
        Schema::dropIfExists('bookings');
    }
}
