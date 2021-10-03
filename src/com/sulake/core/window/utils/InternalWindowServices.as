package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class InternalWindowServices implements IInternalWindowServices
   {
       
      
      private var var_117:DisplayObject;
      
      private var var_2310:uint;
      
      private var var_829:IWindowToolTipAgentService;
      
      private var var_830:IWindowMouseScalingService;
      
      private var _windowContext:IWindowContext;
      
      private var var_828:IWindowFocusManagerService;
      
      private var var_832:IWindowMouseListenerService;
      
      private var var_831:IWindowMouseDraggingService;
      
      public function InternalWindowServices(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         var_2310 = 0;
         var_117 = param2;
         _windowContext = param1;
         var_831 = new WindowMouseDragger(param2);
         var_830 = new WindowMouseScaler(param2);
         var_832 = new WindowMouseListener(param2);
         var_828 = new FocusManager(param2);
         var_829 = new WindowToolTipAgent(param2);
      }
      
      public function getMouseScalingService() : IWindowMouseScalingService
      {
         return var_830;
      }
      
      public function getFocusManagerService() : IWindowFocusManagerService
      {
         return var_828;
      }
      
      public function getToolTipAgentService() : IWindowToolTipAgentService
      {
         return var_829;
      }
      
      public function dispose() : void
      {
         if(var_831 != null)
         {
            var_831.dispose();
            var_831 = null;
         }
         if(var_830 != null)
         {
            var_830.dispose();
            var_830 = null;
         }
         if(var_832 != null)
         {
            var_832.dispose();
            var_832 = null;
         }
         if(var_828 != null)
         {
            var_828.dispose();
            var_828 = null;
         }
         if(var_829 != null)
         {
            var_829.dispose();
            var_829 = null;
         }
         _windowContext = null;
      }
      
      public function getMouseListenerService() : IWindowMouseListenerService
      {
         return var_832;
      }
      
      public function getMouseDraggingService() : IWindowMouseDraggingService
      {
         return var_831;
      }
   }
}
