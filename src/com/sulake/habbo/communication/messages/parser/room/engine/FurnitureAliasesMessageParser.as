package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.core.utils.Map;
   
   public class FurnitureAliasesMessageParser implements IMessageParser
   {
       
      
      private var var_549:Map = null;
      
      public function FurnitureAliasesMessageParser()
      {
         super();
         var_549 = new Map();
      }
      
      public function getName(param1:int) : String
      {
         if(param1 < 0 || param1 >= aliasCount)
         {
            return null;
         }
         return var_549.getKey(param1);
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var_549.reset();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            _loc5_ = param1.readString();
            var_549.remove(_loc4_);
            var_549.add(_loc4_,_loc5_);
            _loc3_++;
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_549.reset();
         return true;
      }
      
      public function getAlias(param1:int) : String
      {
         if(param1 < 0 || param1 >= aliasCount)
         {
            return null;
         }
         return var_549.getWithIndex(param1);
      }
      
      public function get aliasCount() : int
      {
         return var_549.length;
      }
   }
}
