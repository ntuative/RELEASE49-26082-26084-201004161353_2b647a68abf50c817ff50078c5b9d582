package com.sulake.habbo.widget.events
{
   public class RoomWidgetStickieDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_697:String = "RWSDUE_STICKIE_DATA";
       
      
      private var var_189:String;
      
      private var var_753:String;
      
      private var var_1573:String;
      
      private var var_146:int = -1;
      
      private var var_47:Boolean;
      
      public function RoomWidgetStickieDataUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:String, param6:Boolean, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param7,param8);
         var_146 = param2;
         var_1573 = param3;
         var_189 = param4;
         var_753 = param5;
         var_47 = param6;
      }
      
      public function get method_1() : String
      {
         return var_1573;
      }
      
      public function get colorHex() : String
      {
         return var_753;
      }
      
      public function get text() : String
      {
         return var_189;
      }
      
      public function get objectId() : int
      {
         return var_146;
      }
      
      public function get controller() : Boolean
      {
         return var_47;
      }
   }
}
