package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_1492:Array;
      
      private var var_1662:int;
      
      private var var_1664:int;
      
      private var var_1660:int;
      
      private var var_1661:int;
      
      private var _dayOffsets:Array;
      
      private var var_1663:int;
      
      private var var_1493:Array;
      
      public function MarketplaceItemStats()
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
      
      public function set averagePrices(param1:Array) : void
      {
         var_1492 = param1.slice();
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         _dayOffsets = param1.slice();
      }
      
      public function get furniTypeId() : int
      {
         return var_1664;
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         var_1493 = param1.slice();
      }
      
      public function set averagePrice(param1:int) : void
      {
         var_1662 = param1;
      }
      
      public function get historyLength() : int
      {
         return var_1660;
      }
      
      public function get furniCategoryId() : int
      {
         return var_1661;
      }
      
      public function get offerCount() : int
      {
         return var_1663;
      }
      
      public function set offerCount(param1:int) : void
      {
         var_1663 = param1;
      }
      
      public function get soldAmounts() : Array
      {
         return var_1493;
      }
      
      public function get averagePrice() : int
      {
         return var_1662;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         var_1661 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         var_1660 = param1;
      }
      
      public function set furniTypeId(param1:int) : void
      {
         var_1664 = param1;
      }
   }
}
