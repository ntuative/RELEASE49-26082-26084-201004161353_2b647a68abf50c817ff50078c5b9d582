package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_1508:String;
      
      private var var_2235:int;
      
      private var var_2233:int;
      
      private var var_2232:int;
      
      private var var_2234:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         var_2235 = param1.readInteger();
         var_2232 = param1.readInteger();
         var_2233 = param1.readInteger();
         var_2234 = param1.readString();
         var_1508 = param1.readString();
      }
      
      public function get msg() : String
      {
         return var_1508;
      }
      
      public function get hour() : int
      {
         return var_2235;
      }
      
      public function get minute() : int
      {
         return var_2232;
      }
      
      public function get chatterName() : String
      {
         return var_2234;
      }
      
      public function get chatterId() : int
      {
         return var_2233;
      }
   }
}
