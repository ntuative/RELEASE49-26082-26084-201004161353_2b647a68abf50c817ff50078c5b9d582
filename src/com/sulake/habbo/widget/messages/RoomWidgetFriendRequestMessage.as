package com.sulake.habbo.widget.messages
{
   public class RoomWidgetFriendRequestMessage extends RoomWidgetMessage
   {
      
      public static const const_733:String = "RWFRM_ACCEPT";
      
      public static const const_688:String = "RWFRM_DECLINE";
       
      
      private var var_1060:int = 0;
      
      public function RoomWidgetFriendRequestMessage(param1:String, param2:int = 0)
      {
         super(param1);
         var_1060 = param2;
      }
      
      public function get requestId() : int
      {
         return var_1060;
      }
   }
}
