package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarActionUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarEditorUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetCreditBalanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetDanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFrameUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetHabboClubUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetSettingsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetToolbarClickedUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetTutorialEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEffectsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetWaveUpdateEvent;
   import com.sulake.habbo.widget.memenu.enum.HabboMeMenuTrackingEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSelectOutfitMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetToolbarMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class MeMenuWidget extends RoomWidgetBase
   {
      
      public static const const_651:String = "me_menu_settings_view";
      
      public static const const_522:String = "me_menu_effects_view";
      
      public static const const_132:String = "me_menu_top_view";
      
      public static const const_1402:String = "me_menu_rooms_view";
      
      public static const const_827:String = "me_menu_dance_moves_view";
      
      public static const const_296:String = "me_menu_my_clothes_view";
       
      
      private var var_1939:Boolean = false;
      
      private var var_388:Boolean = false;
      
      private var var_1473:int = 0;
      
      private var _eventDispatcher:IEventDispatcher;
      
      private var var_1474:int = 0;
      
      private var var_1938:int = 0;
      
      private var var_1942:Boolean = false;
      
      private var var_256:Boolean = false;
      
      private var var_1941:int = 0;
      
      private var var_1892:Number = 0;
      
      private var _mainContainer:IWindowContainer;
      
      private var var_583:Boolean = false;
      
      private var _config:IHabboConfigurationManager;
      
      private var var_1226:int = 0;
      
      private var var_1940:Boolean = false;
      
      private var var_1017:Point;
      
      private var var_36:IMeMenuView;
      
      public function MeMenuWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IEventDispatcher, param5:IHabboConfigurationManager)
      {
         super(param1,param2,param3);
         _config = param5;
         var_1017 = new Point(0,0);
         _eventDispatcher = param4;
         if(param5 != null && false)
         {
            var_1940 = param5.getKey("client.news.embed.enabled","false") == "RoomReadyMessageParser";
         }
         changeView(const_132);
         hide();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetWaveUpdateEvent.const_592,onWaveEvent);
         param1.addEventListener(RoomWidgetDanceUpdateEvent.const_574,onDanceEvent);
         param1.addEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_627,onUpdateEffects);
         param1.addEventListener(RoomWidgetToolbarClickedUpdateEvent.const_695,onToolbarClicked);
         param1.addEventListener(RoomWidgetFrameUpdateEvent.const_316,onUpdate);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_569,onAvatarEditorClosed);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_233,onAvatarDeselected);
         param1.addEventListener(RoomWidgetHabboClubUpdateEvent.const_210,onHabboClubEvent);
         param1.addEventListener(RoomWidgetAvatarActionUpdateEvent.const_696,onAvatarActionEvent);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_196,onUserInfo);
         param1.addEventListener(RoomWidgetSettingsUpdateEvent.const_308,onSettingsUpdate);
         param1.addEventListener(RoomWidgetTutorialEvent.const_102,onTutorialEvent);
         param1.addEventListener(RoomWidgetTutorialEvent.const_456,onTutorialEvent);
         param1.addEventListener(RoomWidgetCreditBalanceUpdateEvent.const_158,onCreditBalance);
         super.registerUpdateEvents(param1);
      }
      
      private function onUpdate(param1:Event = null) : void
      {
         if(!var_388)
         {
            return;
         }
      }
      
      override public function get mainWindow() : IWindow
      {
         return _mainContainer;
      }
      
      public function get hasEffectOn() : Boolean
      {
         return var_583;
      }
      
      private function onSettingsUpdate(param1:RoomWidgetSettingsUpdateEvent) : void
      {
         if(!var_256)
         {
            return;
         }
         if(var_36.window.name == const_651)
         {
            (var_36 as MeMenuSettingsView).updateSettings(param1);
         }
      }
      
      public function get isHabboClubActive() : Boolean
      {
         return var_1226 > 0;
      }
      
      private function onWaveEvent(param1:RoomWidgetWaveUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Wave Event received");
      }
      
      private function onCreditBalance(param1:RoomWidgetCreditBalanceUpdateEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var_1474 = param1.balance;
         localizations.registerParameter("widget.memenu.credits","credits",var_1474.toString());
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(!(var_256 && var_36.window.name == const_296))
         {
            _loc2_ = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.const_534);
            if(messageListener != null)
            {
               messageListener.processWidgetMessage(_loc2_);
            }
         }
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetWaveUpdateEvent.const_592,onWaveEvent);
         param1.removeEventListener(RoomWidgetDanceUpdateEvent.const_574,onDanceEvent);
         param1.removeEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_627,onUpdateEffects);
         param1.removeEventListener(RoomWidgetToolbarClickedUpdateEvent.const_695,onToolbarClicked);
         param1.removeEventListener(RoomWidgetFrameUpdateEvent.const_316,onUpdate);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_233,onAvatarDeselected);
         param1.removeEventListener(RoomWidgetHabboClubUpdateEvent.const_210,onHabboClubEvent);
         param1.removeEventListener(RoomWidgetAvatarActionUpdateEvent.const_696,onAvatarActionEvent);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_569,onAvatarEditorClosed);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_196,onUserInfo);
         param1.removeEventListener(RoomWidgetSettingsUpdateEvent.const_308,onSettingsUpdate);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_456,onTutorialEvent);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_102,onTutorialEvent);
         param1.removeEventListener(RoomWidgetCreditBalanceUpdateEvent.const_158,onCreditBalance);
      }
      
      override public function dispose() : void
      {
         hide();
         _eventDispatcher = null;
         if(var_36 != null)
         {
            var_36.dispose();
            var_36 = null;
         }
         super.dispose();
      }
      
      public function get allowHabboClubDances() : Boolean
      {
         return var_1939;
      }
      
      public function get creditBalance() : int
      {
         return var_1474;
      }
      
      public function changeToOutfit(param1:int) : void
      {
         var_1892 = new Date().valueOf();
         this.messageListener.processWidgetMessage(new RoomWidgetSelectOutfitMessage(param1));
      }
      
      private function onTutorialEvent(param1:RoomWidgetTutorialEvent) : void
      {
         switch(param1.type)
         {
            case RoomWidgetTutorialEvent.const_456:
               Logger.log("* MeMenuWidget: onHighlightClothesIcon " + var_256 + " view: " + var_36.window.name);
               if(var_256 != true || var_36.window.name != const_132)
               {
                  return;
               }
               (var_36 as MeMenuMainView).setIconAssets("clothes_icon",const_132,"clothes_highlighter_blue");
               break;
            case RoomWidgetTutorialEvent.const_102:
               hide();
         }
      }
      
      public function get isDancing() : Boolean
      {
         return var_1942;
      }
      
      public function canChangeOutfit() : Boolean
      {
         var _loc1_:Number = new Date().valueOf();
         return _loc1_ - var_1892 > 5000;
      }
      
      public function get habboClubPeriods() : int
      {
         return var_1938;
      }
      
      private function onAvatarActionEvent(param1:RoomWidgetAvatarActionUpdateEvent) : void
      {
         switch(param1.actionType)
         {
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_ACTIVE:
               var_583 = true;
               break;
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_INACTIVE:
               var_583 = false;
               break;
            default:
               trace("MeMenuWidget: unknown avatar action event: " + param1.actionType);
         }
      }
      
      private function onHabboClubEvent(param1:RoomWidgetHabboClubUpdateEvent) : void
      {
         var _loc2_:* = param1.daysLeft != var_1226;
         var_1226 = param1.daysLeft;
         var_1938 = param1.periodsLeft;
         var_1941 = param1.pastPeriods;
         var_1939 = param1.allowClubDances;
         _loc2_ = Boolean(_loc2_ || param1.clubLevel != var_1473);
         var_1473 = param1.clubLevel;
         if(_loc2_)
         {
            if(var_36 != null)
            {
               changeView(var_36.window.name);
            }
         }
      }
      
      public function set isDancing(param1:Boolean) : void
      {
         var_1942 = param1;
      }
      
      private function onAvatarDeselected(param1:Event) : void
      {
         if(var_36 != null && var_36.window.name != const_296)
         {
            hide();
         }
      }
      
      public function get mainContainer() : IWindowContainer
      {
         if(_mainContainer == null)
         {
            _mainContainer = windowManager.createWindow("me_menu_main_container","",HabboWindowType.const_1276,HabboWindowStyle.const_841,HabboWindowParam.const_41,new Rectangle(0,0,170,260)) as IWindowContainer;
            _mainContainer.tags.push("room_widget_me_menu");
         }
         return _mainContainer;
      }
      
      private function onUpdateEffects(param1:RoomWidgetUpdateEffectsUpdateEvent) : void
      {
         var _loc2_:* = null;
         var_583 = false;
         for each(_loc2_ in param1.effects)
         {
            if(_loc2_.isInUse)
            {
               var_583 = true;
            }
         }
         if(var_36 != null && var_36.window.name == const_522)
         {
            (var_36 as MeMenuEffectsView).updateEffects(param1.effects);
         }
      }
      
      public function get habboClubPastPeriods() : int
      {
         return var_1941;
      }
      
      public function get habboClubDays() : int
      {
         return var_1226;
      }
      
      public function updateSize() : void
      {
         if(var_36 != null)
         {
            var_1017.x = var_36.window.width + 10;
            var_1017.y = var_36.window.height;
            var_36.window.x = 5;
            var_36.window.y = 0;
            _mainContainer.width = var_1017.x;
            _mainContainer.height = var_1017.y;
         }
      }
      
      private function onToolbarClicked(param1:RoomWidgetToolbarClickedUpdateEvent) : void
      {
         switch(param1.iconType)
         {
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ME_MENU:
               var_256 = !var_256;
               break;
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ROOM_INFO:
               var_256 = false;
               break;
            default:
               return;
         }
         if(var_256)
         {
            show();
         }
         else
         {
            hide();
         }
      }
      
      private function onDanceEvent(param1:RoomWidgetDanceUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Dance Event received, style: " + param1.style);
      }
      
      public function hide(param1:RoomWidgetRoomObjectUpdateEvent = null) : void
      {
         var _loc2_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_616);
         _loc2_.window = _mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc2_);
         }
         if(var_36 != null)
         {
            _mainContainer.removeChild(var_36.window);
            var_36.dispose();
            var_36 = null;
         }
         var_256 = false;
         _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_CLOSE));
      }
      
      private function onAvatarEditorClosed(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(var_36 != null && var_36.window.name == const_296)
         {
            changeView(const_132);
         }
      }
      
      public function get isNewsEnabled() : Boolean
      {
         return var_1940;
      }
      
      public function changeView(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case const_132:
               _loc2_ = new MeMenuMainView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DEFAULT));
               break;
            case const_522:
               _loc2_ = new MeMenuEffectsView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_EFFECTS));
               break;
            case const_827:
               _loc2_ = new MeMenuDanceView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DANCE));
               break;
            case const_296:
               _loc2_ = new MeMenuClothesView();
               break;
            case const_1402:
               _loc2_ = new MeMenuRoomsView();
               break;
            case const_651:
               _loc2_ = new MeMenuSettingsView();
               break;
            default:
               Logger.log("Me Menu Change view: unknown view: " + param1);
         }
         if(_loc2_ != null)
         {
            if(var_36 != null)
            {
               _mainContainer.removeChild(var_36.window);
               var_36.dispose();
               var_36 = null;
            }
            var_36 = _loc2_;
            var_36.init(this,param1);
         }
         updateSize();
      }
      
      public function get habboClubLevel() : int
      {
         return var_1473;
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return _config;
      }
      
      private function show() : void
      {
         if(!_mainContainer || true)
         {
            return;
         }
         changeView(const_132);
         var _loc1_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_548);
         _loc1_.window = _mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc1_);
         }
         var_256 = true;
      }
   }
}
