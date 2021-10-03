package com.sulake.habbo.messenger
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.SendMsgMessageComposer;
   import com.sulake.habbo.messenger.domain.Conversation;
   import com.sulake.habbo.messenger.domain.Message;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.ui.Keyboard;
   import flash.utils.Timer;
   
   public class MessengerView implements IDisposable
   {
       
      
      private var var_900:ConversationsTabView;
      
      private var _disposed:Boolean = false;
      
      private var var_138:HabboMessenger;
      
      private var var_1316:ConversationView;
      
      private var var_13:IFrameWindow;
      
      private var var_434:Timer;
      
      private var var_703:ITextFieldWindow;
      
      public function MessengerView(param1:HabboMessenger)
      {
         super();
         var_138 = param1;
         var_434 = new Timer(300,1);
         var_434.addEventListener(TimerEvent.TIMER,onResizeTimer);
      }
      
      public function addMsgToView(param1:Conversation, param2:Message) : void
      {
         if(var_13 == null)
         {
            return;
         }
         if(!param1.selected)
         {
            return;
         }
         var_1316.addMessage(param2);
      }
      
      private function onMessageInput(param1:Event) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc2_:IWindow = IWindow(param1.target);
         if(!(param1 is WindowKeyboardEvent))
         {
            return;
         }
         var _loc3_:WindowKeyboardEvent = param1 as WindowKeyboardEvent;
         if(_loc3_.charCode == Keyboard.ENTER)
         {
            sendMsg();
         }
         else
         {
            _loc4_ = 120;
            _loc5_ = "null";
            if(_loc5_.length > _loc4_)
            {
               var_703.text = _loc5_.substring(0,_loc4_);
            }
         }
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Close window");
         var_13.visible = false;
      }
      
      private function onResizeTimer(param1:TimerEvent) : void
      {
         Logger.log("XXX RESIZE XXX");
         this.var_1316.afterResize();
         this.var_900.refresh();
      }
      
      private function sendMsg() : void
      {
         var _loc1_:String = "null";
         Logger.log("Send msg: " + _loc1_);
         if(_loc1_ == "")
         {
            Logger.log("No text...");
            return;
         }
         var _loc2_:Conversation = var_138.conversations.findSelectedConversation();
         if(_loc2_ == null)
         {
            Logger.log("No conversation...");
            return;
         }
         var_138.send(new SendMsgMessageComposer(_loc2_.id,_loc1_));
         var_703.text = "";
         var_138.conversations.addMessageAndUpdateView(new Message(Message.const_734,_loc2_.id,_loc1_,Util.getFormattedNow()));
      }
      
      public function refresh(param1:Boolean) : void
      {
         if(var_13 == null)
         {
            return;
         }
         var _loc2_:Conversation = var_138.conversations.findSelectedConversation();
         var_13.caption = _loc2_ == null ? "" : _loc2_.name;
         var_900.refresh();
         var_1316.refresh();
         if(var_138.conversations.openConversations.length < 1)
         {
            var_13.visible = false;
            var_138.setHabboToolbarIcon(false,false);
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(var_434)
            {
               var_434.stop();
               var_434.removeEventListener(TimerEvent.TIMER,onResizeTimer);
               var_434 = null;
            }
            var_138 = null;
            _disposed = true;
         }
      }
      
      public function openMessenger() : void
      {
         if(var_138.conversations.openConversations.length < 1)
         {
            return;
         }
         if(var_13 == null)
         {
            prepareContent();
            refresh(true);
            var_138.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_50,HabboToolbarIconEnum.MESSENGER,var_13));
         }
         else
         {
            refresh(true);
            var_13.visible = true;
            var_13.activate();
         }
      }
      
      public function getTabCount() : int
      {
         return this.var_900 == null ? 7 : int(this.var_900.getTabCount());
      }
      
      public function isMessengerOpen() : Boolean
      {
         return var_13 != null && false;
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
      
      public function close() : void
      {
         if(var_13 != null)
         {
            var_13.visible = false;
         }
      }
      
      private function prepareContent() : void
      {
         var_13 = IFrameWindow(var_138.getXmlWindow("main_window"));
         var _loc1_:IWindow = var_13.findChildByTag("close");
         _loc1_.procedure = onWindowClose;
         var_13.procedure = onWindow;
         var_13.title.color = 4294623744;
         var_13.title.textColor = 4287851525;
         var_900 = new ConversationsTabView(var_138,var_13);
         var_900.refresh();
         var_703 = ITextFieldWindow(var_13.findChildByName("message_input"));
         var_703.addEventListener(WindowKeyboardEvent.const_148,onMessageInput);
         var_1316 = new ConversationView(var_138,var_13);
         var_13.scaler.setParamFlag(HabboWindowParam.const_589,false);
         var_13.scaler.setParamFlag(HabboWindowParam.const_983,true);
      }
   }
}
