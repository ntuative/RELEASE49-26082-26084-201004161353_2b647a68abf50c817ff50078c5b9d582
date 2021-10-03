package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_210:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2269:Boolean = false;
      
      private var var_2270:int = 0;
      
      private var var_2268:int = 0;
      
      private var var_1696:int;
      
      private var var_2267:int = 0;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_210,param6,param7);
         var_2267 = param1;
         var_2268 = param2;
         var_2270 = param3;
         var_2269 = param4;
         var_1696 = param5;
      }
      
      public function get clubLevel() : int
      {
         return var_1696;
      }
      
      public function get pastPeriods() : int
      {
         return var_2270;
      }
      
      public function get periodsLeft() : int
      {
         return var_2268;
      }
      
      public function get daysLeft() : int
      {
         return var_2267;
      }
      
      public function get allowClubDances() : Boolean
      {
         return var_2269;
      }
   }
}
