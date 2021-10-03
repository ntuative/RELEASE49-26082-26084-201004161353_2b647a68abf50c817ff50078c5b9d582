package com.sulake.habbo.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.cfh.data.CallForHelpData;
   import com.sulake.habbo.help.cfh.data.UserRegistry;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.HelpUI;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.help.hotelmerge.HotelMergeUI;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboHelp extends Component implements IHabboHelp
   {
       
      
      private var var_1977:UserRegistry;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_124:TutorialUI;
      
      private var var_705:IHabboLocalizationManager;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_56:HelpUI;
      
      private var var_706:IHabboConfigurationManager;
      
      private var var_199:IHabboToolbar;
      
      private var var_587:HotelMergeUI;
      
      private var var_289:IHabboCommunicationManager;
      
      private var var_845:FaqIndex;
      
      private var var_1727:String = "";
      
      private var var_1043:IncomingMessages;
      
      private var var_1232:CallForHelpData;
      
      public function HabboHelp(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_1232 = new CallForHelpData();
         var_1977 = new UserRegistry();
         super(param1,param2,param3);
         _assetLibrary = param3;
         var_845 = new FaqIndex();
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return var_199;
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(var_56 != null)
         {
            var_56.tellUI(param1,param2);
         }
      }
      
      private function toggleHelpUI() : void
      {
         if(var_56 == null)
         {
            if(!createHelpUI())
            {
               return;
            }
         }
         var_56.toggleUI();
      }
      
      public function removeTutorialUI() : void
      {
         if(var_124 != null)
         {
            var_124.dispose();
            var_124 = null;
         }
      }
      
      public function get ownUserName() : String
      {
         return var_1727;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      override public function dispose() : void
      {
         if(var_56 != null)
         {
            var_56.dispose();
            var_56 = null;
         }
         if(var_124 != null)
         {
            var_124.dispose();
            var_124 = null;
         }
         if(var_587)
         {
            var_587.dispose();
            var_587 = null;
         }
         if(var_845 != null)
         {
            var_845.dispose();
            var_845 = null;
         }
         var_1043 = null;
         if(var_199)
         {
            var_199.release(new IIDHabboToolbar());
            var_199 = null;
         }
         if(var_705)
         {
            var_705.release(new IIDHabboLocalizationManager());
            var_705 = null;
         }
         if(var_289)
         {
            var_289.release(new IIDHabboCommunicationManager());
            var_289 = null;
         }
         if(var_706)
         {
            var_706.release(new IIDHabboConfigurationManager());
            var_706 = null;
         }
         if(_windowManager)
         {
            _windowManager.release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         super.dispose();
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return var_705;
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_100:
               if(var_56 != null)
               {
                  var_56.setRoomSessionStatus(true);
               }
               if(var_124 != null)
               {
                  var_124.setRoomSessionStatus(true);
               }
               break;
            case RoomSessionEvent.const_103:
               if(var_56 != null)
               {
                  var_56.setRoomSessionStatus(false);
               }
               if(var_124 != null)
               {
                  var_124.setRoomSessionStatus(false);
               }
               userRegistry.unregisterRoom();
         }
      }
      
      public function enableCallForGuideBotUI() : void
      {
         if(var_56 != null)
         {
            var_56.updateCallForGuideBotUI(true);
         }
      }
      
      public function get userRegistry() : UserRegistry
      {
         return var_1977;
      }
      
      public function showCallForHelpResult(param1:String) : void
      {
         if(var_56 != null)
         {
            var_56.showCallForHelpResult(param1);
         }
      }
      
      public function initHotelMergeUI() : void
      {
         if(!var_587)
         {
            var_587 = new HotelMergeUI(this);
         }
         var_587.startNameChange();
      }
      
      private function createTutorialUI() : Boolean
      {
         if(var_124 == null && _assetLibrary != null && _windowManager != null)
         {
            var_124 = new TutorialUI(this);
         }
         return var_124 != null;
      }
      
      private function createHelpUI() : Boolean
      {
         if(var_56 == null && _assetLibrary != null && _windowManager != null)
         {
            var_56 = new HelpUI(this,_assetLibrary,_windowManager,var_705,var_199);
         }
         return var_56 != null;
      }
      
      public function get callForHelpData() : CallForHelpData
      {
         return var_1232;
      }
      
      public function reportUser(param1:int, param2:String) : void
      {
         var_1232.reportedUserId = param1;
         var_1232.reportedUserName = param2;
         var_56.showUI(HabboHelpViewEnum.const_312);
      }
      
      public function set ownUserName(param1:String) : void
      {
         var_1727 = param1;
      }
      
      private function setHabboToolbarIcon() : void
      {
         if(var_199 != null)
         {
            var_199.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_110,HabboToolbarIconEnum.HELP));
         }
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationManagerReady);
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_705 = IHabboLocalizationManager(param2);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationManagerReady);
      }
      
      public function updateTutorial(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         if(param1 && param2 && param3)
         {
            removeTutorialUI();
            return;
         }
         if(var_124 == null)
         {
            if(!createTutorialUI())
            {
               return;
            }
         }
         var_124.update(param1,param2,param3);
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_289 = IHabboCommunicationManager(param2);
         var_1043 = new IncomingMessages(this,var_289);
         queueInterface(new IIDHabboToolbar(),onToolbarReady);
      }
      
      public function showUI(param1:String = null) : void
      {
         if(var_56 != null)
         {
            var_56.showUI(param1);
         }
      }
      
      public function hideUI() : void
      {
         if(var_56 != null)
         {
            var_56.hideUI();
         }
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         if(var_289 != null && param1 != null)
         {
            var_289.getHabboMainConnection(null).send(param1);
         }
      }
      
      public function getFaq() : FaqIndex
      {
         return var_845;
      }
      
      public function disableCallForGuideBotUI() : void
      {
         if(var_56 != null)
         {
            var_56.updateCallForGuideBotUI(false);
         }
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_199 = IHabboToolbar(param2);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationManagerReady);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_706 = IHabboConfigurationManager(param2);
         queueInterface(new IIDHabboRoomSessionManager(),onRoomSessionManagerReady);
      }
      
      public function get tutorialUI() : TutorialUI
      {
         return var_124;
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_88)
         {
            setHabboToolbarIcon();
            return;
         }
         if(param1.type == HabboToolbarEvent.const_62)
         {
            if(param1.iconId == HabboToolbarIconEnum.HELP)
            {
               toggleHelpUI();
               return;
            }
         }
      }
      
      public function get hotelMergeUI() : HotelMergeUI
      {
         return var_587;
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IRoomSessionManager = IRoomSessionManager(param2);
         _loc3_.events.addEventListener(RoomSessionEvent.const_100,onRoomSessionEvent);
         _loc3_.events.addEventListener(RoomSessionEvent.const_103,onRoomSessionEvent);
         var_199.events.addEventListener(HabboToolbarEvent.const_88,onHabboToolbarEvent);
         var_199.events.addEventListener(HabboToolbarEvent.const_62,onHabboToolbarEvent);
         createHelpUI();
         setHabboToolbarIcon();
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         if(var_56 != null)
         {
            var_56.showCallForHelpReply(param1);
         }
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         if(var_706 == null)
         {
            return param1;
         }
         return var_706.getKey(param1,param2,param3);
      }
   }
}
