package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CanCreateRoomMessageParser implements IMessageParser
   {
      
      public static const const_1623:int = 0;
      
      public static const const_1525:int = 1;
       
      
      private var var_2311:int;
      
      private var var_1158:int;
      
      public function CanCreateRoomMessageParser()
      {
         super();
      }
      
      public function get roomLimit() : int
      {
         return var_2311;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1158 = param1.readInteger();
         this.var_2311 = param1.readInteger();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get resultCode() : int
      {
         return var_1158;
      }
   }
}
