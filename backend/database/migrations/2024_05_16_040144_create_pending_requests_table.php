<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePendingRequestsTable extends Migration
{
    public function up()
    {
        Schema::create('pending_requests', function (Blueprint $table) {
            $table->id();
            $table->string('car_name');
            $table->string('customer_name');
            $table->string('status')->default('pending');
            $table->string('requested_status')->default('Buy'); // Set a default value for requested_status
            $table->timestamp('requested_at');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('pending_requests');
    }
}

