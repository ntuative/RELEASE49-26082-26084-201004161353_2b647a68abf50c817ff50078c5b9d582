package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_1264:int = 2;
      
      public static const const_1490:int = 1;
       
      
      private var var_2174:int;
      
      private var var_2176:int;
      
      private var var_1971:Boolean;
      
      private var var_2172:int;
      
      private var var_1343:String;
      
      private var var_2173:Boolean;
      
      private var var_2175:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return var_2176;
      }
      
      public function get method_2() : Boolean
      {
         return var_1971;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return var_2175;
      }
      
      public function get memberPeriods() : int
      {
         return var_2172;
      }
      
      public function get productName() : String
      {
         return var_1343;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return var_2173;
      }
      
      public function get responseType() : int
      {
         return var_2174;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1343 = param1.readString();
         var_2176 = param1.readInteger();
         var_2172 = param1.readInteger();
         var_2175 = param1.readInteger();
         var_2174 = param1.readInteger();
         var_2173 = param1.readBoolean();
         var_1971 = param1.readBoolean();
         return true;
      }
   }
}
