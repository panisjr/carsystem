<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Sale;

class SaleController extends Controller
{
    public function store(Request $request)
    {
        $validated = $request->validate([
            'car_name' => 'required|string|max:255',
            'customer_name' => 'required|string|max:255',
            'status' => 'required|string|max:255',
            'bought_at' => 'required|date',
        ]);

        // Convert the datetime value to the format required by MySQL
        $validated['bought_at'] = date('Y-m-d H:i:s', strtotime($validated['bought_at']));

        $sale = Sale::create($validated);

        return response()->json([
            'message' => 'Car bought successfully',
            'sale' => $sale
        ], 201);
    }
}
