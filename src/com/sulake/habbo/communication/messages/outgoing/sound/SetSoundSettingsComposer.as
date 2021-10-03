package com.sulake.habbo.communication.messages.outgoing.sound
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class SetSoundSettingsComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_29:Array;
      
      public function SetSoundSettingsComposer(param1:int)
      {
         var_29 = new Array();
         super();
         var_29.push(param1);
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
      
      public function getMessageArray() : Array
      {
         return var_29;
      }
      
      public function dispose() : void
      {
         var_29 = null;
      }
   }
}
