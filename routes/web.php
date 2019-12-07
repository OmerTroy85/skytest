<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::get('index', 'API\UserController@indexPage');
Route::get('logout', 'UserController@logout');

Route::get('admin/login', 'API\UserController@showLoginAdmin');
Route::get('blogger/login', 'API\UserController@showLoginBlogger');

Route::get('/user/edit/{id}', 'API\UserController@editUser')->name('user.edit');
Route::get('/user/delete/{id}', 'API\UserController@deleteUser')->name('user.delete');
Route::post('/user/edited', 'API\UserController@editedUser')->name('user.edited');

Route::get('/admin/edit/{id}', 'API\UserController@editAdmin')->name('admin.edit');
Route::get('/admin/delete/{id}', 'API\UserController@deleteAdmin')->name('admin.delete');
Route::post('/admin/edited', 'API\UserController@editedAdmin')->name('admin.edited');

Route::get('/blogger/edit/{id}', 'API\UserController@editBlogger')->name('blogger.edit');
Route::get('/blogger/delete/{id}', 'API\UserController@deleteBlogger')->name('blogger.delete');
Route::post('/blogger/edited', 'API\UserController@editedBlogger')->name('blogger.edited');
