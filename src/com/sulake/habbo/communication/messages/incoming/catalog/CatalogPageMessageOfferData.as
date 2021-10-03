package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_899:Array;
      
      private var var_897:int;
      
      private var var_1314:String;
      
      private var _offerId:int;
      
      private var var_896:int;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1314 = param1.readString();
         var_897 = param1.readInteger();
         var_896 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var_899 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_899.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
      }
      
      public function get products() : Array
      {
         return var_899;
      }
      
      public function get priceInCredits() : int
      {
         return var_897;
      }
      
      public function get localizationId() : String
      {
         return var_1314;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_896;
      }
   }
}
