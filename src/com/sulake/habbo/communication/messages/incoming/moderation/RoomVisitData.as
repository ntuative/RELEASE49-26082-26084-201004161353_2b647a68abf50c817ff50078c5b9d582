package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_733:String;
      
      private var var_1920:int;
      
      private var var_1400:Boolean;
      
      private var _roomId:int;
      
      private var var_1921:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         var_1400 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_733 = param1.readString();
         var_1921 = param1.readInteger();
         var_1920 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return var_1400;
      }
      
      public function get roomName() : String
      {
         return var_733;
      }
      
      public function get enterMinute() : int
      {
         return var_1920;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get enterHour() : int
      {
         return var_1921;
      }
   }
}
