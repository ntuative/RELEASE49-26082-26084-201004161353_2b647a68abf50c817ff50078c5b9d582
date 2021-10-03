package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   
   public class PetRespectNotificationParser implements IMessageParser
   {
       
      
      private var var_1638:int;
      
      private var var_1228:PetData;
      
      private var var_1952:int;
      
      public function PetRespectNotificationParser()
      {
         super();
      }
      
      public function get respect() : int
      {
         return var_1638;
      }
      
      public function get petData() : PetData
      {
         return var_1228;
      }
      
      public function flush() : Boolean
      {
         var_1228 = null;
         return true;
      }
      
      public function get petOwnerId() : int
      {
         return var_1952;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1638 = param1.readInteger();
         var_1952 = param1.readInteger();
         var_1228 = new PetData(param1);
         return true;
      }
   }
}
