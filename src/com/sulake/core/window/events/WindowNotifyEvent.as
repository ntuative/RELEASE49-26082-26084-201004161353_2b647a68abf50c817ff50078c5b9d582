package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1388:String = "WN_CREATED";
      
      public static const const_885:String = "WN_DISABLE";
      
      public static const const_990:String = "WN_DEACTIVATED";
      
      public static const const_1010:String = "WN_OPENED";
      
      public static const const_1025:String = "WN_CLOSED";
      
      public static const const_992:String = "WN_DESTROY";
      
      public static const const_1497:String = "WN_ARRANGED";
      
      public static const const_458:String = "WN_PARENT_RESIZED";
      
      public static const const_801:String = "WN_ENABLE";
      
      public static const const_820:String = "WN_RELOCATE";
      
      public static const const_945:String = "WN_FOCUS";
      
      public static const const_998:String = "WN_PARENT_RELOCATED";
      
      public static const const_394:String = "WN_PARAM_UPDATED";
      
      public static const const_514:String = "WN_PARENT_ACTIVATED";
      
      public static const const_180:String = "WN_RESIZED";
      
      public static const const_908:String = "WN_CLOSE";
      
      public static const const_951:String = "WN_PARENT_REMOVED";
      
      public static const const_249:String = "WN_CHILD_RELOCATED";
      
      public static const const_731:String = "WN_ENABLED";
      
      public static const const_254:String = "WN_CHILD_RESIZED";
      
      public static const const_896:String = "WN_MINIMIZED";
      
      public static const const_568:String = "WN_DISABLED";
      
      public static const const_194:String = "WN_CHILD_ACTIVATED";
      
      public static const const_429:String = "WN_STATE_UPDATED";
      
      public static const const_656:String = "WN_UNSELECTED";
      
      public static const const_382:String = "WN_STYLE_UPDATED";
      
      public static const const_1516:String = "WN_UPDATE";
      
      public static const const_469:String = "WN_PARENT_ADDED";
      
      public static const const_710:String = "WN_RESIZE";
      
      public static const const_519:String = "WN_CHILD_REMOVED";
      
      public static const const_1530:String = "";
      
      public static const const_813:String = "WN_RESTORED";
      
      public static const const_335:String = "WN_SELECTED";
      
      public static const const_823:String = "WN_MINIMIZE";
      
      public static const const_937:String = "WN_FOCUSED";
      
      public static const const_1205:String = "WN_LOCK";
      
      public static const const_328:String = "WN_CHILD_ADDED";
      
      public static const const_825:String = "WN_UNFOCUSED";
      
      public static const const_357:String = "WN_RELOCATED";
      
      public static const const_840:String = "WN_DEACTIVATE";
      
      public static const const_1387:String = "WN_CRETAE";
      
      public static const const_869:String = "WN_RESTORE";
      
      public static const const_297:String = "WN_ACTVATED";
      
      public static const const_1195:String = "WN_LOCKED";
      
      public static const const_468:String = "WN_SELECT";
      
      public static const const_995:String = "WN_MAXIMIZE";
      
      public static const const_871:String = "WN_OPEN";
      
      public static const const_521:String = "WN_UNSELECT";
      
      public static const const_1597:String = "WN_ARRANGE";
      
      public static const const_1224:String = "WN_UNLOCKED";
      
      public static const const_1520:String = "WN_UPDATED";
      
      public static const const_804:String = "WN_ACTIVATE";
      
      public static const const_1216:String = "WN_UNLOCK";
      
      public static const const_893:String = "WN_MAXIMIZED";
      
      public static const const_888:String = "WN_DESTROYED";
      
      public static const const_816:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1610,cancelable);
      }
   }
}
