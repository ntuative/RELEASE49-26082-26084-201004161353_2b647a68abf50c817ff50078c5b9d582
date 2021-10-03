package com.sulake.habbo.communication.messages.outgoing.moderator
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class ModeratorActionMessageComposer implements IMessageComposer, IDisposable
   {
      
      public static const const_1273:int = 1;
      
      public static const const_1329:int = 4;
      
      public static const const_1573:int = 2;
      
      public static const const_1323:int = 1;
      
      public static const const_1353:int = 0;
      
      public static const const_1565:int = 0;
      
      public static const const_1308:int = 3;
       
      
      private var var_29:Array;
      
      public function ModeratorActionMessageComposer(param1:int, param2:int, param3:String, param4:String, param5:String, param6:int = 0)
      {
         var_29 = new Array();
         super();
         this.var_29.push(param1);
         this.var_29.push(param2);
         this.var_29.push(param3);
         this.var_29.push(param4);
         this.var_29.push(param5);
         this.var_29.push(param6);
         this.var_29.push(false);
         this.var_29.push(false);
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
