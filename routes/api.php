<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ItemController;
use App\Http\Controllers\OrderController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:sanctrum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::post('/auth/createToken', [AuthController::class, 'createToken']);

Route::middleware(['auth:sanctum'])->group(function () {
    Route::post('/auth/login', [AuthController::class, 'login']);
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::get('/me', [AuthController::class, 'me']);
    Route::get('/showOrder', [OrderController::class, 'showOrder']);
    Route::get('/detailOrder/{id}', [OrderController::class, 'detailOrder']);
});

// Route Manager
Route::middleware(['auth:sanctum', 'managerAuthenticate'])->group(function () {
    Route::post('/item', [ItemController::class, 'item']);
    Route::post('/itemUpdate', [ItemController::class, 'itemUpdate']);
});

// Route Waitress
Route::middleware(['auth:sanctum', 'waitressAuthenticate'])->group(function () {
    Route::post('/order', [OrderController::class, 'order']);
});

// Route Chef
Route::middleware(['auth:sanctum', 'chefAuthenticate'])->group(function () {
    Route::get('/order/{id}/set-to-done', [OrderController::class, 'setToDone']);
});

// Route Kasir
Route::middleware(['auth:sanctum', 'kasirAuthenticate'])->group(function () {
    Route::get('/order/{id}/payment', [OrderController::class, 'payment']);
});
