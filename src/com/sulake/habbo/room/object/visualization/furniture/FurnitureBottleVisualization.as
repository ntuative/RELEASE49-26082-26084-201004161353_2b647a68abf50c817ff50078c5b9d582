package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1082:int = -1;
      
      private static const const_762:int = 20;
      
      private static const const_494:int = 9;
       
      
      private var var_627:Boolean = false;
      
      private var var_222:Array;
      
      public function FurnitureBottleVisualization()
      {
         var_222 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            var_627 = true;
            var_222 = new Array();
            var_222.push(const_1082);
            return;
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(var_627)
            {
               var_627 = false;
               var_222 = new Array();
               var_222.push(const_762);
               var_222.push(const_494 + param1);
               var_222.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(0))
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
