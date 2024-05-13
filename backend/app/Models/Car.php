<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Car extends Model
{
    use HasFactory;

    protected $fillable = [
        'make',
        'model',
        'year',
        'VIN',
        'license_plate_number',
        'price',
        'color',
        'fuel_type',
        'transmission_type',
        'status',
        'quantity',
    ];
}
