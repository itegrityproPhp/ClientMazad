<?php

namespace App\Http\Middleware;

use Closure;
use App\Models\User;

class CheckApiToken
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $token = str_replace('Bearer ','',$request->header('Authorization'));
        $tokenHash = hash('sha256', $token);

        $User = User::where('api_token',$tokenHash)->first();

        if($User != null){
            $request->attributes->add(['User' => $User]);
            //return response()->json(['status'=>true,'status_code'=>'200','message'=>'Valid Auth', 'data'=>$User,'error'=>['Invalid Auth Token']], 200);
            return $next($request);
        }else{
            return response()->json(['status'=>false,'status_code'=>'404','message'=>'Invalid Auth Token','error'=>['Invalid Auth Token']], 200);
        }
    }
}
