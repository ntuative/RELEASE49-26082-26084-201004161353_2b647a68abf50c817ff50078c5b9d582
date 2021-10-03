package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_993:int = 0;
      
      private var var_1371:int = 0;
      
      private var var_1836:String = "";
      
      private var var_992:int = 0;
      
      private var var_2261:String = "";
      
      private var var_2259:int = 0;
      
      private var var_1442:String = "";
      
      private var var_2262:int = 0;
      
      private var var_2260:int = 0;
      
      private var var_1835:String = "";
      
      private var var_2258:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         var_2262 = param1;
         var_1835 = param2;
         var_1442 = param3;
         var_1836 = param4;
         var_2261 = param5;
         if(param6)
         {
            var_1371 = 1;
         }
         else
         {
            var_1371 = 0;
         }
         var_2259 = param7;
         var_2260 = param8;
         var_992 = param9;
         var_2258 = param10;
         var_993 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [var_2262,var_1835,var_1442,var_1836,var_2261,var_1371,var_2259,var_2260,var_992,var_2258,var_993];
      }
      
      public function dispose() : void
      {
      }
   }
}
