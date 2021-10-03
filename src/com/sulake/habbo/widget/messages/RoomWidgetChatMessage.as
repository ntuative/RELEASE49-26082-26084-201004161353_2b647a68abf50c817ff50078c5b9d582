package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatMessage extends RoomWidgetMessage
   {
      
      public static const const_122:int = 0;
      
      public static const const_116:int = 1;
      
      public static const const_107:int = 2;
      
      public static const const_526:String = "RWCM_MESSAGE_CHAT";
       
      
      private var var_1351:int = 0;
      
      private var var_2008:String = "";
      
      private var var_189:String = "";
      
      public function RoomWidgetChatMessage(param1:String, param2:String, param3:int = 0, param4:String = "")
      {
         super(param1);
         var_189 = param2;
         var_1351 = param3;
         var_2008 = param4;
      }
      
      public function get recipientName() : String
      {
         return var_2008;
      }
      
      public function get chatType() : int
      {
         return var_1351;
      }
      
      public function get text() : String
      {
         return var_189;
      }
   }
}
