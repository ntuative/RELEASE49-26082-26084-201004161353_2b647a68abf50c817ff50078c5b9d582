package com.sulake.habbo.session.events
{
   import flash.events.Event;
   
   public class SessionCreditBalanceEvent extends Event
   {
      
      public static const const_158:String = "session_credit_balance";
       
      
      private var var_1970:int;
      
      public function SessionCreditBalanceEvent(param1:int, param2:Boolean = false, param3:Boolean = false)
      {
         super(const_158,param2,param3);
         var_1970 = param1;
      }
      
      public function get credits() : int
      {
         return var_1970;
      }
   }
}
