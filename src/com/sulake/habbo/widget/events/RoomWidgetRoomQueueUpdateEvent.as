package com.sulake.habbo.widget.events
{
   public class RoomWidgetRoomQueueUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_401:String = "RWRQUE_SPECTATOR_QUEUE_STATUS";
      
      public static const const_314:String = "RWRQUE_VISITOR_QUEUE_STATUS";
       
      
      private var var_877:int;
      
      private var var_256:Boolean;
      
      private var var_1618:Boolean;
      
      private var var_1443:Boolean;
      
      public function RoomWidgetRoomQueueUpdateEvent(param1:String, param2:int, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_877 = param2;
         var_1618 = param3;
         var_256 = param4;
         var_1443 = param5;
      }
      
      public function get position() : int
      {
         return var_877;
      }
      
      public function get method_3() : Boolean
      {
         return var_256;
      }
      
      public function get isClubQueue() : Boolean
      {
         return var_1443;
      }
      
      public function get hasHabboClub() : Boolean
      {
         return var_1618;
      }
   }
}
