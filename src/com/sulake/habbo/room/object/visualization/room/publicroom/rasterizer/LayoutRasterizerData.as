package com.sulake.habbo.room.object.visualization.room.publicroom.rasterizer
{
   public class LayoutRasterizerData
   {
       
      
      private var var_1147:XMLList;
      
      public function LayoutRasterizerData(param1:XML)
      {
         super();
         var_1147 = param1.elements.element;
      }
      
      public function get elementList() : XMLList
      {
         return var_1147;
      }
      
      public function dispose() : void
      {
         var_1147 = null;
      }
   }
}
