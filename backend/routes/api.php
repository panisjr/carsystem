<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\CarlistController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('signUp', [AuthController::class, 'signUp']);
Route::post('signIn', [AuthController::class, 'signIn']);

Route::group(['middleware' => 'api'], function ($router) {
    Route::post('logout', [AuthController::class, 'logout']);
    
    // Car routes
    Route::get('cars', [CarlistController::class, 'index']);
    Route::post('cars', [CarlistController::class, 'store']);
    
});
