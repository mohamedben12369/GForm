<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\View;

Route::get('/', function () {
    return view('welcome');
});
/*****************************Authentification routes******************** */
use App\Http\Controllers\Auth\AuthenticatedSessionController;
use App\Http\Controllers\Auth\RegisteredUserController;
use App\Http\Controllers\DashboardController;
Route::middleware('auth')->get('/dashboard', function () {
    return view('dashboard');
});

Route::get('/login', [AuthenticatedSessionController::class, 'create'])->name('login');
Route::post('/login', [AuthenticatedSessionController::class, 'store']);
Route::post('/logout', [AuthenticatedSessionController::class, 'destroy'])->name('logout');

Route::get('/register', [RegisteredUserController::class, 'create'])->name('register');
Route::post('/register', [RegisteredUserController::class, 'store']);
Route::get('/dashboard', function () {
    return view('dashboard'); /*{if you want to redirect to any route or any view/controller*/})->name('dashboard');
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
