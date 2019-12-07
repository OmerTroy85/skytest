<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\User;
use App\Admin;
use App\Blogger;
use Illuminate\Support\Facades\DB;
use Validator;

class UserController extends Controller
{
    public function showLoginAdmin(){
        return view('auth.adminLogin');
    }

    public function showLoginBlogger(){
        return view('auth.bloggerLogin');
    }

    public $successStatus = 200;
    public $errorStatus = 401;

    /**
     * User login
     *
     * @return \Illuminate\Http\Response
     */

    public function loginUser() {
        $auth = Auth::guard('web');
        if($auth->attempt(['email' => request('email'), 'password' => request('password')])){
            $user = Auth::user();
            $success['token'] =  $user->createToken('MyApp')-> accessToken;
            $success['status'] =  $this->successStatus;
            $success['message'] =  'Logged in as user';
            return $success;
        }
        else{
            $error = ['error' => 'Unauthorised', 'status' => $this->errorStatus];
            return $error;
        }
    }

    /**
     * Admin login
     *
     * @return \Illuminate\Http\Response
     */

    public function loginAdmin() {
        $auth = Auth::guard('admin');
        if($auth->attempt(['email' => request('email'), 'password' => request('password')])){
            $admin = $auth->user();
            $success['token'] =  $admin->createToken('MyApp')-> accessToken;
            $success['status'] =  $this->successStatus;
            $success['message'] =  'Logged in as admin';
            return $success;
        }
        else{
            $error = ['error' => 'Unauthorised', 'status' => $this->errorStatus];
            return $error;
        }
    }

    /**
     * Blogger login
     *
     * @return \Illuminate\Http\Response
     */

    public function loginBlogger() {
        $auth = Auth::guard('blogger');
        if($auth->attempt(['email' => request('email'), 'password' => request('password')])){
            $blogger = $auth->user();
            $success['token'] =  $blogger->createToken('MyApp')-> accessToken;
            $success['message'] =  'Logged in as blogger';
            $success['status'] =  $this->successStatus;
            return $success;
        }
        else{
            $error = ['error' => 'Unauthorised', 'status' => $this->errorStatus];
            return $error;
        }
    }

    /**
     * User Register
     *
     * @return \Illuminate\Http\Response
     */

    public function register(Request $request) {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email',
            'password' => 'required',
            'c_password' => 'required|same:password',
        ]);
        if ($validator->fails()) {
            return response()->json(['error'=>$validator->errors()], 401);
        }
        $input = $request->all();
        $input['password'] = bcrypt($input['password']);
        $user = User::create($input);
        $success['token'] =  $user->createToken('MyApp')-> accessToken;
        $success['name'] =  $user->name;
        $success['message'] =  'Registered as user';
        return response()->json(['success'=>$success], $this-> successStatus);
    }

    /**
     * Admin Register
     *
     * @return \Illuminate\Http\Response
     */

    public function registerAdmin(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email',
            'password' => 'required',
            'c_password' => 'required|same:password',
        ]);
        if ($validator->fails()) {
            return response()->json(['error'=>$validator->errors()], 401);
        }
        $input = $request->all();
        $input['password'] = bcrypt($input['password']);
        $admin = Admin::create($input);
        $success['token'] =  $admin->createToken('MyApp')-> accessToken;
        $success['name'] =  $admin->name;
        $success['message'] =  'Registered as admin';
        return response()->json(['success'=>$success], $this-> successStatus);
    }

    /**
     * Blogger Register
     *
     * @return \Illuminate\Http\Response
     */

    public function registerBlogger(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email',
            'password' => 'required',
            'c_password' => 'required|same:password',
        ]);
        if ($validator->fails()) {
            return response()->json(['error'=>$validator->errors()], 401);
        }
        $input = $request->all();
        $input['password'] = bcrypt($input['password']);
        $blogger = Blogger::create($input);
        $success['token'] =  $blogger->createToken('MyApp')-> accessToken;
        $success['name'] =  $blogger->name;
        $success['message'] =  'Registered as blogger';
        return response()->json(['success'=>$success], $this-> successStatus);
    }

//    public function logout(){
//        $user = Auth::user()->token();
//        $user->revoke();
//        return 'logged out';
//    }

    public function logout() {
        $accessToken = Auth::user()->token();
        DB::table('oauth_refresh_tokens')
            ->where('access_token_id', $accessToken->id)
            ->update([
                'revoked' => true
            ]);

        $accessToken->revoke();
        return 'logged out';
    }

    /**
     * details api
     *
     * @return \Illuminate\Http\Response
     */
    public function details() {
        $user = Auth::user();
        return response()->json(['success' => $user], $this-> successStatus);
    }

    public function indexPage() {
        $data['users'] = User::all();
        $data['admins'] = Admin::all();
        $data['bloggers'] = Blogger::all();

        if(Auth::guard('admin')->check()){

        }else if(Auth::guard('blogger')->check()){

        }else {

        }

        return view('index', $data);
    }

    public function editUser($id){
        $user = User::where('id', $id)->firstOrFail();
        $data['user'] = $user;
        return view('editUser', $data);
    }

    public function editedUser(Request $request){
        User::where('id', $request->id)
            ->update([
                'name' => $request->name,
                'email' => $request->email,
                'password' => bcrypt($request->password),
                ]);

        $message = 'Updated successfully';
        return $message;
    }

    public function deleteUser($id){
        $user = User::where('id', $id)->delete();
        return redirect('index');
    }

    public function editAdmin($id){
        $user = Admin::where('id', $id)->firstOrFail();
        $data['user'] = $user;
        return view('editAdmin', $data);
    }

    public function editedAdmin(Request $request){
        Admin::where('id', $request->id)
            ->update([
                'name' => $request->name,
                'email' => $request->email,
                'password' => bcrypt($request->password),
            ]);

        $message = 'Updated successfully';
        return $message;
    }

    public function deleteAdmin($id){
        $user = Admin::where('id', $id)->delete();
        return redirect('index');
    }

    public function editBlogger($id){
        $user = Blogger::where('id', $id)->firstOrFail();
        $data['user'] = $user;
        return view('editBlogger', $data);
    }

    public function editedBlogger(Request $request){
        Blogger::where('id', $request->id)
            ->update([
                'name' => $request->name,
                'email' => $request->email,
                'password' => bcrypt($request->password),
            ]);

        $message = 'Updated successfully';
        return $message;
    }

    public function deleteBlogger($id){
        $user = Blogger::where('id', $id)->delete();
        return redirect('index');
    }
}
