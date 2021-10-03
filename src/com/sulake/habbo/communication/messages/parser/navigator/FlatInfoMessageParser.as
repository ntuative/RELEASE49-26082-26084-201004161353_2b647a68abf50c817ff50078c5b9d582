package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomSettingsFlatInfo;
   
   public class FlatInfoMessageParser implements IMessageParser
   {
       
      
      private var var_236:RoomSettingsFlatInfo;
      
      public function FlatInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_236 = null;
         return true;
      }
      
      public function get flatInfo() : RoomSettingsFlatInfo
      {
         return var_236;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_236 = new RoomSettingsFlatInfo();
         var_236.allowFurniMoving = param1.readInteger() == 1;
         var_236.doorMode = param1.readInteger();
         var_236.id = param1.readInteger();
         var_236.ownerName = param1.readString();
         var_236.type = param1.readString();
         var_236.name = param1.readString();
         var_236.description = param1.readString();
         var_236.showOwnerName = param1.readInteger() == 1;
         var_236.allowTrading = param1.readInteger() == 1;
         var_236.categoryAlertKey = param1.readInteger() == 1;
         return true;
      }
   }
}
