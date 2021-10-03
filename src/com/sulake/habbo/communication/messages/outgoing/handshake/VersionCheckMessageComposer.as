package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class VersionCheckMessageComposer implements IMessageComposer
   {
       
      
      private var var_2024:String;
      
      private var var_1358:String;
      
      private var var_2023:int;
      
      public function VersionCheckMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         var_2023 = param1;
         var_1358 = param2;
         var_2024 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [var_2023,var_1358,var_2024];
      }
      
      public function dispose() : void
      {
      }
   }
}
