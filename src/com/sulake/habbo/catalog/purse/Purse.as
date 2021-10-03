package com.sulake.habbo.catalog.purse
{
   public class Purse implements IPurse
   {
       
      
      private var var_1481:int = 0;
      
      private var var_1972:int = 0;
      
      private var var_1971:Boolean = false;
      
      private var var_1970:int = 0;
      
      private var var_1482:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function get clubPeriods() : int
      {
         return var_1482;
      }
      
      public function get clubDays() : int
      {
         return var_1481;
      }
      
      public function set pixels(param1:int) : void
      {
         var_1972 = param1;
      }
      
      public function get pixels() : int
      {
         return var_1972;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return var_1481 > 0 || var_1482 > 0;
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1481 = param1;
      }
      
      public function get credits() : int
      {
         return var_1970;
      }
      
      public function get method_2() : Boolean
      {
         return var_1971;
      }
      
      public function set method_2(param1:Boolean) : void
      {
         var_1971 = param1;
      }
      
      public function set credits(param1:int) : void
      {
         var_1970 = param1;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1482 = param1;
      }
   }
}
