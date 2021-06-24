<?php

namespace App\Exceptions;

use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Throwable;
use Symfony\Component\HttpKernel\Exception\MethodNotAllowedHttpException;
//use Symfony\Component\HttpKernel\Exception\ModelNotFoundException;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class Handler extends ExceptionHandler
{
    /**
     * A list of the exception types that are not reported.
     *
     * @var array
     */
    protected $dontReport = [
        //
    ];

    /**
     * A list of the inputs that are never flashed for validation exceptions.
     *
     * @var array
     */
    protected $dontFlash = [
        'password',
        'password_confirmation',
    ];

    /**
     * Report or log an exception.
     *
     * @param  \Throwable  $exception
     * @return void
     *
     * @throws \Exception
     */
    public function report(Throwable $exception)
    {
        parent::report($exception);
    }

    /**
     * Render an exception into an HTTP response.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Throwable  $exception
     * @return \Symfony\Component\HttpFoundation\Response
     *
     * @throws \Throwable
     */
    public function render($request, Throwable $exception)
    {

       //  if ($exception instanceof \Illuminate\Session\TokenMismatchException) {
       //      return redirect()->back();
       //  }
       //  if(($exception instanceof InvalidArgumentException) || str_contains($exception->getFile(), 'Illuminate/View/FileViewFinder')){
       //     return redirect()->route('404');
       // }
        if($request->is('api/*')) {
            if ($exception instanceof MethodNotAllowedHttpException) {
                return response()->json(['status'=>false,'status_code'=>'405','message'=>'Method is not allowed for the requested route','data'=>(object)[],'error'=>[]], 200);
            }
            if ($exception instanceof ModelNotFoundException && $request->wantsJson()) {
                return response()->json(['status'=>false,'status_code'=>'404','message'=>'Url not found','data'=>(object)[],'error'=>[]], 200);
            }
            // return response()->json(['status'=>false,'status_code'=>'404','message'=>'Url not found','data'=>(object)[],'error'=>[]], 200); 
        }
        return parent::render($request, $exception);
    }
}
