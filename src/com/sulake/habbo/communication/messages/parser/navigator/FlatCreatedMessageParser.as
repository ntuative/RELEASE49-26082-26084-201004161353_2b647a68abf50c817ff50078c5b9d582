package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FlatCreatedMessageParser implements IMessageParser
   {
       
      
      private var var_2011:String;
      
      private var var_394:int;
      
      public function FlatCreatedMessageParser()
      {
         super();
      }
      
      public function get flatName() : String
      {
         return var_2011;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_394 = param1.readInteger();
         this.var_2011 = param1.readString();
         Logger.log("FLAT CREATED: " + this.var_394 + ", " + this.var_2011);
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get flatId() : int
      {
         return var_394;
      }
   }
}
