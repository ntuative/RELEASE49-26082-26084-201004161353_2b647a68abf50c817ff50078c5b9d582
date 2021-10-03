package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var var_1643:Boolean = false;
      
      private var var_1644:Boolean = false;
      
      private var var_1987:String = "";
      
      private var _type:String = "";
      
      private var var_1646:Boolean = false;
      
      private var var_1989:Number = 0;
      
      private var var_1992:Number = 0;
      
      private var var_1991:Number = 0;
      
      private var var_1990:String = "";
      
      private var var_1993:Number = 0;
      
      private var var_1645:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:Number, param5:Number, param6:Number = 0, param7:Number = 0, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false)
      {
         super();
         _type = param1;
         var_1990 = param2;
         var_1987 = param3;
         var_1992 = param4;
         var_1991 = param5;
         var_1989 = param6;
         var_1993 = param7;
         var_1645 = param8;
         var_1644 = param9;
         var_1646 = param10;
         var_1643 = param11;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1645;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1643;
      }
      
      public function get localX() : Number
      {
         return var_1989;
      }
      
      public function get localY() : Number
      {
         return var_1993;
      }
      
      public function get canvasId() : String
      {
         return var_1990;
      }
      
      public function get altKey() : Boolean
      {
         return var_1644;
      }
      
      public function get spriteTag() : String
      {
         return var_1987;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get screenX() : Number
      {
         return var_1992;
      }
      
      public function get screenY() : Number
      {
         return var_1991;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1646;
      }
   }
}
