package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var var_1211:int;
      
      private var var_1865:int = -1;
      
      private var var_377:int;
      
      private var var_1662:int;
      
      private var var_1867:int;
      
      private var _offerId:int;
      
      private var var_1210:int;
      
      private var var_1866:int;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int = -1)
      {
         super();
         _offerId = param1;
         var_1866 = param2;
         var_1867 = param3;
         var_1211 = param4;
         var_377 = param5;
         var_1865 = param6;
         var_1662 = param7;
         var_1210 = param8;
      }
      
      public function get status() : int
      {
         return var_377;
      }
      
      public function get price() : int
      {
         return var_1211;
      }
      
      public function get timeLeftMinutes() : int
      {
         return var_1865;
      }
      
      public function get offerCount() : int
      {
         return var_1210;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get furniType() : int
      {
         return var_1867;
      }
      
      public function get averagePrice() : int
      {
         return var_1662;
      }
      
      public function get furniId() : int
      {
         return var_1866;
      }
   }
}
