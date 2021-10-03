package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_1396:String;
      
      private var var_963:String;
      
      private var var_2253:Boolean;
      
      private var var_1409:int;
      
      private var var_2087:int;
      
      private var var_2254:Boolean;
      
      private var var_1598:String = "";
      
      private var var_2090:Boolean;
      
      private var _category:int;
      
      private var _objId:int;
      
      private var var_1202:int;
      
      private var var_2088:Boolean;
      
      private var var_2037:int = -1;
      
      private var var_1828:int;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         var_2087 = param1;
         var_963 = param2;
         _objId = param3;
         var_1202 = param4;
         _category = param5;
         var_1396 = param6;
         var_2253 = param7;
         var_2090 = param8;
         var_2088 = param9;
         var_2254 = param10;
         var_1828 = param11;
      }
      
      public function get slotId() : String
      {
         return var_1598;
      }
      
      public function get extra() : int
      {
         return var_1409;
      }
      
      public function get classId() : int
      {
         return var_1202;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get isSellable() : Boolean
      {
         return var_2254;
      }
      
      public function get isGroupable() : Boolean
      {
         return var_2253;
      }
      
      public function get stripId() : int
      {
         return var_2087;
      }
      
      public function get stuffData() : String
      {
         return var_1396;
      }
      
      public function get songId() : int
      {
         return var_2037;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         var_1598 = param1;
         var_1409 = param2;
      }
      
      public function get itemType() : String
      {
         return var_963;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get expiryTime() : int
      {
         return var_1828;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_2088;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_2090;
      }
   }
}
