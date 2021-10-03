package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_423:uint;
      
      private var var_1054:IUnknown;
      
      private var var_1280:String;
      
      private var var_1055:IID;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         var_1055 = param1;
         var_1280 = getQualifiedClassName(var_1055);
         var_1054 = param2;
         var_423 = 0;
      }
      
      public function get iid() : IID
      {
         return var_1055;
      }
      
      public function get disposed() : Boolean
      {
         return var_1054 == null;
      }
      
      public function get references() : uint
      {
         return var_423;
      }
      
      public function release() : uint
      {
         return references > 0 ? uint(--var_423) : uint(0);
      }
      
      public function get unknown() : IUnknown
      {
         return var_1054;
      }
      
      public function get iis() : String
      {
         return var_1280;
      }
      
      public function reserve() : uint
      {
         return ++var_423;
      }
      
      public function dispose() : void
      {
         var_1055 = null;
         var_1280 = null;
         var_1054 = null;
         var_423 = 0;
      }
   }
}
