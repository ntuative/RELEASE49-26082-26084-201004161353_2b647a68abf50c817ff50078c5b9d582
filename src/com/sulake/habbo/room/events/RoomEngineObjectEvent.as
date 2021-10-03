package com.sulake.habbo.room.events
{
   public class RoomEngineObjectEvent extends RoomEngineEvent
   {
      
      public static const const_244:String = "REOB_OBJECT_ADDED";
      
      public static const const_452:String = "REOE_ROOM_AD_FURNI_CLICK";
      
      public static const const_94:String = "REOR_REMOVE_DIMMER";
      
      public static const ROOM_OBJECT_WIDGET_REQUEST_CREDITFURNI:String = "REOE_WIDGET_REQUEST_CREDITFURNI";
      
      public static const const_222:String = "REOB_OBJECT_PLACED";
      
      public static const const_135:String = "REOE_WIDGET_REQUEST_STICKIE";
      
      public static const const_376:String = "REOE_ROOM_AD_FURNI_DOUBLE_CLICK";
      
      public static const const_115:String = "REOE_WIDGET_REQUEST_DIMMER";
      
      public static const const_650:String = "REOE_OBJECT_REMOVED";
      
      public static const const_125:String = "REOE_WIDGET_REQUEST_PLACEHOLDER";
      
      public static const const_124:String = "REOE_WIDGET_REQUEST_ECOTRONBOX";
      
      public static const const_358:String = "REOE_ROOM_AD_TOOLTIP_SHOW";
      
      public static const const_743:String = "REOE_OBJECT_SELECTED";
      
      public static const const_398:String = "REOE_OBJECT_DESELECTED";
      
      public static const const_390:String = "REOE_ROOM_AD_TOOLTIP_HIDE";
      
      public static const const_113:String = "REOE_WIDGET_REQUEST_PRESENT";
      
      public static const const_572:String = "REOB_OBJECT_REQUEST_MOVE";
      
      public static const const_130:String = "REOE_WIDGET_REQUEST_TROPHY";
       
      
      private var _roomId:int;
      
      private var _roomCategory:int;
      
      private var var_146:int;
      
      private var _category:int;
      
      public function RoomEngineObjectEvent(param1:String, param2:int, param3:int, param4:int, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param2,param3,param6,param7);
         var_146 = param4;
         _category = param5;
      }
      
      public function get objectId() : int
      {
         return var_146;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
