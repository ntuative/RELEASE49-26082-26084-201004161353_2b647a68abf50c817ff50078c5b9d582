package com.sulake.core.communication.messages
{
   import com.sulake.core.communication.protocol.IProtocolDecoder;
   import com.sulake.core.communication.util.Short;
   import flash.utils.ByteArray;
   
   public class MessageDataWrapper implements IMessageDataWrapper
   {
       
      
      private var var_885:IProtocolDecoder;
      
      private var _data:ByteArray;
      
      public function MessageDataWrapper(param1:ByteArray, param2:IProtocolDecoder)
      {
         super();
         _data = param1;
         var_885 = param2;
      }
      
      public function readShort() : Short
      {
         return var_885.readShort(_data);
      }
      
      public function readString() : String
      {
         return var_885.readString(_data);
      }
      
      public function readInteger() : int
      {
         return var_885.readInteger(_data);
      }
      
      public function readBoolean() : Boolean
      {
         return var_885.readBoolean(_data);
      }
      
      public function get bytesAvailable() : uint
      {
         return _data.bytesAvailable;
      }
   }
}
