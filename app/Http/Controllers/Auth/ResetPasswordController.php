<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\ResetsPasswords;
use Illuminate\Http\Request;
use Auth;

class ResetPasswordController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Password Reset Controller
    |--------------------------------------------------------------------------
    |
    | This controller is responsible for handling password reset requests
    | and uses a simple trait to include this behavior. You're free to
    | explore this trait and override any methods you wish to tweak.
    |
    */

    use ResetsPasswords;

    /**
     * Where to redirect users after resetting their password.
     *
     * @var string
     */
    //protected $redirectTo = RouteServiceProvider::HOME;
        public function redirectTo(){   
            // User role
            $role = Auth::user()->role; 
            // Check user role
            switch ($role) {
                case '1':
                    return '/backend/dashboard';
                    break;
                case '3':
                    return '/backend/dashboard';
                    break; 
                default:
                    return '/dashboard'; 
                    break;
            }
        }
    public function showResetForm(Request $request, $token = null)
    {   
        return view('backend.auth.passwords.reset')->with(
            ['token' => $token, 'email' => $request->email]
        );
    }
}
