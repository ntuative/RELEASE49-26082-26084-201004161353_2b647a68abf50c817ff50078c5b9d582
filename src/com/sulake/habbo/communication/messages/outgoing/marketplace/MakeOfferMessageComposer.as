package com.sulake.habbo.communication.messages.outgoing.marketplace
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class MakeOfferMessageComposer implements IMessageComposer, IDisposable
   {
      
      public static const const_1607:int = 1;
      
      public static const const_1538:int = 2;
       
      
      private var var_29:Array;
      
      public function MakeOfferMessageComposer(param1:int, param2:int, param3:int)
      {
         var_29 = new Array();
         super();
         this.var_29.push(param1);
         this.var_29.push(param2);
         this.var_29.push(param3);
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
      
      public function getMessageArray() : Array
      {
         return this.var_29;
      }
      
      public function dispose() : void
      {
         this.var_29 = null;
      }
   }
}
