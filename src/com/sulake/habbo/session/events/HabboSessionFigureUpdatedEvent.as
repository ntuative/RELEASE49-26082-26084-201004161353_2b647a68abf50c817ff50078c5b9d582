package com.sulake.habbo.session.events
{
   import flash.events.Event;
   
   public class HabboSessionFigureUpdatedEvent extends Event
   {
      
      public static const const_617:String = "HABBO_SESSION_FIGURE_UPDATE";
       
      
      private var var_628:String;
      
      private var var_294:String;
      
      private var _userId:int;
      
      public function HabboSessionFigureUpdatedEvent(param1:int, param2:String, param3:String, param4:Boolean = false, param5:Boolean = false)
      {
         super(const_617,param4,param5);
         _userId = param1;
         var_294 = param2;
         var_628 = param3;
      }
      
      public function get gender() : String
      {
         return var_628;
      }
      
      public function get figure() : String
      {
         return var_294;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
   }
}
