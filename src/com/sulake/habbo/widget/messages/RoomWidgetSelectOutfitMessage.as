package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const const_1017:String = "select_outfit";
       
      
      private var var_1976:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super(const_1017);
         var_1976 = param1;
      }
      
      public function get outfitId() : int
      {
         return var_1976;
      }
   }
}
