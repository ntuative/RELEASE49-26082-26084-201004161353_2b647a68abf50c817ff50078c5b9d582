package com.sulake.habbo.room.object
{
   public class RoomPlaneMaskData
   {
       
      
      private var var_1885:Number = 0;
      
      private var var_1886:Number = 0;
      
      private var var_1887:Number = 0;
      
      private var var_1884:Number = 0;
      
      public function RoomPlaneMaskData(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         var_1886 = param1;
         var_1887 = param2;
         var_1885 = param3;
         var_1884 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return var_1886;
      }
      
      public function get leftSideLength() : Number
      {
         return var_1885;
      }
      
      public function get rightSideLoc() : Number
      {
         return var_1887;
      }
      
      public function get rightSideLength() : Number
      {
         return var_1884;
      }
   }
}
