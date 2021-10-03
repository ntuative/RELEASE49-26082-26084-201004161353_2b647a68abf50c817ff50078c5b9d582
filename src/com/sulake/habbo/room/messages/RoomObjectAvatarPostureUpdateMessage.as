package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarPostureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_2119:String;
      
      private var var_815:String;
      
      public function RoomObjectAvatarPostureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_2119 = param1;
         var_815 = param2;
      }
      
      public function get postureType() : String
      {
         return var_2119;
      }
      
      public function get parameter() : String
      {
         return var_815;
      }
   }
}
