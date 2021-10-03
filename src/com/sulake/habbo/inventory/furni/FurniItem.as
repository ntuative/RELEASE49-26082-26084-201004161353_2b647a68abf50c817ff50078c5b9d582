package com.sulake.habbo.inventory.furni
{
   import flash.display.BitmapData;
   
   public class FurniItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_2087:int;
      
      private var var_2090:Boolean;
      
      private var var_2037:int;
      
      private var var_1396:String;
      
      private var var_2089:Boolean = false;
      
      private var var_1828:int;
      
      private var var_452:int;
      
      private var var_963:String;
      
      private var var_1598:String;
      
      private var _image:BitmapData;
      
      private var _objId:int;
      
      private var var_1202:int;
      
      private var var_2088:Boolean;
      
      private var var_2091:int;
      
      public function FurniItem(param1:int, param2:String, param3:int, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:int, param9:String, param10:int)
      {
         super();
         var_2087 = param1;
         var_963 = param2;
         _objId = param3;
         var_1202 = param4;
         var_1396 = param5;
         var_2090 = param6;
         var_2088 = param7;
         var_1828 = param8;
         var_1598 = param9;
         var_2037 = param10;
         var_452 = -1;
      }
      
      public function get songId() : int
      {
         return var_2037;
      }
      
      public function get iconCallbackId() : int
      {
         return var_452;
      }
      
      public function get expiryTime() : int
      {
         return var_1828;
      }
      
      public function set prevCallbackId(param1:int) : void
      {
         var_2091 = param1;
      }
      
      public function set isLocked(param1:Boolean) : void
      {
         var_2089 = param1;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_452 = param1;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_2088;
      }
      
      public function get slotId() : String
      {
         return var_1598;
      }
      
      public function get classId() : int
      {
         return var_1202;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_2090;
      }
      
      public function get stuffData() : String
      {
         return var_1396;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function get stripId() : int
      {
         return var_2087;
      }
      
      public function get isLocked() : Boolean
      {
         return var_2089;
      }
      
      public function get prevCallbackId() : int
      {
         return var_2091;
      }
      
      public function get iconImage() : BitmapData
      {
         return _image;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get itemType() : String
      {
         return var_963;
      }
   }
}
