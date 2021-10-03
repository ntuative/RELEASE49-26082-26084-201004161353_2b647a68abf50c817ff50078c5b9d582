package com.sulake.habbo.navigator.mainview
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ISelectableWindow;
   import com.sulake.core.window.components.ITabButtonWindow;
   import com.sulake.core.window.components.ITabContextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.navigator.GetOfficialRoomsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.GetPopularRoomTagsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.LatestEventsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyFavouriteRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyFriendsRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyRoomHistorySearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.PopularRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomTagSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomTextSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomsWhereMyFriendsAreSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomsWithHighestScoreSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.session.QuitMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.IViewCtrl;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.domain.Tab;
   import com.sulake.habbo.navigator.domain.Tabs;
   import com.sulake.habbo.navigator.events.HabboNavigatorTrackingEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class MainViewCtrl implements IUpdateReceiver, IDisposable
   {
      
      public static const const_556:int = 2;
      
      public static const const_932:int = 4;
      
      private static const const_502:int = 2;
      
      private static const const_798:int = 1;
      
      public static const const_1570:int = 3;
      
      private static const const_1140:int = 4;
      
      private static const SCROLLBAR_WIDTH:int = 22;
      
      public static const const_391:int = 1;
      
      private static const const_799:int = 3;
       
      
      private var var_2263:int = 0;
      
      private var _disposed:Boolean = false;
      
      private var var_1374:IRegionWindow;
      
      private var var_450:int;
      
      private var var_1376:Boolean = true;
      
      private var var_768:GuestRoomListCtrl;
      
      private var var_13:IFrameWindow;
      
      private var var_434:Timer;
      
      private var var_282:IWindowContainer;
      
      private var var_207:IWindowContainer;
      
      private var var_240:IWindowContainer;
      
      private var var_1372:IWindow;
      
      private var var_1375:Boolean;
      
      private var var_934:OfficialRoomListCtrl;
      
      private var var_19:IWindowContainer;
      
      private var var_767:PopularTagsListCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_1373:int = 0;
      
      private var var_229:ITabContextWindow;
      
      public function MainViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_767 = new PopularTagsListCtrl(_navigator);
         var_768 = new GuestRoomListCtrl(_navigator);
         var_934 = new OfficialRoomListCtrl(_navigator);
         var_434 = new Timer(300,1);
         var_434.addEventListener(TimerEvent.TIMER,onResizeTimer);
      }
      
      private function getSearchMsg(param1:int, param2:String) : IMessageComposer
      {
         if(param1 == Tabs.const_606)
         {
            return new MyFavouriteRoomsSearchMessageComposer();
         }
         if(param1 == Tabs.const_512)
         {
            return new MyFriendsRoomsSearchMessageComposer();
         }
         if(param1 == Tabs.const_535)
         {
            return new MyRoomHistorySearchMessageComposer();
         }
         if(param1 == Tabs.const_230)
         {
            return new MyRoomsSearchMessageComposer();
         }
         if(param1 == Tabs.const_294)
         {
            return new PopularRoomsSearchMessageComposer(param2);
         }
         if(param1 == Tabs.const_713)
         {
            return new RoomsWhereMyFriendsAreSearchMessageComposer();
         }
         if(param1 == Tabs.const_615)
         {
            return new RoomsWithHighestScoreSearchMessageComposer();
         }
         if(param1 == Tabs.const_334)
         {
            return new RoomTagSearchMessageComposer(param2);
         }
         if(param1 == Tabs.const_205)
         {
            return new RoomTextSearchMessageComposer(param2);
         }
         if(param1 == Tabs.const_412)
         {
            return new LatestEventsSearchMessageComposer(param2);
         }
         Logger.log("No message for searchType: " + param1);
         return null;
      }
      
      private function prepare() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var_13 = IFrameWindow(_navigator.getXmlWindow("grs_main_window"));
         var_229 = ITabContextWindow(var_13.findChildByName("tab_context"));
         var_19 = IWindowContainer(var_13.findChildByName("tab_content"));
         var_240 = IWindowContainer(var_13.findChildByName("custom_content"));
         var_207 = IWindowContainer(var_13.findChildByName("list_content"));
         var_282 = IWindowContainer(var_13.findChildByName("custom_footer"));
         var_1372 = var_13.findChildByName("loading_text");
         var _loc1_:IWindow = var_13.findChildByTag("close");
         _loc1_.procedure = onWindowClose;
         var_1374 = IRegionWindow(var_13.findChildByName("to_hotel_view"));
         var_1374.procedure = onHotelView;
         method_4(false);
         var_13.procedure = onWindow;
         for each(_loc2_ in _navigator.tabs.tabs)
         {
            _loc3_ = var_229.getTabItemByID(_loc2_.id);
            _loc3_.setParamFlag(HabboWindowParam.const_43,true);
            _loc3_.procedure = onTabClick;
            _loc2_.button = _loc3_;
         }
         var_13.scaler.setParamFlag(HabboWindowParam.const_589,false);
         var_13.scaler.setParamFlag(HabboWindowParam.const_1396,true);
      }
      
      public function get mainWindow() : IFrameWindow
      {
         return var_13;
      }
      
      private function onTabClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_58)
         {
            return;
         }
         var _loc3_:int = param2.id;
         if(var_1375)
         {
            var_1375 = false;
            return;
         }
         var _loc4_:Tab = _navigator.tabs.getTab(_loc3_);
         _loc4_.sendSearchRequest();
         switch(_loc4_.id)
         {
            case Tabs.const_318:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_EVENTS));
               break;
            case Tabs.const_246:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_ME));
               break;
            case Tabs.const_301:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_OFFICIAL));
               break;
            case Tabs.const_275:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_ROOMS));
               break;
            case Tabs.const_197:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCH));
         }
      }
      
      private function refreshScrollbar(param1:IViewCtrl) : void
      {
         if(param1.content == null || !param1.content.visible)
         {
            return;
         }
         var _loc2_:IItemListWindow = IItemListWindow(param1.content.findChildByName("item_list"));
         var _loc3_:IWindow = param1.content.findChildByName("scroller");
         var _loc4_:* = _loc2_.scrollableRegion.height > _loc2_.height;
         if(_loc3_.visible)
         {
            if(_loc4_)
            {
               return;
            }
            _loc3_.visible = false;
            _loc2_.width += SCROLLBAR_WIDTH;
         }
         else
         {
            if(!_loc4_)
            {
               return;
            }
            _loc3_.visible = true;
            _loc2_.width -= SCROLLBAR_WIDTH;
         }
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Close window");
         this.close();
      }
      
      private function sendTrackingEvent(param1:int) : void
      {
         switch(param1)
         {
            case Tabs.const_412:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_LATEST_EVENTS));
               break;
            case Tabs.const_606:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FAVOURITES));
               break;
            case Tabs.const_512:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FRIENDS_ROOMS));
               break;
            case Tabs.const_535:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_HISTORY));
               break;
            case Tabs.const_230:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_ROOMS));
               break;
            case Tabs.const_621:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_OFFICIALROOMS));
               break;
            case Tabs.const_294:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_POPULAR_ROOMS));
               break;
            case Tabs.const_713:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WHERE_MY_FRIENDS_ARE));
               break;
            case Tabs.const_615:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WITH_HIGHEST_SCORE));
               break;
            case Tabs.const_334:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TAG_SEARCH));
               break;
            case Tabs.const_205:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TEXT_SEARCH));
         }
      }
      
      private function refreshList(param1:Boolean, param2:Boolean, param3:IViewCtrl, param4:String) : void
      {
         var _loc5_:* = null;
         if(!param2)
         {
            return;
         }
         if(param3.content == null)
         {
            _loc5_ = var_207.getChildByName(param4);
            param3.content = IWindowContainer(_loc5_);
         }
         if(param1)
         {
            param3.refresh();
         }
         param3.content.visible = true;
      }
      
      public function isOpen() : Boolean
      {
         return var_13 != null && false;
      }
      
      private function refreshListContent(param1:Boolean) : void
      {
         Util.hideChildren(var_207);
         refreshGuestRooms(param1,_navigator.data.guestRoomSearchArrived);
         refreshPopularTags(param1,_navigator.data.popularTagsArrived);
         refreshOfficialRooms(param1,_navigator.data.officialRoomsArrived);
      }
      
      private function onResizeTimer(param1:TimerEvent) : void
      {
         refreshScrollbar(var_767);
         refreshScrollbar(var_768);
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function stretchNewEntryIfNeeded(param1:IViewCtrl, param2:IWindowContainer) : void
      {
         var _loc3_:IWindow = param1.content.findChildByName("scroller");
         if(_loc3_.visible)
         {
            return;
         }
         param2.width += SCROLLBAR_WIDTH;
      }
      
      public function startSearch(param1:int, param2:int, param3:String = "-1", param4:int = 1) : void
      {
         var _loc5_:Tab = _navigator.tabs.getSelected();
         _navigator.tabs.setSelectedTab(param1);
         var _loc6_:Tab = _navigator.tabs.getSelected();
         ErrorReportStorage.addDebugData("StartSearch","Start search " + _loc5_.id + " => " + _loc6_.id);
         this.var_1376 = _loc5_ != _loc6_;
         if(_loc5_ != _loc6_)
         {
            _loc6_.tabPageDecorator.tabSelected();
         }
         _navigator.data.startLoading();
         if(param4 == const_391)
         {
            _navigator.send(getSearchMsg(param2,param3));
         }
         else if(param4 == const_556)
         {
            _navigator.send(new GetPopularRoomTagsMessageComposer());
         }
         else
         {
            _navigator.send(new GetOfficialRoomsMessageComposer());
         }
         if(!isOpen())
         {
            open();
            this.var_450 = const_502;
            this.var_207.blend = 0;
            if(this.var_240.visible)
            {
               this.var_240.blend = 0;
               this.var_282.blend = 0;
            }
         }
         else
         {
            this.var_450 = const_798;
         }
         this.var_1373 = 0;
         _navigator.registerUpdateReceiver(this,2);
         sendTrackingEvent(param2);
      }
      
      private function refreshCustomContent() : void
      {
         Util.hideChildren(var_240);
         var _loc1_:Tab = _navigator.tabs.getSelected();
         _loc1_.tabPageDecorator.refreshCustomContent(var_240);
         if(Util.hasVisibleChildren(var_240))
         {
            var_240.visible = true;
         }
         else
         {
            var_240.visible = false;
            var_240.blend = 1;
         }
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            _disposed = true;
            _navigator = null;
            if(var_13)
            {
               var_13.dispose();
               var_13 = null;
            }
            if(var_19)
            {
               var_19.dispose();
               var_19 = null;
            }
            if(var_434)
            {
               var_434.removeEventListener(TimerEvent.TIMER,onResizeTimer);
               var_434.reset();
               var_434 = null;
            }
            if(var_767)
            {
               var_767.dispose();
               var_767 = null;
            }
            if(var_768)
            {
               var_768.dispose();
               var_768 = null;
            }
            if(var_934)
            {
               var_934.dispose();
               var_934 = null;
            }
         }
      }
      
      private function onWindow(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_46 || param2 != var_13)
         {
            return;
         }
         if(!this.var_434.running)
         {
            this.var_434.reset();
            this.var_434.start();
         }
      }
      
      private function refreshOfficialRooms(param1:Boolean, param2:Boolean) : void
      {
         refreshList(param1,param2,var_934,"official_rooms");
      }
      
      private function refreshGuestRooms(param1:Boolean, param2:Boolean) : void
      {
         refreshList(param1,param2,var_768,"guest_rooms");
      }
      
      private function refreshTab() : void
      {
         var _loc1_:Tab = _navigator.tabs.getSelected();
         var _loc2_:ISelectableWindow = var_229.selector.getSelected();
         if(_loc1_.button != _loc2_)
         {
            var_1375 = true;
            var_229.selector.setSelected(_loc1_.button);
         }
      }
      
      private function refreshPopularTags(param1:Boolean, param2:Boolean) : void
      {
         refreshList(param1,param2,var_767,"popular_tags");
      }
      
      public function onNavigatorToolBarIconClick() : Boolean
      {
         if(isOpen())
         {
            close();
            return false;
         }
         var _loc1_:Tab = _navigator.tabs.getSelected();
         _loc1_.tabPageDecorator.navigatorOpenedWhileInTab();
         return true;
      }
      
      public function open() : void
      {
         var _loc1_:Boolean = false;
         if(this.var_13 == null)
         {
            prepare();
            _loc1_ = true;
         }
         refresh();
         var_13.visible = true;
         var_13.activate();
         if(_loc1_)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_50,HabboToolbarIconEnum.NAVIGATOR,var_13));
         }
      }
      
      private function refreshFooter() : void
      {
         Util.hideChildren(var_282);
         var _loc1_:Tab = _navigator.tabs.getSelected();
         _loc1_.tabPageDecorator.refreshFooter(var_282);
         if(Util.hasVisibleChildren(var_282))
         {
            var_282.visible = true;
         }
         else
         {
            var_282.visible = false;
         }
      }
      
      public function reloadRoomList(param1:int) : Boolean
      {
         ErrorReportStorage.addDebugData("MainViewCtrl","Reloading RoomList");
         if(this.isOpen() && this._navigator.data.guestRoomSearchResults != null && this._navigator.data.guestRoomSearchResults.searchType == param1)
         {
            startSearch(_navigator.tabs.getSelected().id,param1,"");
            return true;
         }
         return false;
      }
      
      private function onHotelView(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            method_4(true);
         }
         else if(param1.type == WindowMouseEvent.const_32)
         {
            method_4(false);
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            _navigator.send(new QuitMessageComposer());
         }
      }
      
      public function refresh() : void
      {
         if(var_13 == null)
         {
            return;
         }
         refreshTab();
         refreshCustomContent();
         refreshListContent(true);
         refreshFooter();
         var_240.height = Util.getLowestPoint(var_240);
         var_282.height = Util.getLowestPoint(var_282);
         var _loc1_:int = 0;
         Util.moveChildrenToColumn(var_19,["custom_content","list_content"],var_240.y,8);
         var_207.height = var_207.height + _loc1_ - 0 - 0 + var_2263;
         Util.moveChildrenToColumn(var_19,["list_content","custom_footer"],var_207.y,8);
         var_2263 = var_282.height;
         onResizeTimer(null);
      }
      
      public function update(param1:uint) : void
      {
         var _loc3_:Number = NaN;
         if(this.var_207 == null)
         {
            return;
         }
         var _loc2_:Number = param1 / 150;
         if(var_450 == const_798)
         {
            _loc3_ = Math.min(1,Math.max(0,this.var_207.blend - _loc2_));
            this.var_207.blend = _loc3_;
            this.var_240.blend = !!var_1376 ? Number(_loc3_) : Number(1);
            this.var_282.blend = !!var_1376 ? Number(_loc3_) : Number(1);
            if(_loc3_ == 0)
            {
               var_450 = const_502;
            }
         }
         else if(var_450 == const_502)
         {
            if(var_1373 % 10 == 1)
            {
               var_1372.visible = true;
            }
            ++var_1373;
            if(!_navigator.data.isLoading())
            {
               var_450 = const_799;
            }
         }
         else if(var_450 == const_799)
         {
            this.refresh();
            var_450 = const_1140;
         }
         else
         {
            var_1372.visible = false;
            _loc3_ = Math.min(1,Math.max(0,this.var_207.blend + _loc2_));
            this.var_207.blend = _loc3_;
            this.var_240.blend = !!var_1376 ? Number(_loc3_) : Number(1);
            this.var_282.blend = !!var_1376 ? Number(_loc3_) : Number(1);
            if(false)
            {
               _navigator.removeUpdateReceiver(this);
            }
         }
      }
      
      private function method_4(param1:Boolean) : void
      {
         _navigator.refreshButton(var_1374,"icon_hotelview",!param1,null,0);
         _navigator.refreshButton(var_1374,"icon_hotelview_reactive",param1,null,0);
      }
      
      public function close() : void
      {
         if(var_13 != null)
         {
            var_13.visible = false;
         }
      }
   }
}
