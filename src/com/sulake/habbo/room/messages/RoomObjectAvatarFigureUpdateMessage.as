package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1798:String;
      
      private var var_294:String;
      
      private var var_628:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         var_294 = param1;
         var_628 = param2;
         var_1798 = param3;
      }
      
      public function get race() : String
      {
         return var_1798;
      }
      
      public function get figure() : String
      {
         return var_294;
      }
      
      public function get gender() : String
      {
         return var_628;
      }
   }
}
