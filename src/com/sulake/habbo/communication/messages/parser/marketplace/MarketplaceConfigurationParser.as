package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1652:int;
      
      private var var_1398:int;
      
      private var var_1654:int;
      
      private var var_1653:int;
      
      private var var_1649:int;
      
      private var var_1399:int;
      
      private var var_1648:int;
      
      private var var_1367:Boolean;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get offerMaxPrice() : int
      {
         return var_1652;
      }
      
      public function get tokenBatchPrice() : int
      {
         return var_1398;
      }
      
      public function get averagePricePeriod() : int
      {
         return var_1648;
      }
      
      public function get offerMinPrice() : int
      {
         return var_1653;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get expirationHours() : int
      {
         return var_1649;
      }
      
      public function get tokenBatchSize() : int
      {
         return var_1399;
      }
      
      public function get commission() : int
      {
         return var_1654;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1367 = param1.readBoolean();
         var_1654 = param1.readInteger();
         var_1398 = param1.readInteger();
         var_1399 = param1.readInteger();
         var_1653 = param1.readInteger();
         var_1652 = param1.readInteger();
         var_1649 = param1.readInteger();
         var_1648 = param1.readInteger();
         return true;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1367;
      }
   }
}
