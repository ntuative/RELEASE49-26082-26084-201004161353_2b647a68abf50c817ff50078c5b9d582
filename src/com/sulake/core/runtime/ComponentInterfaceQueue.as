package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1133:IID;
      
      private var _isDisposed:Boolean;
      
      private var var_778:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         var_1133 = param1;
         var_778 = new Array();
         _isDisposed = false;
      }
      
      public function get receivers() : Array
      {
         return var_778;
      }
      
      public function get identifier() : IID
      {
         return var_1133;
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function dispose() : void
      {
         if(!_isDisposed)
         {
            _isDisposed = true;
            var_1133 = null;
            while(false)
            {
               var_778.pop();
            }
            var_778 = null;
         }
      }
   }
}
