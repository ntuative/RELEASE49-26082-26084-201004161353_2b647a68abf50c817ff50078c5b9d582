package com.sulake.habbo.widget.messages
{
   public class RoomWidgetFurniActionMessage extends RoomWidgetMessage
   {
      
      public static const const_265:String = "RWFAM_MOVE";
      
      public static const const_660:String = "RWFUAM_ROTATE";
      
      public static const const_595:String = "RWFAM_PICKUP";
       
      
      private var var_1866:int = 0;
      
      private var var_2177:int = 0;
      
      public function RoomWidgetFurniActionMessage(param1:String, param2:int, param3:int)
      {
         super(param1);
         var_1866 = param2;
         var_2177 = param3;
      }
      
      public function get furniId() : int
      {
         return var_1866;
      }
      
      public function get furniCategory() : int
      {
         return var_2177;
      }
   }
}
