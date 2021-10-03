package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserNameChangedMessageParser implements IMessageParser
   {
       
      
      private var var_1336:String;
      
      private var var_1337:int;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var _id:int;
      
      public function UserNameChangedMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1337 = param1.readInteger();
         _id = param1.readInteger();
         var_1336 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         var_1337 = -1;
         _id = -1;
         var_1336 = "";
         return true;
      }
      
      public function get newName() : String
      {
         return var_1336;
      }
      
      public function get webId() : int
      {
         return var_1337;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get id() : int
      {
         return _id;
      }
   }
}
