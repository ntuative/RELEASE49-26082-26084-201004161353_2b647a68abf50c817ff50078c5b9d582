package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FaqTextMessageParser implements IMessageParser
   {
       
      
      private var var_1254:int;
      
      private var var_1253:String;
      
      public function FaqTextMessageParser()
      {
         super();
      }
      
      public function get questionId() : int
      {
         return var_1254;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1254 = param1.readInteger();
         var_1253 = param1.readString();
         return true;
      }
      
      public function get answerText() : String
      {
         return var_1253;
      }
      
      public function flush() : Boolean
      {
         var_1254 = -1;
         var_1253 = null;
         return true;
      }
   }
}
