package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
   public class SaveableRoomSettingsData
   {
       
      
      private var _password:String;
      
      private var var_2066:int;
      
      private var var_1625:int;
      
      private var var_2069:Boolean;
      
      private var var_2067:Boolean;
      
      private var var_2065:Array;
      
      private var var_1701:Boolean;
      
      private var var_1131:int;
      
      private var _name:String;
      
      private var _roomId:int;
      
      private var var_641:Array;
      
      private var var_1271:String;
      
      public function SaveableRoomSettingsData()
      {
         super();
      }
      
      public function get doorMode() : int
      {
         return var_1625;
      }
      
      public function get description() : String
      {
         return var_1271;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return var_2067;
      }
      
      public function get maximumVisitors() : int
      {
         return var_2066;
      }
      
      public function set description(param1:String) : void
      {
         var_1271 = param1;
      }
      
      public function get password() : String
      {
         return _password;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_1701 = param1;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_2066 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get categoryId() : int
      {
         return var_1131;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_2065;
      }
      
      public function get tags() : Array
      {
         return var_641;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1701;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_1625 = param1;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         var_2069 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_641 = param1;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_2065 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1131 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return var_2069;
      }
      
      public function set password(param1:String) : void
      {
         _password = param1;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         var_2067 = param1;
      }
   }
}
