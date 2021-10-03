package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_1879:int;
      
      private var var_2102:String;
      
      private var var_1883:int;
      
      private var _disposed:Boolean;
      
      private var var_2101:int;
      
      private var var_2103:String;
      
      private var var_1207:int;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         var_2103 = param1.readString();
         var_1879 = param1.readInteger();
         var_1883 = param1.readInteger();
         var_2102 = param1.readString();
         var_2101 = param1.readInteger();
         var_1207 = param1.readInteger();
      }
      
      public function get maxUsers() : int
      {
         return var_2101;
      }
      
      public function get worldId() : int
      {
         return var_1883;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
      }
      
      public function get unitPropertySet() : String
      {
         return var_2103;
      }
      
      public function get unitPort() : int
      {
         return var_1879;
      }
      
      public function get castLibs() : String
      {
         return var_2102;
      }
      
      public function get nodeId() : int
      {
         return var_1207;
      }
   }
}
