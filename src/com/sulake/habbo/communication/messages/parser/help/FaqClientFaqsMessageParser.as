package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.core.utils.Map;
   
   public class FaqClientFaqsMessageParser implements IMessageParser
   {
       
      
      private var var_663:Map;
      
      private var var_664:Map;
      
      public function FaqClientFaqsMessageParser()
      {
         super();
      }
      
      public function get normalData() : Map
      {
         return var_663;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var_664 = new Map();
         var_663 = new Map();
         _loc5_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc2_ = param1.readInteger();
            _loc3_ = param1.readString();
            var_664.add(_loc2_,_loc3_);
            _loc4_++;
         }
         _loc5_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc2_ = param1.readInteger();
            _loc3_ = param1.readString();
            var_663.add(_loc2_,_loc3_);
            _loc4_++;
         }
         return true;
      }
      
      public function get urgentData() : Map
      {
         return var_664;
      }
      
      public function flush() : Boolean
      {
         if(var_664 != null)
         {
            var_664.dispose();
         }
         var_664 = null;
         if(var_663 != null)
         {
            var_663.dispose();
         }
         var_663 = null;
         return true;
      }
   }
}
