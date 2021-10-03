package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1354:BigInteger;
      
      private var var_581:BigInteger;
      
      private var var_1589:BigInteger;
      
      private var var_1588:BigInteger;
      
      private var var_2220:BigInteger;
      
      private var var_2018:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         var_1354 = param1;
         var_1589 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return var_2220.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         var_1588 = new BigInteger();
         var_1588.fromRadix(param1,param2);
         var_2220 = var_1588.modPow(var_581,var_1354);
         return getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return var_2018.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + var_1354.toString() + ",generator: " + var_1589.toString() + ",secret: " + param1);
         var_581 = new BigInteger();
         var_581.fromRadix(param1,param2);
         var_2018 = var_1589.modPow(var_581,var_1354);
         return true;
      }
   }
}
