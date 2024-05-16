<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCarsTable extends Migration
{
    public function up()
    {
        Schema::create('cars', function (Blueprint $table) {
            $table->id();
            $table->string('make');
            $table->string('model');
            $table->unsignedSmallInteger('year');
            $table->string('VIN')->unique();
            $table->string('license_plate_number')->unique();
            $table->decimal('price', 10, 2);
            $table->string('color');
            $table->enum('fuel_type', ['Gasoline', 'Diesel', 'Electric']);
            $table->enum('transmission_type', ['Automatic', 'Manual']);
            $table->enum('status', ['Available'])->default('Available');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('cars');
    }
}
