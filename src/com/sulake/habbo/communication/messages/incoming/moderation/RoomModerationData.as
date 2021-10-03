package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_112:RoomData;
      
      private var _disposed:Boolean;
      
      private var var_1684:int;
      
      private var var_394:int;
      
      private var var_683:RoomData;
      
      private var var_1634:int;
      
      private var _ownerName:String;
      
      private var var_2125:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         var_394 = param1.readInteger();
         var_1684 = param1.readInteger();
         var_2125 = param1.readBoolean();
         var_1634 = param1.readInteger();
         _ownerName = param1.readString();
         var_112 = new RoomData(param1);
         var_683 = new RoomData(param1);
      }
      
      public function get userCount() : int
      {
         return var_1684;
      }
      
      public function get event() : RoomData
      {
         return var_683;
      }
      
      public function get room() : RoomData
      {
         return var_112;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_112 != null)
         {
            var_112.dispose();
            var_112 = null;
         }
         if(var_683 != null)
         {
            var_683.dispose();
            var_683 = null;
         }
      }
      
      public function get flatId() : int
      {
         return var_394;
      }
      
      public function get ownerId() : int
      {
         return var_1634;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return var_2125;
      }
   }
}
