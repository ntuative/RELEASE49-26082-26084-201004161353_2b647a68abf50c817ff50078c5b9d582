package com.sulake.habbo.widget.events
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomWidgetRoomViewUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_570:String = "RWRVUE_ROOM_VIEW_POSITION_CHANGED";
      
      public static const const_714:String = "RWRVUE_ROOM_VIEW_SCALE_CHANGED";
      
      public static const const_243:String = "RWRVUE_ROOM_VIEW_SIZE_CHANGED";
       
      
      private var var_1558:Point;
      
      private var var_1559:Rectangle;
      
      private var var_186:Number = 0;
      
      public function RoomWidgetRoomViewUpdateEvent(param1:String, param2:Rectangle = null, param3:Point = null, param4:Number = 0, param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param5,param6);
         var_1559 = param2;
         var_1558 = param3;
         var_186 = param4;
      }
      
      public function get rect() : Rectangle
      {
         if(var_1559 != null)
         {
            return var_1559.clone();
         }
         return null;
      }
      
      public function get scale() : Number
      {
         return var_186;
      }
      
      public function get positionDelta() : Point
      {
         if(var_1558 != null)
         {
            return var_1558.clone();
         }
         return null;
      }
   }
}
