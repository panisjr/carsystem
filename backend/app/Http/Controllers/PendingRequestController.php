<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\PendingRequest;

class PendingRequestController extends Controller
{
    public function store(Request $request)
{
    $validated = $request->validate([
        'car_name' => 'required|string|max:255',
        'customer_name' => 'required|string|max:255',
        'requested_status' => 'required|string|in:Buy,Rent', // Validate requested_status
        'requested_at' => 'required|date',
    ]);

    // Check if a pending request already exists for the same car and customer
    $existingPendingRequest = PendingRequest::where('car_name', $validated['car_name'])
        ->where('customer_name', $validated['customer_name'])
        ->first();

    if ($existingPendingRequest) {
        // Pending request already exists, return error response
        return response()->json([
            'message' => 'You have already requested this car.',
        ], 400);
    }

    // Override default value with value from request payload
    $validated['requested_status'] = $request->input('requested_status');

    $validated['status'] = 'pending';
    $validated['requested_at'] = date('Y-m-d H:i:s', strtotime($validated['requested_at']));

    $pendingRequest = PendingRequest::create($validated);

    return response()->json([
        'message' => ucfirst($validated['requested_status']) . ' request submitted successfully',
        'pending_request' => $pendingRequest
    ], 201);
}

    // Other methods remain unchanged
}
