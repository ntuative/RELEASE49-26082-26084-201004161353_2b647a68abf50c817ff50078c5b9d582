package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_245:String = "WE_CHILD_RESIZED";
      
      public static const const_1313:String = "WE_CLOSE";
      
      public static const const_1215:String = "WE_DESTROY";
      
      public static const const_128:String = "WE_CHANGE";
      
      public static const const_1320:String = "WE_RESIZE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_1619:String = "WE_PARENT_RESIZE";
      
      public static const const_97:String = "WE_UPDATE";
      
      public static const const_1201:String = "WE_MAXIMIZE";
      
      public static const const_393:String = "WE_DESTROYED";
      
      public static const const_970:String = "WE_UNSELECT";
      
      public static const const_1234:String = "WE_MAXIMIZED";
      
      public static const const_1479:String = "WE_UNLOCKED";
      
      public static const const_472:String = "WE_CHILD_REMOVED";
      
      public static const const_153:String = "WE_OK";
      
      public static const const_46:String = "WE_RESIZED";
      
      public static const const_1401:String = "WE_ACTIVATE";
      
      public static const const_261:String = "WE_ENABLED";
      
      public static const const_481:String = "WE_CHILD_RELOCATED";
      
      public static const const_1342:String = "WE_CREATE";
      
      public static const const_712:String = "WE_SELECT";
      
      public static const const_165:String = "";
      
      public static const const_1532:String = "WE_LOCKED";
      
      public static const const_1501:String = "WE_PARENT_RELOCATE";
      
      public static const const_1464:String = "WE_CHILD_REMOVE";
      
      public static const const_1578:String = "WE_CHILD_RELOCATE";
      
      public static const const_1575:String = "WE_LOCK";
      
      public static const const_231:String = "WE_FOCUSED";
      
      public static const const_580:String = "WE_UNSELECTED";
      
      public static const const_860:String = "WE_DEACTIVATED";
      
      public static const const_1358:String = "WE_MINIMIZED";
      
      public static const const_1591:String = "WE_ARRANGED";
      
      public static const const_1593:String = "WE_UNLOCK";
      
      public static const const_1540:String = "WE_ATTACH";
      
      public static const const_1392:String = "WE_OPEN";
      
      public static const const_1304:String = "WE_RESTORE";
      
      public static const const_1476:String = "WE_PARENT_RELOCATED";
      
      public static const const_1147:String = "WE_RELOCATE";
      
      public static const const_1604:String = "WE_CHILD_RESIZE";
      
      public static const const_1561:String = "WE_ARRANGE";
      
      public static const const_1153:String = "WE_OPENED";
      
      public static const const_1148:String = "WE_CLOSED";
      
      public static const const_1521:String = "WE_DETACHED";
      
      public static const const_1550:String = "WE_UPDATED";
      
      public static const const_1151:String = "WE_UNFOCUSED";
      
      public static const const_368:String = "WE_RELOCATED";
      
      public static const const_1370:String = "WE_DEACTIVATE";
      
      public static const const_232:String = "WE_DISABLED";
      
      public static const const_584:String = "WE_CANCEL";
      
      public static const const_565:String = "WE_ENABLE";
      
      public static const const_1404:String = "WE_ACTIVATED";
      
      public static const const_1182:String = "WE_FOCUS";
      
      public static const const_1491:String = "WE_DETACH";
      
      public static const const_1364:String = "WE_RESTORED";
      
      public static const const_1312:String = "WE_UNFOCUS";
      
      public static const const_58:String = "WE_SELECTED";
      
      public static const const_1390:String = "WE_PARENT_RESIZED";
      
      public static const const_1334:String = "WE_CREATED";
      
      public static const const_1555:String = "WE_ATTACHED";
      
      public static const const_1228:String = "WE_MINIMIZE";
      
      public static const WINDOW_EVENT_DISABLE:String = "WE_DISABLE";
       
      
      protected var _type:String = "";
      
      protected var var_1610:IWindow;
      
      protected var _window:IWindow;
      
      protected var var_1382:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         _type = param1;
         _window = param2;
         var_1610 = param3;
         var_1382 = false;
         super(param1,param4,param5);
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return var_1382;
      }
      
      public function get related() : IWindow
      {
         return var_1610;
      }
      
      public function get window() : IWindow
      {
         return _window;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      override public function get type() : String
      {
         return _type;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(_type,window,related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            var_1382 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
   }
}
