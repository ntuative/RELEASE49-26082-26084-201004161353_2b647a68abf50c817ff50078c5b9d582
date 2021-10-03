package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_1656:Number;
      
      private var var_551:Number = 0;
      
      private var var_1657:Number;
      
      private var var_552:Number;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         var_1656 = param1;
         var_1657 = param2;
      }
      
      public function update() : void
      {
         var_552 += var_1657;
         var_551 += var_552;
         if(var_551 > 0)
         {
            var_551 = 0;
            var_552 = var_1656 * -1 * var_552;
         }
      }
      
      public function reset(param1:int) : void
      {
         var_552 = param1;
         var_551 = 0;
      }
      
      public function get location() : Number
      {
         return var_551;
      }
   }
}
