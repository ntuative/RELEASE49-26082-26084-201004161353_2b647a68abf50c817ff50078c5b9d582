package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1636:int;
      
      private var var_1638:int;
      
      private var var_1637:int;
      
      private var var_1955:int;
      
      private var _nutrition:int;
      
      private var var_1127:int;
      
      private var var_1953:int;
      
      private var var_1957:int;
      
      private var _energy:int;
      
      private var var_1635:int;
      
      private var var_1958:int;
      
      private var _ownerName:String;
      
      private var var_1634:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1636;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function set respect(param1:int) : void
      {
         var_1638 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         _energy = param1;
      }
      
      public function set level(param1:int) : void
      {
         var_1636 = param1;
      }
      
      public function get petId() : int
      {
         return var_1127;
      }
      
      public function get experienceMax() : int
      {
         return var_1957;
      }
      
      public function get nutritionMax() : int
      {
         return var_1955;
      }
      
      public function set levelMax(param1:int) : void
      {
         var_1953 = param1;
      }
      
      public function get ownerId() : int
      {
         return var_1634;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function set petId(param1:int) : void
      {
         var_1127 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         _nutrition = param1;
      }
      
      public function get energyMax() : int
      {
         return var_1958;
      }
      
      public function get respect() : int
      {
         return var_1638;
      }
      
      public function get levelMax() : int
      {
         return var_1953;
      }
      
      public function set ownerName(param1:String) : void
      {
         _ownerName = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         var_1957 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         var_1637 = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         var_1955 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         var_1634 = param1;
      }
      
      public function get experience() : int
      {
         return var_1637;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function set energyMax(param1:int) : void
      {
         var_1958 = param1;
      }
      
      public function set age(param1:int) : void
      {
         var_1635 = param1;
      }
      
      public function get age() : int
      {
         return var_1635;
      }
   }
}
