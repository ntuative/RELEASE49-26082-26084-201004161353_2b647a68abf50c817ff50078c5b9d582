package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import flash.utils.Dictionary;
   
   public class PollContentsParser implements IMessageParser
   {
       
      
      private var var_1070:Array = null;
      
      private var var_1312:String = "";
      
      private var var_1071:int = 0;
      
      private var var_1313:String = "";
      
      private var _id:int = -1;
      
      public function PollContentsParser()
      {
         super();
      }
      
      public function get questionArray() : Array
      {
         return var_1070;
      }
      
      public function get startMessage() : String
      {
         return var_1312;
      }
      
      public function get numQuestions() : int
      {
         return var_1071;
      }
      
      public function get endMessage() : String
      {
         return var_1313;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         _id = param1.readInteger();
         var_1312 = param1.readString();
         var_1313 = param1.readString();
         var_1071 = param1.readInteger();
         var_1070 = new Array();
         var _loc2_:int = 0;
         while(_loc2_ < var_1071)
         {
            _loc3_ = new Dictionary();
            var_1070.push(_loc3_);
            _loc3_["id"] = param1.readInteger();
            _loc3_["number"] = param1.readInteger();
            _loc3_["type"] = param1.readInteger();
            _loc3_["content"] = param1.readString();
            if(_loc3_["type"] == 1 || _loc3_["type"] == 2)
            {
               _loc4_ = param1.readInteger();
               _loc5_ = new Array();
               _loc3_["selections"] = _loc5_;
               _loc3_["selection_count"] = _loc4_;
               _loc3_["selection_min"] = param1.readInteger();
               _loc3_["selection_max"] = param1.readInteger();
               _loc6_ = 0;
               while(_loc6_ < _loc4_)
               {
                  _loc5_.push(param1.readString());
                  _loc6_++;
               }
            }
            _loc2_++;
         }
         return true;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function flush() : Boolean
      {
         _id = -1;
         var_1312 = "";
         var_1313 = "";
         var_1071 = 0;
         var_1070 = null;
         return true;
      }
   }
}