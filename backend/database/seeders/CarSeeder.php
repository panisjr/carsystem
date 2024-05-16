<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Faker\Factory as Faker;

class CarSeeder extends Seeder
{
    public function run()
    {
        $faker = Faker::create();

        for ($i = 0; $i < 500; $i++) {
            DB::table('cars')->insert([
                'make' => $faker->company,
                'model' => $faker->word,
                'year' => $faker->numberBetween(2000, date('Y')),
                'VIN' => $faker->unique()->regexify('[A-HJ-NPR-Z0-9]{17}'),
                'license_plate_number' => $faker->unique()->regexify('[A-Z]{3}[0-9]{3}'),
                'price' => $faker->numberBetween(10000, 50000),
                'color' => $faker->safeColorName,
                'fuel_type' => $faker->randomElement(['Gasoline', 'Diesel', 'Electric']),
                'transmission_type' => $faker->randomElement(['Automatic', 'Manual']),
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
