package com.sulake.habbo.session
{
   public class UserData implements IUserData
   {
       
      
      private var var_294:String = "";
      
      private var var_1795:String = "";
      
      private var var_1794:int = 0;
      
      private var var_1772:int = 0;
      
      private var _type:int = 0;
      
      private var var_1793:String = "";
      
      private var var_606:String = "";
      
      private var _id:int = -1;
      
      private var _name:String = "";
      
      private var var_1763:int = 0;
      
      public function UserData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set groupStatus(param1:int) : void
      {
         var_1794 = param1;
      }
      
      public function set groupID(param1:String) : void
      {
         var_1793 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set figure(param1:String) : void
      {
         var_294 = param1;
      }
      
      public function set sex(param1:String) : void
      {
         var_606 = param1;
      }
      
      public function get groupStatus() : int
      {
         return var_1794;
      }
      
      public function set webID(param1:int) : void
      {
         var_1763 = param1;
      }
      
      public function get groupID() : String
      {
         return var_1793;
      }
      
      public function set custom(param1:String) : void
      {
         var_1795 = param1;
      }
      
      public function get figure() : String
      {
         return var_294;
      }
      
      public function get sex() : String
      {
         return var_606;
      }
      
      public function get custom() : String
      {
         return var_1795;
      }
      
      public function get webID() : int
      {
         return var_1763;
      }
      
      public function set xp(param1:int) : void
      {
         var_1772 = param1;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function get xp() : int
      {
         return var_1772;
      }
   }
}
