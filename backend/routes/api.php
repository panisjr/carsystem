<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\CarlistController;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use PharIo\Manifest\AuthorCollection;

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
    Route::get('cars/{car}', [CarlistController::class, 'show']);
    Route::put('cars/{car}', [CarlistController::class, 'update']);
    Route::delete('cars/{car}', [CarlistController::class, 'destroy']);
    Route::get('users/todayRegisteredCarsCount', [CarlistController::class, 'todayRegisteredCarsCount']);

    //Accounts 
    Route::get('/getUsers', [UserController::class, 'getUsers']);
    Route::get('/getTotal', [UserController::class, 'getTotal']);
    Route::get('users/todayRegisteredUsersCount', [UserController::class, 'todayRegisteredUsersCount']);
    Route::delete('/deleteUser/{id}', [UserController::class, 'deleteUser']);
    Route::put('/updateUser/{id}', [UserController::class, 'updateUser']);
    Route::post('/deactivate/{id}', [UserController::class, 'deactivate']);

    // History
    Route::post('/history', [UserController::class, 'history']);
    Route::get('/getHistory', [UserController::class, 'getHistory']);
    Route::delete('/deleteHistory/{id}', [UserController::class, 'deleteHistory']);
    Route::delete('/deleteAllHistory', [UserController::class, 'deleteAllHistory']);
});
