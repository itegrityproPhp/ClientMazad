<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Auth;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    //protected $redirectTo = RouteServiceProvider::HOME;

    public function showLoginForm(){
        //Session::put('url.intended',URL::previous());
        return view('backend.auth.login');
    }
    
    protected function authenticated(Request $request, $user){
        if($user->role==1){
            return redirect('backend/dashboard');
        }else{
            $this->guard()->logout();
            $request->session()->invalidate();
            return redirect('login')->with('error', 'Your account deactivate by admin,Please contact Couponblast.deals');
        }
    }

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }
    public function logout(Request $request){
        if(Auth::user()->role=='1'){
            $this->guard()->logout();
            $request->session()->invalidate();
            return redirect('admin/login')->with('error', 'Logout Successfully');
        }elseif(Auth::user()->role=='2'){
            $this->guard()->logout();
            $request->session()->invalidate();
            return redirect('')->with('error', 'Logout Successfully');
        }else{
            $this->guard()->logout();
            $request->session()->invalidate();
           return redirect('admin/login')->with('error', 'Logout Successfully'); 
        }
    }
}
