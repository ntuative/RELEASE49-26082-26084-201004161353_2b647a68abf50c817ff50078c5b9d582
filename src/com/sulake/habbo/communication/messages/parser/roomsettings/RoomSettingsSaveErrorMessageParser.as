package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1595:int = 9;
      
      public static const const_1481:int = 4;
      
      public static const const_1469:int = 1;
      
      public static const const_1250:int = 10;
      
      public static const const_1498:int = 2;
      
      public static const const_1229:int = 7;
      
      public static const const_1305:int = 11;
      
      public static const const_1519:int = 3;
      
      public static const const_1142:int = 8;
      
      public static const const_1297:int = 5;
      
      public static const const_1589:int = 6;
      
      public static const const_1274:int = 12;
       
      
      private var var_1797:String;
      
      private var _roomId:int;
      
      private var var_1177:int;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get info() : String
      {
         return var_1797;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _roomId = param1.readInteger();
         var_1177 = param1.readInteger();
         var_1797 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1177;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
