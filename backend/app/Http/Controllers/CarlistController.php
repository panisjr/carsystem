<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Car;
use Carbon\Carbon;

class CarlistController extends Controller
{
    public function index()
    {
        return Car::all();
    }
public function todayRegisteredCarsCount(){
    $today = Carbon::now()->toDateString();
    $count = Car::whereDate('created_at',$today)->count();
    return response()->json(['count'=>$count]);
}
    public function store(Request $request)
    {
        $request->validate([
            'make' => 'required|string|regex:/^[a-zA-Z0-9\s]+$/',
            'model' => 'required|string|regex:/^[a-zA-Z0-9\s]+$/',
            'year' => 'required|integer|min:1900|max:' . (date('Y') + 1),
            'VIN' => 'required|string|unique:cars,VIN',
            'license_plate_number' => 'required|string|unique:cars,license_plate_number|regex:/^[a-zA-Z0-9\s]+$/',
            'price' => 'required|numeric|min:0',
            'color' => 'required|string|regex:/^[a-zA-Z\s]+$/',
            'fuel_type' => 'required|string|in:Gasoline,Diesel,Electric',
            'transmission_type' => 'required|string|in:Automatic,Manual',
        ]);

        $car = Car::create($request->all());

        return response()->json(['car'=>$car, 'message'=>'Car added successfully' ],200);
    }

    public function show(Car $car)
    {
        return $car;
    }

    public function update(Request $request, Car $car)
    {
        $request->validate([
            'make' => 'required|string|regex:/^[a-zA-Z0-9\s]+$/',
            'model' => 'required|string|regex:/^[a-zA-Z0-9\s]+$/',
            'year' => 'required|integer|min:1900|max:' . (date('Y') + 1),
            'VIN' => 'required|string|unique:cars,VIN,' . $car->id,
            'license_plate_number' => 'required|string|unique:cars,license_plate_number,' . $car->id . '|regex:/^[a-zA-Z0-9\s]+$/',
            'price' => 'required|numeric|min:0',
            'color' => 'required|string|regex:/^[a-zA-Z\s]+$/',
            'fuel_type' => 'required|string|in:Gasoline,Diesel,Electric',
            'transmission_type' => 'required|string|in:Automatic,Manual',
            'quantity' => 'required|integer|min:1',
        ]);

        $car->update($request->all());

        return response()->json(['car'=>$car, 'message'=>'Car updated successfully' ],200);

    }

    public function destroy(Car $car)
    {
        $car->delete();

        return response()->json(['car'=>$car, 'message'=>'Car deleted successfully' ],200);

    }
}
