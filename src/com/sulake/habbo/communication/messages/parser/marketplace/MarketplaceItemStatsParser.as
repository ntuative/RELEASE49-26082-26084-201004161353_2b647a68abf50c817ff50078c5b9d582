package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_1492:Array;
      
      private var var_1662:int;
      
      private var var_1664:int;
      
      private var var_1661:int;
      
      private var var_1660:int;
      
      private var _dayOffsets:Array;
      
      private var var_1663:int;
      
      private var var_1493:Array;
      
      public function MarketplaceItemStatsParser()
      {
         super();
      }
      
      public function get dayOffsets() : Array
      {
         return _dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return var_1492;
      }
      
      public function get furniTypeId() : int
      {
         return var_1664;
      }
      
      public function get historyLength() : int
      {
         return var_1660;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get furniCategoryId() : int
      {
         return var_1661;
      }
      
      public function get offerCount() : int
      {
         return var_1663;
      }
      
      public function get soldAmounts() : Array
      {
         return var_1493;
      }
      
      public function get averagePrice() : int
      {
         return var_1662;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1662 = param1.readInteger();
         var_1663 = param1.readInteger();
         var_1660 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _dayOffsets = [];
         var_1492 = [];
         var_1493 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _dayOffsets.push(param1.readInteger());
            var_1492.push(param1.readInteger());
            var_1493.push(param1.readInteger());
            _loc3_++;
         }
         var_1661 = param1.readInteger();
         var_1664 = param1.readInteger();
         return true;
      }
   }
}
