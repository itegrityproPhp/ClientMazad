<?php

namespace App\Helpers;

use Session;
use App;
use Carbon\Carbon;
use url;
use DateTime;

class ApiHelper {
    public static function otpGenrator($number){ 
        $generator = "1357902468"; 
        $otp = ""; 
        for ($i = 1; $i <= $number; $i++) { 
            $otp .= substr($generator, (rand()%(strlen($generator))), 1); 
        }
        return $otp; 
    }

    public static function getFromEmail(){
    	 return 'test12@gmail.com';
    }
    
    public static function getDistance($lat1, $lon1, $lat2, $lon2, $unit) {
        if (($lat1 == $lat2) && ($lon1 == $lon2)) {
            return 0;
        }
        else {
            $theta = $lon1 - $lon2;
            $dist = sin(deg2rad($lat1)) * sin(deg2rad($lat2)) +  cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * cos(deg2rad($theta));
            $dist = acos($dist);
            $dist = rad2deg($dist);
            $miles = $dist * 60 * 1.1515;
            $unit = strtoupper($unit);

            if ($unit == "K") {//Where M=Miles,K=Kilometers,N=Nautical Miles
                return ($miles * 1.609344);
            } else if ($unit == "N") {
                return ($miles * 0.8684);
            } else {
                return $miles;
            }
        }
    }
    public static function getRealDistance($lat1, $lat2, $long1, $long2){
        $url = "https://maps.googleapis.com/maps/api/distancematrix/json?origins=".$lat1.",".$long1."&destinations=".$lat2.",".$long2."&language=pl-PL&key=AIzaSyBBofzwtIf8s0-tYYwwSq3IXuewdDrpv8A";
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_PROXYPORT, 3128);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
        $response = curl_exec($ch);
        curl_close($ch);
        $response_a = json_decode($response, true);
        print_r($response_a);
        $dist = $response_a['rows'][0]['elements'][0]['distance']['text'];
        $time = $response_a['rows'][0]['elements'][0]['duration']['text'];
        return array('distance' => $dist, 'time' => $time);
    }
    //================Safa Sms==============
    public static function sendSMS($safasmsusername,$safasmspassword,$messageContent,$mobileNumber,$senderName){
        $user           = $safasmsusername;
        $password       = $safasmspassword;
        $sendername     = urlencode($senderName);
        $text           = urlencode( $messageContent);
        $to             = urlencode($mobileNumber);
        $url            = "http://www.safa-sms.com/api/sendsms.php?username=$user&password=$password&numbers=$to&message=$text&sender=$sendername&unicode=E&return=full";
        $ret = file_get_contents($url);
        return true;
        //echo nl2br($ret);
    }
    //================Safa Sms==============
    public static function getSMSBank($safasmsusername,$safasmspassword){
        $user       = $safasmsusername;
        $password   = $safasmspassword;
        $url = "http://www.safa-sms.com/api/getbalance.php?username=$user&password=$password&hangedBalance=false";
        $ret = file_get_contents($url);
        return $ret;
    }

    public static function timeElapsedString($datetime, $full = false) {
        $now = new DateTime;
        $ago = new DateTime($datetime);
        $diff = $now->diff($ago);

        $diff->w = floor($diff->d / 7);
        $diff->d -= $diff->w * 7;

        $string = array(
            'y' => 'year',
            'm' => 'month',
            'w' => 'week',
            'd' => 'day',
            'h' => 'hour',
            'i' => 'minute',
            's' => 'second',
        );
        foreach ($string as $k => &$v) {
            if ($diff->$k) {
                $v = $diff->$k . ' ' . $v . ($diff->$k > 1 ? 's' : '');
            } else {
                unset($string[$k]);
            }
        }
        if (!$full) $string = array_slice($string, 0, 1);
        return $string ? implode(', ', $string) . ' ago' : 'just now';
    }
}