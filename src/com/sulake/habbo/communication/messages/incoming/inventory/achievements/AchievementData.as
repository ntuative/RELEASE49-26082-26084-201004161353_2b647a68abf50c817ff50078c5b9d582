package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   public class AchievementData
   {
       
      
      private var var_1636:int;
      
      private var _type:int;
      
      private var var_722:String;
      
      public function AchievementData()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1636;
      }
      
      public function set level(param1:int) : void
      {
         var_1636 = param1;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function set badgeId(param1:String) : void
      {
         var_722 = param1;
      }
      
      public function get badgeId() : String
      {
         return var_722;
      }
   }
}
