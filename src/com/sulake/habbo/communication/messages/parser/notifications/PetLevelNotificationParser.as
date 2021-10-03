package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_294:String;
      
      private var var_1636:int;
      
      private var var_1736:String;
      
      private var var_976:int;
      
      private var var_1127:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_1127;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1127 = param1.readInteger();
         var_1736 = param1.readString();
         var_1636 = param1.readInteger();
         var_294 = param1.readString();
         var_976 = param1.readInteger();
         return true;
      }
      
      public function get petName() : String
      {
         return var_1736;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get figure() : String
      {
         return var_294;
      }
      
      public function get petType() : int
      {
         return var_976;
      }
      
      public function get level() : int
      {
         return var_1636;
      }
   }
}
