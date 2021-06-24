<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use App\Mail\SendMailable;

class EmailController extends Controller
{
    public function sendEmail()
    {
        Mail::to('mail@appdividend.com')->send(new SendMailable());
        echo 'email sent';
    }
}