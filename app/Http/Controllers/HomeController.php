<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Helpers\ApiHelper;
use App\Models\User;
use App\Models\Property;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    // public function __construct()
    // {
    //     $this->middleware('auth');
    // }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $product_name='Test12';
        $txn_price = 10;
        $txn_qty = 1;
        $total_price= 10;
        $txn_name = "Test12";
        $address= "Salmiya";
        $postal = '452001';
        $currencycode= 414;
        $udf1='1';
        $udf5='5';

        $payment_url = $this->payment_process($product_name, $txn_price, $txn_qty, $total_price, $txn_name, '', '', 414, 'USA',$udf1,$udf5);
        // if ($payment_method == 2 || $payment_method == '2') {
        //     $payment_url = $this->payment_process($event_info->event_title, $txn_price, $txn_qty, $total_price, $txn_name, '', '', 414, 'USA',$udf1,$udf2,$udf3,$udf4,$udf5);
        // } else {
        //     $transaction_orderinfo = $eventOrderObj->order_id;
        //     $purchase_amount = $total_price;
        //     $payment_url = $this->card_process($transaction_orderinfo, $purchase_amount);
        // }
        // //return view('home');
    }




    public function payment_process($product,$price,$qty,$total,$name,$address,$postal,$currencycode,$langid,$udf1,$udf5) {
        $udf1 = '';
        /* Getting Transaction Amount */
        $price = $price;
        $qty = $qty;
        //$TranAmount = $price * $qty;
        $TranAmount = $total;

        /* Generating a unique track id for each transaction.*/
        $TranTrackid=mt_rand().$udf5;

        /* to pass Tranportal ID provided by the bank to merchant. */
        /* Test $TranportalId="203001";*/
        $TranportalId="276801";
        $ReqTranportalId="id=".$TranportalId;

        /* to pass Tranportal password provided by the bank to merchant. */
        //$ReqTranportalPassword="5161!@De";
        /* Test $ReqTranportalPassword="password=203001pg";*/
        $ReqTranportalPassword="password=QtMm25jH";

        /* Transaction Amount that will be send to payment gateway by merchant */
        $ReqAmount="amt=".$TranAmount;

        /* To pass the merchant track id */
        $ReqTrackId="trackid=".$TranTrackid;

        /* Currency code of the transaction. */
        $ReqCurrency="currencycode=414";

        /* Transaction language, THIS MUST BE ALWAYS USA OR AR. */
        $ReqLangid="langid=USA";


        /* Action Code of the transaction */
        $ReqAction="action=1";


        /* Response URL */
        $ResponseUrl=url('/')."/user/get_handler_response";
        $ReqResponseUrl="responseURL=".$ResponseUrl;


        /* Error URL */ 

        $ErrorUrl=url('/')."/user/txn_result";
        $ReqErrorUrl="errorURL=".$ErrorUrl;


        /* User Defined Fileds */
        $ReqUdf1="udf1=".$udf1;
       
        $ReqUdf5="udf5=".$udf5;


        /* Now merchant sets all the inputs in one string for encrypt and then passing to the Payment Gateway URL */        
        $param=$ReqTranportalId."&".$ReqTranportalPassword."&".$ReqAction."&".$ReqLangid."&".$ReqCurrency."&".$ReqAmount."&".$ReqResponseUrl."&".$ReqErrorUrl."&".$ReqTrackId."&".$ReqUdf1."&".$ReqUdf5;

        //==============================Encryption LOGIC CODE START===============================================================================
        
              
            /* Test $termResourceKey="2TD8EZ00KEX7332V";*/
            $termResourceKey="E6D79119FDEWB38Q";
            $param=encryptAES($param,$termResourceKey)."&tranportalId=".$TranportalId."&responseURL=".$ResponseUrl."&errorURL=".$ErrorUrl;

        //==============================Encryption LOGIC CODE End=================================================================================

        /* 
        *********UNCOMMENT THE BELOW REDIRECTION CODE TO CONNECT TO EITHER TEST OR PRODUCTION*********
        */
        /* Test return "https://kpaytest.com.kw/kpg/PaymentHTTP.htm?param=paymentInit"."&trandata=".$param;*/
        return "https://kpay.com.kw/kpg/PaymentHTTP.htm?param=paymentInit"."&trandata=".$param;
        /*header("Location: https://kpaytest.com.kw/kpg/PaymentHTTP.htm?param=paymentInit"."&trandata=".$param);*/ /* send request and redirect to TEST */
        //header("Location: https://www.kpay.com.kw/kpg/PaymentHTTP.htm?param=paymentInit"."&trandata=".$param); /* send request and redirect to PRODUCTION */
        exit();
    }

    public function get_handler_response(Request $request) {
        /* BELOW ARE LIST OF PARAMETERS THAT WILL BE RECEIVED BY MERCHANT FROM PAYMENT GATEWAY */
        /*Variable Declaration*/
        //=========================================================================================
        $ResErrorText= (!empty($_REQUEST['ErrorText']) ? $_REQUEST['ErrorText'] : '');      //Error Text/message
        $ResPaymentId = (!empty($_REQUEST['paymentid']) ? $_REQUEST['paymentid'] : '');     //Payment Id
        $ResTrackID = (!empty($_REQUEST['trackid']) ? $_REQUEST['trackid'] : '');         //Merchant Track ID
        $ResErrorNo = (!empty($_REQUEST['Error']) ? $_REQUEST['Error'] : '');           //Error Number
        $ResResult =  (!empty($_REQUEST['result']) ? $_REQUEST['result'] : '');          //Transaction Result
        $ResPosdate = (!empty($_REQUEST['postdate']) ? $_REQUEST['postdate'] : '');        //Postdate
        $ResTranId = (!empty($_REQUEST['tranid']) ? $_REQUEST['tranid'] : '');           //Transaction ID
        $ResAuth = (!empty($_REQUEST['auth']) ? $_REQUEST['auth'] : '');               //Auth Code     
        $ResAVR = (!empty($_REQUEST['avr']) ? $_REQUEST['avr'] : '');                 //TRANSACTION avr                   
        $ResRef = (!empty($_REQUEST['ref']) ? $_REQUEST['ref'] : '');                 //Reference Number also called Seq Number
        $ResAmount = (!empty($_REQUEST['amt']) ? $_REQUEST['amt'] : '');              //Transaction Amount
        $Resudf1 = (!empty($_REQUEST['udf1']) ? $_REQUEST['udf1'] : '');               //UDF1
        $Resudf2 = (!empty($_REQUEST['udf2']) ? $_REQUEST['udf2'] : '');               //UDF2
        $Resudf3 = (!empty($_REQUEST['udf3']) ? $_REQUEST['udf3'] : '');               //UDF3
        $Resudf4 = (!empty($_REQUEST['udf4']) ? $_REQUEST['udf4'] : '');               //UDF4
        $Resudf5 = (!empty($_REQUEST['udf5']) ? $_REQUEST['udf5'] : '');               //UDF5
        
        //Below Terminal resource Key is used to decrypt the response sent from Payment Gateway.
        /* Test $termResourceKey="2TD8EZ00KEX7332V";*/
        $termResourceKey="E6D79119FDEWB38Q";
        
        
        /* Merchant (ME) checks, if error number is NOT present,then go for Encryption using required parameters */
        /* NOTE - MERCHANT MUST LOG THE RESPONSE RECEIVED IN LOGS AS PER BEST PRACTICE */   
        if($ResErrorText==null && $ResErrorNo==null)
        {
        
            /*IMPORTANT NOTE - MERCHANT SHOULD UPDATE 
                        TRANACTION PAYMENT STATUS IN MERCHANT DATABASE AT THIS POSITION 
                        AND THEN REDIRECT CUSTOMER ON RESULT PAGE*/
            $ResTranData= $_REQUEST['trandata'];
            if($ResTranData !=null)
            {
            //Decryption logice starts
            $decrytedData=txn_decrypt($ResTranData,$termResourceKey);
            //header("Location: https://where2goo.com/test_version/result.php?".$decrytedData);

            $redirect_url = "/user/txn_result?".$decrytedData;
            return redirect($redirect_url);
                    exit();
            }
        }
        else{
            /*header("Location: https://where2goo.com/test_version/result.php?"."Error=".$ResErrorNo."&ErrorText=".$ResErrorText."&trackid=".$ResTrackID."&amt=".$ResAmount."&paymentid="+$ResPaymentId);*/

            $redirect_url = "/user/txn_result?"."Error=".$ResErrorNo."&ErrorText=".$ResErrorText."&trackid=".$ResTrackID."&amt=".$ResAmount."&paymentid=".$ResPaymentId;
            return redirect($redirect_url);
            exit();
        }
    }

    public function txn_result(Request $request) {
        $result = isset($_GET['result']) ? $_GET['result'] : '';
        $trackid = isset($_GET['trackid']) ? $_GET['trackid'] : '';
        $PaymentID = isset($_GET['paymentid']) ? $_GET['paymentid'] : '';
        $ref = isset($_GET['ref']) ? $_GET['ref'] : '';
        $tranid = isset($_GET['tranid']) ? $_GET['tranid'] : '';
        $amount = isset($_GET['amt']) ? $_GET['amt'] : '';
        $trx_error = isset($_GET['Error']) ? $_GET['Error'] : '';
        $trx_errortext = isset($_GET['ErrorText']) ? $_GET['ErrorText'] : '';
        $postdate = isset($_GET['postdate']) ? $_GET['postdate'] : '';
        $auth = isset($_GET['auth']) ? $_GET['auth'] : '';
        $udf1 = isset($_GET['udf1']) ? $_GET['udf1'] : '';
        $udf2 = isset($_GET['udf2']) ? $_GET['udf2'] : '';
        $udf3 = isset($_GET['udf3']) ? $_GET['udf3'] : '';
        $udf4 = isset($_GET['udf4']) ? $_GET['udf4'] : '';
        $udf5 = isset($_GET['udf5']) ? $_GET['udf5'] : '';

        $order_id = $udf5;
        if($trx_error != null || $trx_errortext != null || $result != 'CAPTURED'){ 
            if (!empty($order_id)) {
                if (!empty($trx_error) || !empty($trx_errortext)) {
                    Session::flash('error', $trx_error.' - '.$trx_errortext);
                } else {
                    Session::flash('error', 'Sorry! Your payment could not be processed.<br>Payment service declined your account. Please check account detail and balance.');
                }
            } else {
                Session::flash('error', $trx_error.' - '.$trx_errortext);
                return redirect('/home');
            }

        } else {
            Session::flash('message', 'Order has been genrated successfully!');
        } 
        return redirect('/user/order_detail/'.base64_encode($order_id));
    }

    public function MyFatoorah(Request $request) {
        $username='demoApiuser@myfatoorah.com';
        $password='Mf@12345678';
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL,'https://apidemo.myfatoorah.com/Token');
        curl_setopt($curl, CURLOPT_POST, 1);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query(array('grant_type' => 'password','username' => $username,'password' =>$password)));
        $result = curl_exec($curl);
        $info = curl_getinfo($curl);
        curl_close($curl);
        $json = json_decode($result, true);
        if(isset($json['access_token']) && !empty($json['access_token'])){

            $access_token= $json['access_token'];

        }else{

            $access_token='';

        }
        if(isset($json['token_type']) && !empty($json['token_type'])){

            $token_type= $json['token_type'];

        }else{

            $token_type='';
        }

        if(isset($json['access_token']) && !empty($json['access_token'])){
            echo "Token Generated Successfully.<br>";

            $t= time();
            $CustomerName = "Ganesh Dhamande";
            $CustomerBlock = "Block";
            $CustomerStreet = "Street";
            $CustomerHouseBuildingNo = "Building no";
            $CustomerCivilId = "123456789124";
            $CustomerAddress = "Salmiya Kuwait";
            $CustomerMobile = "1234567890";
            $CustomerEmail = "test@gmail.com";
            $CallBackUrl =  "https://onlinelab.webzproject.com/";
            $Language =  "1";//1 =arbic and 2 =en
            $ErrorUrl =  "https://onlinelab.webzproject.com/";

            $post_string = '{
                "InvoiceValue": 10,
                "CustomerName": "'.$CustomerName.'",
                "CustomerAddress": "Payment Address",
                "CustomerReference": "'.$t.'",
                "DisplayCurrencyIsoAlpha": "KWD",
                "CountryCodeId": "+965",
                "CustomerMobile": "'.$CustomerMobile.'",
                "CustomerEmail": "'.$CustomerEmail.'",
                "CallBackUrl":  "'.$CallBackUrl.'",
                "Language": "'.$Language.'",
                "ExpireDate": "2022-12-31T13:30:17.812Z",
                "ApiCustomFileds": "weight=10,size=L,lenght=170",
                "ErrorUrl": "'.$ErrorUrl.'"
            }';
            $soap_do     = curl_init();
            curl_setopt($soap_do, CURLOPT_URL, "https://apidemo.myfatoorah.com/ApiInvoices/CreateInvoiceIso");
            curl_setopt($soap_do, CURLOPT_CONNECTTIMEOUT, 10);
            curl_setopt($soap_do, CURLOPT_TIMEOUT, 10);
            curl_setopt($soap_do, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($soap_do, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($soap_do, CURLOPT_SSL_VERIFYHOST, false);
            curl_setopt($soap_do, CURLOPT_POST, true);
            curl_setopt($soap_do, CURLOPT_POSTFIELDS, $post_string);
            curl_setopt($soap_do, CURLOPT_HTTPHEADER, array('Content-Type: application/json; charset=utf-8','Content-Length: ' . strlen($post_string),  'Accept: application/json','Authorization: Bearer '.$access_token));
            $result1 = curl_exec($soap_do);
            $err    = curl_error($soap_do);
            $json1= json_decode($result1,true);
            $RedirectUrl= $json1['RedirectUrl'];
            $ref_Ex=explode('/',$RedirectUrl);
            $referenceId =  $ref_Ex[4];
            curl_close($soap_do);
            echo $RedirectUrl;
            die;
        }else{
            //print_r($json);
            print_r("Error: ".$json['error']."<br>Description: ".$json['error_description']);
        }
    }

    public function getResponce(Request $request){
        if(isset($_GET['paymentId'])){
            $id=$_GET['paymentId'];
            $curl = curl_init();
            curl_setopt($curl, CURLOPT_URL,'https://apidemo.myfatoorah.com/Token');
            curl_setopt($curl, CURLOPT_POST, 1);
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
            curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query(array('grant_type' => 'password','username' => 'demoApiuser@myfatoorah.com','password' => 'Mf@12345678')));
            $result = curl_exec($curl);
            $error= curl_error($curl);
            $info = curl_getinfo($curl);
            curl_close($curl);
            $json = json_decode($result, true);
            $access_token= $json['access_token'];
            $token_type= $json['token_type'];
            

            $url = 'https://apidemo.myfatoorah.com/ApiInvoices/Transaction/'.$id;
            $soap_do1 = curl_init();
            curl_setopt($soap_do1, CURLOPT_URL,$url );
            curl_setopt($soap_do1, CURLOPT_CONNECTTIMEOUT, 10);
            curl_setopt($soap_do1, CURLOPT_TIMEOUT, 10);
            curl_setopt($soap_do1, CURLOPT_RETURNTRANSFER, true );
            curl_setopt($soap_do1, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($soap_do1, CURLOPT_SSL_VERIFYHOST, false);
            curl_setopt($soap_do1, CURLOPT_POST, false );
            curl_setopt($soap_do1, CURLOPT_POST, 0);
            curl_setopt($soap_do1, CURLOPT_HTTPGET, 1);
            curl_setopt($soap_do1, CURLOPT_HTTPHEADER, array('Content-Type: application/json; charset=utf-8', 'Accept: application/json','Authorization: Bearer '.$access_token));
            $result_in = curl_exec($soap_do1);
            $err_in = curl_error($soap_do1);
            $file_contents = htmlspecialchars(curl_exec($soap_do1));
            curl_close($soap_do1);
            $getRecorById = json_decode($result_in, true);
        }
    }
    public function smsTest()
    {
        $echo = ApiHelper::sendSMS('Saudi-mazad','Mas4_fD%','Welcome Ganesh','+966598799551','Saudi Mazad');
        echo $echo;
        die;
    }
    
    
    //Cron Functions
    public function notifi_15_min_before_auction_start(){
        //Get Todays All auctions 
        $auctions = Property::where('type','2')->where('admin_status','1')->whereDate('start_date', '=', date('Y-m-d'))->get();
        if(count($auctions) > 0){
            foreach($auctions as $auction){
                $aution_time = $auction->start_time;
                $date = new \DateTime("now", new \DateTimeZone('Asia/Kuwait') );
                $current_time = $date->format('H:i');
                
                $difference = round(abs(strtotime($aution_time) - strtotime($current_time)) / 60,0);
                if($difference == '15'){
                    $notification = new Api\NotificationController();
                    $notification->FifteenMinBeforeAuctionNotification($auction);
                }
            }
        }
    }
    public function auction_started(){
        //Get Todays All auctions 
        $auctions = Property::where('type','2')->where('admin_status','1')->whereDate('start_date', '=', date('Y-m-d'))->get();
        if(count($auctions) > 0){
            foreach($auctions as $auction){
                $aution_time = $auction->start_time;
                $date = new \DateTime("now", new \DateTimeZone('Asia/Kuwait') );
                $current_time = $date->format('H:i');
                
                $difference = round(abs(strtotime($aution_time) - strtotime($current_time)) / 60,0);
                if($difference == '0'){
                    $notification = new Api\NotificationController();
                    $notification->AuctionStartedNotification($auction);
                }
            }
        }
    }
    public function notifi_15_min_before_auction_end(){
        //Get Todays All auctions 
        $auctions = Property::where('type','2')->where('admin_status','1')->whereDate('end_date', '=', date('Y-m-d'))->get();
        if(count($auctions) > 0){
            foreach($auctions as $auction){
                $aution_time = $auction->end_time;
                $date = new \DateTime("now", new \DateTimeZone('Asia/Kuwait') );
                $current_time = $date->format('H:i');
                
                echo $difference = round(abs(strtotime($aution_time) - strtotime($current_time)) / 60,0);
                if($difference == '15'){
                    $notification = new Api\NotificationController();
                    $notification->FifteenMinBeforeAuctionEndNotification($auction);
                }
            }
        }
    }
    
    
    
    
}
