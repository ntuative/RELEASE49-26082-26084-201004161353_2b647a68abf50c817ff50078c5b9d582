package com.sulake.habbo.toolbar
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ToolbarIcon
   {
       
      
      private var var_503:ToolbarIconGroup;
      
      private var var_1024:Boolean = false;
      
      private var var_1995:String;
      
      private var var_877:Number;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_1025:String = "-1";
      
      private var _window:IBitmapWrapperWindow;
      
      private var var_31:String = "-1";
      
      private var var_94:IRegionWindow;
      
      private var _bitmapData:BitmapData;
      
      private var var_715:String;
      
      private var var_1889:int;
      
      private var var_714:Timer;
      
      private var var_1495:Array;
      
      private var var_1026:ToolbarIconBouncer;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _events:IEventDispatcher;
      
      private var var_2315:Array;
      
      private var var_260:ToolbarBarMenuAnimator;
      
      private var var_414:ToolbarIconAnimator;
      
      private var var_591:Array;
      
      private var var_853:Array;
      
      private var var_854:String = "-1";
      
      private var var_2386:Boolean = true;
      
      private var var_1027:Array;
      
      private var var_1241:Timer;
      
      private var var_1996:int;
      
      private var var_83:Number = 0;
      
      private var _y:Number = 0;
      
      public function ToolbarIcon(param1:ToolbarIconGroup, param2:IHabboWindowManager, param3:IAssetLibrary, param4:String, param5:IEventDispatcher, param6:ToolbarBarMenuAnimator)
      {
         var_591 = new Array();
         var_853 = new Array();
         var_2315 = new Array();
         var_1026 = new ToolbarIconBouncer(0.8,1);
         super();
         var_503 = param1;
         _windowManager = param2;
         _assetLibrary = param3;
         var_715 = param4;
         _events = param5;
         var_260 = param6;
         var_1241 = new Timer(40,40);
         var_1241.addEventListener(TimerEvent.TIMER,updateBouncer);
         var_94 = param2.createWindow("TOOLBAR_ICON_" + param4 + "_REGION","",WindowType.const_465,HabboWindowStyle.const_41,HabboWindowParam.const_43,new Rectangle(0,0,1,1),onMouseEvent) as IRegionWindow;
         var_94.background = true;
         var_94.mouseTreshold = 0;
         var_94.visible = false;
         _window = IBitmapWrapperWindow(param2.createWindow("TOOLBAR_ICON_" + param4,"",HabboWindowType.BITMAP_WRAPPER,HabboWindowStyle.const_41,HabboWindowParam.const_41,new Rectangle(0,0,1,1),onMouseEvent,0));
         var_94.addChild(_window);
         _window.addEventListener(WindowEvent.const_46,onWindowResized);
      }
      
      private function getStateObject(param1:String) : StateItem
      {
         return var_1495[var_1027.indexOf(param1)];
      }
      
      public function get windowOffsetFromIcon() : Number
      {
         return var_1996;
      }
      
      public function get iconId() : String
      {
         return var_715;
      }
      
      private function onWindowResized(param1:WindowEvent) : void
      {
         updateRegion();
      }
      
      public function changePosition(param1:Number) : void
      {
         var_877 = param1;
         updateRegion();
      }
      
      public function setIcon(param1:Boolean = true) : void
      {
         exists = param1;
         setAnimator();
      }
      
      public function set state(param1:String) : void
      {
         var_31 = param1;
         exists = true;
         setAnimator();
         setTooltip();
      }
      
      private function updateRegion() : void
      {
         if(var_94 == null || _window == null)
         {
            return;
         }
         var_94.width = _window.width;
         var_94.height = _window.height;
         var _loc1_:Boolean = false;
         if(_loc1_)
         {
            var_83 = (0 - 0) / 2;
            _y = var_877 + (0 - 0) / 2;
         }
         else
         {
            var_83 = var_877 + (0 - 0) / 2;
            _y = (0 - 0) / 2;
         }
         var_94.x = var_83;
         var_94.y = _y;
      }
      
      public function dispose() : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         if(var_94 != null)
         {
            var_94.dispose();
            var_94 = null;
         }
         var_591 = null;
         var_853 = null;
         exists = false;
         _windowManager = null;
         _events = null;
         var_260 = null;
         var_414 = null;
         _bitmapData = null;
      }
      
      public function dockMenu(param1:String, param2:Array = null, param3:Boolean = false) : void
      {
         var _loc4_:* = null;
         if(var_591.indexOf(param1) < 0)
         {
            var_591.push(param1);
            _loc4_ = new MenuSettingsItem(param1,param2,param3);
            var_853.push(_loc4_);
         }
      }
      
      private function onMouseEvent(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:* = null;
         if(!var_1024)
         {
            return;
         }
         var _loc3_:StateItem = getCurrentStateObject();
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(var_260)
               {
                  var_260.repositionWindow(var_715,true);
               }
               if(_events != null)
               {
                  _loc4_ = new HabboToolbarEvent(HabboToolbarEvent.const_62);
                  _loc4_.iconId = var_715;
                  _events.dispatchEvent(_loc4_);
               }
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               if(false)
               {
                  if(_loc3_.hasStateOver)
                  {
                     state = _loc3_.stateOver;
                  }
                  else
                  {
                     state = var_1025;
                  }
               }
               break;
            case WindowMouseEvent.const_32:
               if(false)
               {
                  if(_loc3_.hasDefaultState)
                  {
                     state = _loc3_.defaultState;
                  }
                  else
                  {
                     state = var_854;
                  }
               }
         }
      }
      
      public function docksMenu(param1:String) : Boolean
      {
         return var_591.indexOf(param1) > -1;
      }
      
      public function menuLockedToIcon(param1:String) : Boolean
      {
         if(!docksMenu(param1))
         {
            return false;
         }
         var _loc2_:MenuSettingsItem = var_853[var_591.indexOf(param1)];
         return _loc2_.lockToIcon;
      }
      
      public function set exists(param1:Boolean) : void
      {
         var_1024 = param1;
         if(var_94 != null)
         {
            var_94.visible = var_1024;
         }
      }
      
      private function setTooltip() : void
      {
         if(var_94 == null)
         {
            return;
         }
         var _loc1_:StateItem = getCurrentStateObject();
         if(_loc1_ != null && _loc1_.tooltip != null)
         {
            var_94.toolTipCaption = "${toolbar.icon.tooltip." + _loc1_.tooltip + "}";
         }
         else
         {
            var_94.toolTipCaption = "${toolbar.icon.tooltip." + var_1995.toLowerCase() + "}";
         }
         var_94.toolTipDelay = 100;
      }
      
      public function animateWindowIn(param1:String, param2:IWindowContainer, param3:Number, param4:String, param5:Point) : void
      {
         if(var_260 != null)
         {
            var_260.animateWindowIn(this,param1,param2,var_715,param3,param4,getMenuYieldList(param1));
         }
      }
      
      private function updateAnimator(param1:Event) : void
      {
         if(var_414 != null && _window != null)
         {
            var_414.update(_window);
            if(var_414.hasNextState())
            {
               state = var_414.nextState;
            }
         }
      }
      
      public function defineFromXML(param1:XML) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var_1495 = new Array();
         var_1027 = new Array();
         var_1995 = param1.@id;
         var_1996 = int(param1.@window_offset_from_icon);
         var_1889 = int(param1.@window_margin);
         var _loc2_:XMLList = param1.elements("state");
         if(_loc2_.length() > 0)
         {
            if(param1.attribute("state_over").length() > 0)
            {
               var_1025 = param1.@state_over;
            }
            if(param1.attribute("state_default").length() > 0)
            {
               var_854 = param1.@state_default;
            }
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length())
            {
               _loc4_ = _loc2_[_loc3_];
               _loc5_ = new StateItem(_loc4_,param1.@id.toLowerCase());
               var_1027.push(_loc5_.id);
               var_1495.push(_loc5_);
               if(_loc3_ == 0)
               {
                  if(var_1025 == "-1")
                  {
                     var_1025 = _loc5_.id;
                  }
                  if(var_854 == "-1")
                  {
                     var_854 = _loc5_.id;
                  }
               }
               _loc3_++;
            }
         }
         var_31 = var_854;
      }
      
      public function setIconBitmapData(param1:BitmapData = null) : void
      {
         exists = true;
         _bitmapData = param1;
         setAnimator();
      }
      
      public function hideWindow(param1:String, param2:IWindowContainer, param3:Number, param4:String) : void
      {
         if(var_260 != null)
         {
            var_260.hideWindow(param1,param2,var_715,param3);
         }
      }
      
      public function positionWindow(param1:String, param2:IWindowContainer, param3:Number, param4:String) : void
      {
         if(var_260 != null)
         {
            var_260.positionWindow(this,param1,param2,var_715,param3,getMenuYieldList(param1));
         }
      }
      
      public function animateWindowOut(param1:String, param2:IWindowContainer, param3:String) : void
      {
         if(var_260 != null)
         {
            var_260.animateWindowOut(this,param1,param2,param3);
         }
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get exists() : Boolean
      {
         return var_1024;
      }
      
      private function updateBouncer(param1:Event) : void
      {
         if(var_1026 != null && _window != null)
         {
            var_1026.update();
            _window.y = var_1026.location;
         }
      }
      
      private function setAnimator() : void
      {
         if(var_714 != null)
         {
            var_714.stop();
            var_714 = null;
         }
         var _loc1_:StateItem = getCurrentStateObject();
         if(_loc1_ != null && var_1024)
         {
            if(_loc1_.frames == null)
            {
               return;
            }
            var_414 = new ToolbarIconAnimator(_loc1_,_assetLibrary,_window,var_83,_y,_bitmapData);
            if(false)
            {
               var_714 = new Timer(_loc1_.timer);
               var_714.addEventListener(TimerEvent.TIMER,updateAnimator);
               var_714.start();
            }
            if(_loc1_.bounce)
            {
               var_1026.reset(-7);
               var_1241.reset();
               var_1241.start();
            }
         }
         else
         {
            var_414 = null;
            _window.bitmap = null;
         }
      }
      
      public function get windowMargin() : Number
      {
         return var_1889 + var_503.windowMargin;
      }
      
      private function getCurrentStateObject() : StateItem
      {
         return getStateObject(var_31);
      }
      
      public function get window() : IWindow
      {
         return var_94;
      }
      
      public function get x() : Number
      {
         return var_83;
      }
      
      private function getMenuYieldList(param1:String) : Array
      {
         if(!docksMenu(param1))
         {
            return null;
         }
         var _loc2_:MenuSettingsItem = var_853[var_591.indexOf(param1)];
         return _loc2_.yieldList;
      }
      
      public function get group() : ToolbarIconGroup
      {
         return var_503;
      }
   }
}
