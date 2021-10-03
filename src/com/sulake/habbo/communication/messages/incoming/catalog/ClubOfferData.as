package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var var_1905:int;
      
      private var var_1211:int;
      
      private var var_1902:int;
      
      private var _offerId:int;
      
      private var var_1903:int;
      
      private var var_1901:int;
      
      private var var_1907:Boolean;
      
      private var var_1906:int;
      
      private var var_1904:Boolean;
      
      private var var_1252:String;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1252 = param1.readString();
         var_1211 = param1.readInteger();
         var_1904 = param1.readBoolean();
         var_1907 = param1.readBoolean();
         var_1902 = param1.readInteger();
         var_1906 = param1.readInteger();
         var_1903 = param1.readInteger();
         var_1905 = param1.readInteger();
         var_1901 = param1.readInteger();
      }
      
      public function get year() : int
      {
         return var_1903;
      }
      
      public function get month() : int
      {
         return var_1905;
      }
      
      public function get price() : int
      {
         return var_1211;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get periods() : int
      {
         return var_1902;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return var_1906;
      }
      
      public function get upgrade() : Boolean
      {
         return var_1904;
      }
      
      public function get day() : int
      {
         return var_1901;
      }
      
      public function get vip() : Boolean
      {
         return var_1907;
      }
      
      public function get productCode() : String
      {
         return var_1252;
      }
   }
}
