package com.sulake.habbo.toolbar
{
   public class StateItem
   {
       
      
      private var var_1166:Boolean;
      
      private var var_1831:String;
      
      private var _frames:XMLList;
      
      private var var_1025:String = "-1";
      
      private var var_640:String;
      
      private var var_172:int = 120;
      
      private var var_1181:String = "-1";
      
      private var var_1182:String;
      
      private var var_1832:Boolean;
      
      private var var_1436:String = "-1";
      
      private var _id:String;
      
      public function StateItem(param1:XML, param2:String)
      {
         super();
         _id = param1.@id;
         if(param1.attribute("loop").length() > 0)
         {
            var_1166 = Boolean(param1.@loop);
         }
         if(param1.attribute("bounce").length() > 0)
         {
            var_1832 = Boolean(param1.@loop);
         }
         if(param1.attribute("timer").length() > 0)
         {
            var_172 = int(param1.@timer);
         }
         if(param1.attribute("namebase").length() > 0)
         {
            var_1182 = param1.@namebase;
         }
         else
         {
            var_1182 = param2;
         }
         if(param1.attribute("state_over").length() > 0)
         {
            var_1025 = param1.@state_over;
         }
         if(param1.attribute("nextState").length() > 0)
         {
            var_1181 = param1.@nextState;
         }
         else
         {
            var_1181 = _id;
         }
         if(param1.attribute("state_default").length() > 0)
         {
            var_1436 = param1.@state_default;
         }
         if(param1.attribute("tooltip").length() > 0)
         {
            var_1831 = param1.@tooltip;
         }
         if(param1.attribute("background").length() > 0)
         {
            var_640 = param1.@background;
         }
         var _loc3_:XMLList = param1.elements("frame");
         if(_loc3_.length() > 0)
         {
            _frames = _loc3_;
         }
      }
      
      public function get hasStateOver() : Boolean
      {
         return var_1025 != "-1";
      }
      
      public function get bounce() : Boolean
      {
         return var_1832;
      }
      
      public function get defaultState() : String
      {
         return var_1436;
      }
      
      public function get hasDefaultState() : Boolean
      {
         return var_1436 != "-1";
      }
      
      public function get tooltip() : String
      {
         return var_1831;
      }
      
      public function get id() : String
      {
         return _id;
      }
      
      public function get timer() : int
      {
         return var_172;
      }
      
      public function get loop() : Boolean
      {
         return var_1166;
      }
      
      public function get nextState() : String
      {
         return var_1181;
      }
      
      public function get frames() : XMLList
      {
         return _frames;
      }
      
      public function get background() : String
      {
         return var_640;
      }
      
      public function get stateOver() : String
      {
         return var_1025;
      }
      
      public function get nameBase() : String
      {
         return var_1182;
      }
   }
}
