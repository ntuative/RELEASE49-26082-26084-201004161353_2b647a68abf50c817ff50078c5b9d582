package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var var_725:IWindowContainer;
      
      private var var_1039:ITextWindow;
      
      private var var_192:RoomSettingsCtrl;
      
      private var var_1265:IContainerButtonWindow;
      
      private var _window:IWindowContainer;
      
      private var _hideInfoTimer:Timer;
      
      private var var_1268:ITextWindow;
      
      private var var_357:IWindowContainer;
      
      private var var_2032:IWindowContainer;
      
      private var var_2030:ITextWindow;
      
      private var var_864:IWindowContainer;
      
      private var var_1515:IButtonWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_733:ITextWindow;
      
      private var var_1513:IWindowContainer;
      
      private var var_1264:IWindowContainer;
      
      private var var_866:ITextWindow;
      
      private var var_1040:ITextFieldWindow;
      
      private var var_311:IWindowContainer;
      
      private var var_865:ITextWindow;
      
      private var var_1511:IButtonWindow;
      
      private var var_1041:ITextWindow;
      
      private var var_2323:int;
      
      private var var_1269:IContainerButtonWindow;
      
      private var var_867:IWindowContainer;
      
      private var var_1266:ITextWindow;
      
      private var var_1263:IContainerButtonWindow;
      
      private var var_1512:ITextWindow;
      
      private var var_1514:IButtonWindow;
      
      private var var_874:TagRenderer;
      
      private var var_1750:ITextWindow;
      
      private var var_358:RoomEventViewCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_724:ITextWindow;
      
      private var var_262:RoomThumbnailCtrl;
      
      private var var_1267:IContainerButtonWindow;
      
      private var var_2031:IWindowContainer;
      
      private var var_261:IWindowContainer;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_358 = new RoomEventViewCtrl(_navigator);
         var_192 = new RoomSettingsCtrl(_navigator,this,true);
         var_262 = new RoomThumbnailCtrl(_navigator);
         var_874 = new TagRenderer(_navigator);
         _navigator.roomSettingsCtrls.push(this.var_192);
         _hideInfoTimer = new Timer(6000,1);
         _hideInfoTimer.addEventListener(TimerEvent.TIMER,hideInfo);
      }
      
      public function backToRoomSettings() : void
      {
         this.var_192.active = true;
         this.var_358.active = false;
         this.var_262.active = false;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(false)
         {
            return;
         }
         var_1515.visible = param1 == null && _navigator.data.currentRoomOwner;
         var_1514.visible = param1 != null && (_navigator.data.currentRoomOwner || _navigator.data.eventMod);
         var_1513.visible = Util.hasVisibleChildren(var_1513);
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_733.text = param1.roomName;
         var_733.height = NaN;
         _ownerName.text = param1.ownerName;
         var_866.text = param1.description;
         var_874.refreshTags(var_357,param1.tags);
         var_866.visible = false;
         if(param1.description != "")
         {
            var_866.height = NaN;
            var_866.visible = true;
         }
         var _loc3_:* = _navigator.data.currentRoomRating == -1;
         _navigator.refreshButton(var_357,"thumb_up",_loc3_,onThumbUp,0);
         _navigator.refreshButton(var_357,"thumb_down",_loc3_,onThumbDown,0);
         var_2030.visible = _loc3_;
         var_865.visible = !_loc3_;
         var_1512.visible = !_loc3_;
         var_1512.text = "" + _navigator.data.currentRoomRating;
         _navigator.refreshButton(var_357,"home",param2,null,0);
         _navigator.refreshButton(var_357,"favourite",!param2 && _navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(var_357,["room_name","owner_name_cont","tags","room_desc","rating_cont"],var_733.y,0);
         var_357.visible = true;
         var_357.height = Util.getLowestPoint(var_357);
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!_navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      public function dispose() : void
      {
         if(_hideInfoTimer)
         {
            _hideInfoTimer.removeEventListener(TimerEvent.TIMER,hideInfo);
            _hideInfoTimer.reset();
            _hideInfoTimer = null;
         }
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function hideInfo(param1:Event) : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_378,HabboToolbarIconEnum.ROOMINFO,_window,false));
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(_navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(_navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            _navigator.send(new AddFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(_navigator.data.enteredGuestRoom == null || false || false)
         {
            return;
         }
         var_1511.visible = _navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = _navigator.data.isCurrentRoomFavourite();
         var_1265.visible = _navigator.data.canAddFavourite && !_loc2_;
         var_1267.visible = _navigator.data.canAddFavourite && _loc2_;
         var_1269.visible = _navigator.data.canEditRoomSettings && !param1;
         var_1263.visible = _navigator.data.canEditRoomSettings && param1;
         var_1264.visible = Util.hasVisibleChildren(var_1264);
      }
      
      public function open(param1:Boolean) : void
      {
         this._hideInfoTimer.reset();
         this.var_358.active = false;
         this.var_192.active = false;
         this.var_262.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(_navigator.data.enteredGuestRoom.flatId);
         }
         refresh();
         _window.visible = true;
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_50,HabboToolbarIconEnum.ROOMINFO,_window,false));
         _window.parent.activate();
         _window.activate();
         if(!param1)
         {
            this._hideInfoTimer.start();
         }
      }
      
      public function toggle() : void
      {
         this._hideInfoTimer.reset();
         this.var_358.active = false;
         this.var_192.active = false;
         this.var_262.active = false;
         refresh();
         if(true)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_50,HabboToolbarIconEnum.ROOMINFO,_window,false));
            _window.parent.activate();
         }
         else
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_378,HabboToolbarIconEnum.ROOMINFO,_window,false));
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(var_311);
         var_311.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = _navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _navigator.data.settings != null && _loc1_ != null && _loc1_.flatId == _navigator.data.settings.homeRoomId;
         refreshRoomDetails(_loc1_,_loc2_);
         refreshPublicSpaceDetails(_navigator.data.enteredPublicSpace);
         refreshRoomButtons(_loc2_);
         this.var_192.refresh(var_311);
         this.var_262.refresh(var_311);
         Util.moveChildrenToColumn(var_311,["room_details","room_buttons"],0,2);
         var_311.height = Util.getLowestPoint(var_311);
         var_311.visible = true;
         Logger.log("XORP: undefined, undefined, undefined, undefined, undefined");
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         hideInfo(null);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_1040.setSelection(0,var_1040.text.length);
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + _navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + _navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = _navigator.configuration.getKey("user.hash","");
         _navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         _navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         _navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return _navigator.getText("navigator.embed.src");
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(var_261);
         var _loc1_:RoomEventData = _navigator.data.roomEventData;
         refreshEventDetails(_loc1_);
         refreshEventButtons(_loc1_);
         this.var_358.refresh(var_261);
         if(Util.hasVisibleChildren(var_261) && !this.var_262.active)
         {
            Util.moveChildrenToColumn(var_261,["event_details","event_buttons"],0,2);
            var_261.height = Util.getLowestPoint(var_261);
            var_261.visible = true;
         }
         else
         {
            var_261.visible = false;
         }
         Logger.log("EVENT: undefined, undefined");
      }
      
      public function startEventEdit() : void
      {
         this._hideInfoTimer.reset();
         this.var_358.active = true;
         this.var_192.active = false;
         this.var_262.active = false;
         this.reload();
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         _navigator.send(new DeleteFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         _hideInfoTimer.reset();
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_1039.text = _navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         var_1039.height = NaN;
         var_1268.text = _navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         var_1268.height = NaN;
         Util.moveChildrenToColumn(var_725,["public_space_name","public_space_desc"],var_1039.y,0);
         var_725.visible = true;
         var_725.height = Math.max(86,Util.getLowestPoint(var_725));
      }
      
      public function reload() : void
      {
         if(_window != null && false)
         {
            refresh();
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = _window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = _navigator.configuration.getKey("embed.showInRoomInfo","false") == "RoomReadyMessageParser";
         if(_loc1_ && true && true && true)
         {
            var_867.visible = true;
            var_1040.text = this.getEmbedData();
         }
         else
         {
            var_867.visible = false;
         }
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this._hideInfoTimer.reset();
         this.var_192.load(param1);
         this.var_192.active = true;
         this.var_358.active = false;
         this.var_262.active = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this._hideInfoTimer.reset();
         this.var_192.active = false;
         this.var_358.active = false;
         this.var_262.active = true;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      private function prepareWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = IWindowContainer(_navigator.getXmlWindow("iro_room_details"));
         _window.setParamFlag(HabboWindowParam.const_74,false);
         _window.setParamFlag(HabboWindowParam.const_1287,true);
         _window.visible = false;
         var_311 = IWindowContainer(find("room_info"));
         var_357 = IWindowContainer(find("room_details"));
         var_725 = IWindowContainer(find("public_space_details"));
         var_2031 = IWindowContainer(find("owner_name_cont"));
         var_2032 = IWindowContainer(find("rating_cont"));
         var_1264 = IWindowContainer(find("room_buttons"));
         var_733 = ITextWindow(find("room_name"));
         var_1039 = ITextWindow(find("public_space_name"));
         _ownerName = ITextWindow(find("owner_name"));
         var_866 = ITextWindow(find("room_desc"));
         var_1268 = ITextWindow(find("public_space_desc"));
         var_1041 = ITextWindow(find("owner_caption"));
         var_865 = ITextWindow(find("rating_caption"));
         var_2030 = ITextWindow(find("rate_caption"));
         var_1512 = ITextWindow(find("rating_txt"));
         var_261 = IWindowContainer(find("event_info"));
         var_864 = IWindowContainer(find("event_details"));
         var_1513 = IWindowContainer(find("event_buttons"));
         var_1750 = ITextWindow(find("event_name"));
         var_724 = ITextWindow(find("event_desc"));
         var_1265 = IContainerButtonWindow(find("add_favourite_button"));
         var_1267 = IContainerButtonWindow(find("rem_favourite_button"));
         var_1269 = IContainerButtonWindow(find("make_home_button"));
         var_1263 = IContainerButtonWindow(find("unmake_home_button"));
         var_1511 = IButtonWindow(find("room_settings_button"));
         var_1515 = IButtonWindow(find("create_event_button"));
         var_1514 = IButtonWindow(find("edit_event_button"));
         var_867 = IWindowContainer(find("embed_info"));
         var_1266 = ITextWindow(find("embed_info_txt"));
         var_1040 = ITextFieldWindow(find("embed_src_txt"));
         Util.setProcDirectly(var_1265,onAddFavouriteClick);
         Util.setProcDirectly(var_1267,onRemoveFavouriteClick);
         Util.setProcDirectly(var_1511,onRoomSettingsClick);
         Util.setProcDirectly(var_1269,onMakeHomeClick);
         Util.setProcDirectly(var_1263,onUnmakeHomeClick);
         Util.setProcDirectly(var_1515,onEventSettingsClick);
         Util.setProcDirectly(var_1514,onEventSettingsClick);
         Util.setProcDirectly(var_1040,onEmbedSrcClick);
         _navigator.refreshButton(var_1265,"favourite",true,null,0);
         _navigator.refreshButton(var_1267,"favourite",true,null,0);
         _navigator.refreshButton(var_1269,"home",true,null,0);
         _navigator.refreshButton(var_1263,"home",true,null,0);
         _window.findChildByName("close").procedure = onCloseButtonClick;
         Util.setProcDirectly(var_311,onHover);
         Util.setProcDirectly(var_261,onHover);
         var_1041.width = var_1041.textWidth;
         Util.moveChildrenToRow(var_2031,["owner_caption","owner_name"],var_1041.x,var_1041.y,3);
         var_865.width = var_865.textWidth;
         Util.moveChildrenToRow(var_2032,["rating_caption","rating_txt"],var_865.x,var_865.y,3);
         var_1266.height = NaN;
         Util.moveChildrenToColumn(var_867,["embed_info_txt","embed_src_txt"],var_1266.y,2);
         var_867.height = Util.getLowestPoint(var_867) + 5;
         var_2323 = NaN;
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || false)
         {
            return;
         }
         var_1750.text = param1.eventName;
         var_724.text = param1.eventDescription;
         var_874.refreshTags(var_864,[_navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         var_724.visible = false;
         if(param1.eventDescription != "")
         {
            var_724.height = NaN;
            var_724.y = Util.getLowestPoint(var_864) + 2;
            var_724.visible = true;
         }
         var_864.visible = true;
         var_864.height = Util.getLowestPoint(var_864);
      }
      
      private function refresh() : void
      {
         prepareWindow();
         refreshRoom();
         refreshEvent();
         refreshEmbed();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info"],0,2);
         _window.height = Util.getLowestPoint(_window);
         _window.y = _window.desktop.height - 0 - 5;
         Logger.log("MAIN: undefined, undefined, undefined");
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.roomEventData == null)
         {
            if(_navigator.data.currentRoomOwner)
            {
               _navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            startEventEdit();
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         refresh();
      }
      
      public function close() : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_940,HabboToolbarIconEnum.ROOMINFO,_window,false));
         if(_window == null)
         {
            return;
         }
         this._window.visible = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
   }
}
