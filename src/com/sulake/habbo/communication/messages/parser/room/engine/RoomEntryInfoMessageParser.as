package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1915:int;
      
      private var var_395:Boolean;
      
      private var var_1916:Boolean;
      
      private var var_834:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1916 = param1.readBoolean();
         if(var_1916)
         {
            var_1915 = param1.readInteger();
            var_395 = param1.readBoolean();
         }
         else
         {
            var_834 = new PublicRoomShortData(param1);
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         if(var_834 != null)
         {
            var_834.dispose();
            var_834 = null;
         }
         return true;
      }
      
      public function get guestRoomId() : int
      {
         return var_1915;
      }
      
      public function get owner() : Boolean
      {
         return var_395;
      }
      
      public function get guestRoom() : Boolean
      {
         return var_1916;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return var_834;
      }
   }
}
