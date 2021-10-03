package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_2015:Boolean = false;
      
      private var var_2014:int = 0;
      
      private var var_1481:int = 0;
      
      private var var_2016:int = 0;
      
      private var var_1971:Boolean = false;
      
      private var var_1474:int = 0;
      
      private var var_1482:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function set creditBalance(param1:int) : void
      {
         var_1474 = Math.max(0,param1);
      }
      
      public function get clubPastPeriods() : int
      {
         return var_2014;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return var_2015;
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         var_2015 = param1;
      }
      
      public function get method_2() : Boolean
      {
         return var_1971;
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         var_2014 = Math.max(0,param1);
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1481 = Math.max(0,param1);
      }
      
      public function get creditBalance() : int
      {
         return var_1474;
      }
      
      public function set method_2(param1:Boolean) : void
      {
         var_1971 = param1;
      }
      
      public function set pixelBalance(param1:int) : void
      {
         var_2016 = Math.max(0,param1);
      }
      
      public function get clubDays() : int
      {
         return var_1481;
      }
      
      public function get pixelBalance() : int
      {
         return var_2016;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1482 = Math.max(0,param1);
      }
      
      public function get clubPeriods() : int
      {
         return var_1482;
      }
   }
}
