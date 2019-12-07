<?php

use Illuminate\Http\Request;

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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('login', 'API\UserController@loginUser')->name('user.login');
Route::post('admin/login', 'API\UserController@loginAdmin')->name('admin.login');
Route::post('blogger/login', 'API\UserController@loginBlogger')->name('blogger.login');
Route::post('register', 'API\UserController@register')->name('user.register');
Route::post('admin/register', 'API\UserController@registerAdmin')->name('admin.register');
Route::post('blogger/register', 'API\UserController@registerBlogger')->name('blogger.register');

Route::group(['middleware' => 'auth:api'], function () {
    Route::post('details', 'API\UserController@details');
});
