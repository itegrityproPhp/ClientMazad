<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePrescriptionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('prescriptions', function (Blueprint $table) {
            $table->id();
			$table->string('lab_id')->nullable();
			$table->string('name')->nullable();
			$table->string('address')->nullable();
			$table->string('phone_number')->nullable();
			$table->string('gender')->nullable();
			$table->string('email')->nullable();
			$table->string('prescription')->nullable();
			$table->string('status')->default('1')->nullable();
			$table->longText('customer_note')->nullable();
			$table->longText('admin_note')->nullable();
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
        Schema::dropIfExists('prescriptions');
    }
}
