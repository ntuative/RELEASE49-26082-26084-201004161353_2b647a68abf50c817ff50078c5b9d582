package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_963:String;
      
      private var var_1617:int;
      
      private var var_1691:int;
      
      private var var_1409:int;
      
      private var var_1688:int;
      
      private var _category:int;
      
      private var var_2372:int;
      
      private var var_1685:int;
      
      private var var_1690:int;
      
      private var var_1686:int;
      
      private var var_1687:int;
      
      private var var_1689:Boolean;
      
      private var var_1396:String;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         var_1617 = param1;
         var_963 = param2;
         var_1691 = param3;
         var_1686 = param4;
         _category = param5;
         var_1396 = param6;
         var_1409 = param7;
         var_1690 = param8;
         var_1685 = param9;
         var_1687 = param10;
         var_1688 = param11;
         var_1689 = param12;
      }
      
      public function get itemTypeID() : int
      {
         return var_1686;
      }
      
      public function get extra() : int
      {
         return var_1409;
      }
      
      public function get stuffData() : String
      {
         return var_1396;
      }
      
      public function get groupable() : Boolean
      {
         return var_1689;
      }
      
      public function get creationMonth() : int
      {
         return var_1687;
      }
      
      public function get roomItemID() : int
      {
         return var_1691;
      }
      
      public function get itemType() : String
      {
         return var_963;
      }
      
      public function get itemID() : int
      {
         return var_1617;
      }
      
      public function get songID() : int
      {
         return var_1409;
      }
      
      public function get timeToExpiration() : int
      {
         return var_1690;
      }
      
      public function get creationYear() : int
      {
         return var_1688;
      }
      
      public function get creationDay() : int
      {
         return var_1685;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
