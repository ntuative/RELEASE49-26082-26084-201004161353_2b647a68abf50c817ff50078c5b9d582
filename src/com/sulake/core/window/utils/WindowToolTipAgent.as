package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.components.IToolTipWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowType;
   import flash.display.DisplayObject;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class WindowToolTipAgent extends WindowMouseOperator implements IWindowToolTipAgentService
   {
       
      
      protected var var_327:Timer;
      
      protected var var_954:String;
      
      protected var var_953:uint;
      
      protected var var_1120:Point;
      
      protected var var_243:IToolTipWindow;
      
      protected var var_1119:Point;
      
      public function WindowToolTipAgent(param1:DisplayObject)
      {
         var_1120 = new Point();
         var_1119 = new Point(20,20);
         var_953 = 500;
         super(param1);
      }
      
      override public function end(param1:IWindow) : IWindow
      {
         if(var_327 != null)
         {
            var_327.stop();
            var_327.removeEventListener(TimerEvent.TIMER,showToolTip);
            var_327 = null;
         }
         hideToolTip();
         return super.end(param1);
      }
      
      override public function operate(param1:int, param2:int) : void
      {
         if(_window && true)
         {
            _mouse.x = param1;
            _mouse.y = param2;
            getMousePositionRelativeTo(_window,_mouse,var_1120);
            if(var_243 != null && true)
            {
               var_243.x = param1 + var_1119.x;
               var_243.y = param2 + var_1119.y;
            }
         }
      }
      
      protected function showToolTip(param1:TimerEvent) : void
      {
         var _loc2_:* = null;
         if(var_327 != null)
         {
            var_327.reset();
         }
         if(_window && true)
         {
            if(var_243 == null || false)
            {
               var_243 = _window.context.create("undefined::ToolTip",var_954,WindowType.const_326,_window.style,0 | 0,null,null,null,0,null,null) as IToolTipWindow;
            }
            _loc2_ = new Point();
            _window.getGlobalPosition(_loc2_);
            var_243.x = _loc2_.x + var_1120.x + var_1119.x;
            var_243.y = _loc2_.y + var_1120.y + var_1119.y;
         }
      }
      
      override public function begin(param1:IWindow, param2:uint = 0) : IWindow
      {
         if(param1 && !param1.disposed)
         {
            if(param1 is IInteractiveWindow)
            {
               var_954 = IInteractiveWindow(param1).toolTipCaption;
               var_953 = IInteractiveWindow(param1).toolTipDelay;
            }
            else
            {
               var_954 = param1.caption;
               var_953 = 500;
            }
            _mouse.x = var_117.mouseX;
            _mouse.y = var_117.mouseY;
            getMousePositionRelativeTo(param1,_mouse,var_1120);
            if(var_954 != null && var_954 != "")
            {
               if(var_327 == null)
               {
                  var_327 = new Timer(var_953,1);
                  var_327.addEventListener(TimerEvent.TIMER,showToolTip);
               }
               var_327.reset();
               var_327.start();
            }
         }
         return super.begin(param1,param2);
      }
      
      protected function hideToolTip() : void
      {
         if(var_243 != null && true)
         {
            var_243.destroy();
            var_243 = null;
         }
      }
   }
}
