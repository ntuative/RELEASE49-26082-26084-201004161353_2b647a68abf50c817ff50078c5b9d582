package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class AnimationFrame
   {
      
      public static const const_646:int = -1;
      
      public static const const_977:int = -1;
       
      
      private var _y:int = 0;
      
      private var var_2129:int = -1;
      
      private var var_83:int = 0;
      
      private var var_1310:int = 1;
      
      private var var_894:int = 1;
      
      private var var_2128:Boolean = false;
      
      private var var_2127:int = 0;
      
      private var _id:int = 0;
      
      public function AnimationFrame(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:int = -1, param7:int = 0)
      {
         super();
         _id = param1;
         var_83 = param2;
         _y = param3;
         var_2128 = param5;
         if(param4 < 0)
         {
            param4 = const_646;
         }
         var_894 = param4;
         var_1310 = param4;
         if(param6 >= 0)
         {
            var_2129 = param6;
            var_2127 = param7;
         }
      }
      
      public function get y() : int
      {
         return _y;
      }
      
      public function set remainingFrameRepeats(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(var_894 > 0 && param1 > var_894)
         {
            param1 = var_894;
         }
         var_1310 = param1;
      }
      
      public function get frameRepeats() : int
      {
         return var_894;
      }
      
      public function get activeSequenceOffset() : int
      {
         return var_2127;
      }
      
      public function get id() : int
      {
         if(_id >= 0)
         {
            return _id;
         }
         return -_id * Math.random();
      }
      
      public function get remainingFrameRepeats() : int
      {
         if(var_894 < 0)
         {
            return const_646;
         }
         return var_1310;
      }
      
      public function get activeSequence() : int
      {
         return var_2129;
      }
      
      public function get isLastFrame() : Boolean
      {
         return var_2128;
      }
      
      public function get x() : int
      {
         return var_83;
      }
   }
}
