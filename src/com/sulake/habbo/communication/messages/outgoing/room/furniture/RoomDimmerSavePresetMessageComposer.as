package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var var_1757:int;
      
      private var var_1758:int;
      
      private var var_1755:Boolean;
      
      private var var_1759:String;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_1756:int;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         _roomId = param6;
         _roomCategory = param7;
         var_1758 = param1;
         var_1757 = param2;
         var_1759 = param3;
         var_1756 = param4;
         var_1755 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1758,var_1757,var_1759,var_1756,int(var_1755)];
      }
      
      public function dispose() : void
      {
      }
   }
}
