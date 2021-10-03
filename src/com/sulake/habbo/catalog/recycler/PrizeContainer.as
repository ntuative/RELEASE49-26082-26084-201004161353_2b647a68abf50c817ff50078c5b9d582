package com.sulake.habbo.catalog.recycler
{
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   
   public class PrizeContainer extends PrizeGridItem
   {
       
      
      private var var_1791:String;
      
      private var var_2356:PrizeGridItem;
      
      private var var_1792:int;
      
      private var _furnitureData:IFurnitureData;
      
      private var var_1426:int;
      
      public function PrizeContainer(param1:String, param2:int, param3:IFurnitureData, param4:int)
      {
         super();
         var_1791 = param1;
         var_1426 = param2;
         _furnitureData = param3;
         var_1792 = param4;
      }
      
      public function get oddsLevelId() : int
      {
         return var_1792;
      }
      
      public function get productItemType() : String
      {
         return var_1791;
      }
      
      public function get title() : String
      {
         if(_furnitureData == null)
         {
            return "";
         }
         return _furnitureData.title;
      }
      
      public function get gridItem() : PrizeGridItem
      {
         return var_2356;
      }
      
      public function setIcon(param1:IRoomEngine) : void
      {
         initProductIcon(param1,_furnitureData.type,var_1426);
      }
      
      public function get productItemTypeId() : int
      {
         return var_1426;
      }
   }
}
