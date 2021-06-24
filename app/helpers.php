<?php 

function user_check_access($section, $role_id){
	


}

function testhelper() {
	return 'Hello, this is helper test.';
}

//AES Encryption Method Starts
function encryptAES($str,$key) {
	$str = pkcs5_pad($str); 
	$encrypted = openssl_encrypt($str, 'AES-128-CBC', $key, OPENSSL_ZERO_PADDING, $key);
	$encrypted = base64_decode($encrypted);
	$encrypted=unpack('C*', ($encrypted));
  	$encrypted=byteArray2Hex($encrypted);
  	$encrypted = urlencode($encrypted);
  	return $encrypted;
}

function pkcs5_pad ($text) {
	$blocksize = 16;
	$pad = $blocksize - (strlen($text) % $blocksize);
	return $text . str_repeat(chr($pad), $pad);
}

function byteArray2Hex($byteArray) {
  	$chars = array_map("chr", $byteArray);
  	$bin = join($chars);
  	return bin2hex($bin);
}

//Decryption Method for AES Algorithm Starts

	function txn_decrypt($code,$key) { 
	  $code =  hex2ByteArray(trim($code));
	  $code=byteArray2String($code);
	  $iv = $key; 
	  $code = base64_encode($code);
	  $decrypted = openssl_decrypt($code, 'AES-128-CBC', $key, OPENSSL_ZERO_PADDING, $iv);
	  return pkcs5_unpad($decrypted);
	}
    
    function hex2ByteArray($hexString) {
  $string = hex2bin($hexString);
  return unpack('C*', $string);
}


function byteArray2String($byteArray) {
  $chars = array_map("chr", $byteArray);
  return join($chars);
}


 function pkcs5_unpad($text) {
	  $pad = ord($text{strlen($text)-1});
	  if ($pad > strlen($text)) {
	      return false;	
	  }
	  if (strspn($text, chr($pad), strlen($text) - $pad) != $pad) {
	      return false;
	  }
	  return substr($text, 0, -1 * $pad);
    }



function getResultDescription($responseCode) {
    switch ($responseCode) {
      case "0": $result = "Transaction Successful"; break;
      case "1": $result = "Transaction Declined"; break;
      case "2": $result = "Bank Declined Transaction"; break;
      case "3": $result = "No Reply from Bank"; break;
      case "4": $result = "Expired Card"; break;
      case "5": $result = "Insufficient Funds"; break;
      case "6": $result = "Error Communicating with Bank"; break;
      case "7": $result = "Payment Server detected an error"; break;
      case "8": $result = "Transaction Type Not Supported"; break;
      case "9": $result = "Bank declined transaction (Do not contact Bank)"; break;
      case "A": $result = "Transaction Aborted"; break;
      case "B": $result = "Transaction Declined - Contact the Bank"; break;
      case "C": $result = "Transaction Cancelled"; break;
      case "D": $result = "Deferred transaction has been received and is awaiting processing"; break;
      case "E": $result = "Transaction Declined - Refer to card issuer"; break;
case "F": $result = "3-D Secure Authentication failed"; break;
      case "I": $result = "Card Security Code verification failed"; break;
      case "L": $result = "Shopping Transaction Locked (Please try the transaction again later)"; break;
      case "M": $result = "Transaction Submitted (No response from acquirer)"; break;
case "N": $result = "Cardholder is not enrolled in Authentication scheme"; break;
      case "P": $result = "Transaction has been received by the Payment Adaptor and is being processed"; break;
      case "R": $result = "Transaction was not processed - Reached limit of retry attempts allowed"; break;
      case "S": $result = "Duplicate SessionID"; break;
      case "T": $result = "Address Verification Failed"; break;
      case "U": $result = "Card Security Code Failed"; break;
      case "V": $result = "Address Verification and Card Security Code Failed"; break;
case "?": $result = "Transaction status is unknown"; break;
      default: $result = "Unable to be determined"; break;
    }
    return $result;
}

function getCSCResultDescription($responseCode) {
    switch ($responseCode) {
      case "M": $result = "Exact code match"; break;
      case "S": $result = "Merchant has indicated that CSC is not present on the card (MOTO situation)"; break;
      case "P": $result = "Code not processed"; break;
      case "U": $result = "Card issuer is not registered and/or certified"; break;
      case "N": $result = "Code invalid or not matched"; break;
      default: $result = "Unable to be determined"; break;
    }
    return $result;
}    