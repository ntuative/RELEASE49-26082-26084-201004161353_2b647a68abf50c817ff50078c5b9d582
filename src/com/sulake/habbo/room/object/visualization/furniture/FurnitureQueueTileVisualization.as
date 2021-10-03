package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1046:int = 1;
      
      private static const const_1082:int = 3;
      
      private static const const_1044:int = 2;
      
      private static const const_1045:int = 15;
       
      
      private var var_789:int;
      
      private var var_222:Array;
      
      public function FurnitureQueueTileVisualization()
      {
         var_222 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1044)
         {
            var_222 = new Array();
            var_222.push(const_1046);
            var_789 = const_1045;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(var_789 > 0)
         {
            --var_789;
         }
         if(var_789 == 0)
         {
            if(false)
            {
               super.setAnimation(var_222.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
