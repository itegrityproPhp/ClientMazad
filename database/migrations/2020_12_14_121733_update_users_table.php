<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UpdateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->string('last_name')->after('name')->nullable();
            $table->string('mobile_no')->after('password')->nullable();
            $table->string('username')->after('last_name')->nullable();
            $table->string('age')->after('mobile_no')->nullable();
            $table->string('user_image')->after('age')->nullable();
            $table->string('gender')->after('user_image')->nullable();
            $table->longText('address')->after('gender')->nullable();
            $table->string('lab_name')->after('address')->nullable();
            $table->string('role')->after('lab_name')->nullable();
            $table->string('lat')->after('role')->nullable();
            $table->string('lng')->after('lat')->nullable();
            $table->string('lab_category')->after('lng')->nullable();
            $table->longText('lab_description')->after('lab_category')->nullable();
            $table->string('lab_open_time')->after('lab_description')->nullable();
            $table->string('lab_close_time')->after('lab_open_time')->nullable();
            $table->string('lab_status')->after('lab_close_time')->default('1')->nullable();
            $table->string('status')->after('lab_status')->default('1')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn('last_name');
            $table->dropColumn('mobile_no');
            $table->dropColumn('username');
            $table->dropColumn('age');
            $table->dropColumn('user_image');
            $table->dropColumn('gender');
            $table->dropColumn('lab_name');
            $table->dropColumn('address');
            $table->dropColumn('role');
            $table->dropColumn('lat');
            $table->dropColumn('lng');
            $table->dropColumn('lab_category');
            $table->dropColumn('lab_description');
            $table->dropColumn('lab_open_time');
            $table->dropColumn('lab_close_time');
            $table->dropColumn('lab_status');
            $table->dropColumn('status');
        });
    }
}
