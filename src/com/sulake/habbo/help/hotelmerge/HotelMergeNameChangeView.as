package com.sulake.habbo.help.hotelmerge
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.avatar.ChangeUserNameResultMessageEvent;
   import com.sulake.habbo.help.tutorial.NameSuggestionListRenderer;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   
   public class HotelMergeNameChangeView
   {
      
      private static var var_1447:uint = 13232628;
      
      private static var var_1847:uint = 11129827;
       
      
      private var var_1209:String;
      
      private var var_822:Boolean = false;
      
      private var var_571:IWindowContainer;
      
      private var var_823:NameSuggestionListRenderer;
      
      private var _window:IFrameWindow;
      
      private var var_273:IWindowContainer;
      
      private var var_347:String;
      
      private var var_1208:IWindowContainer;
      
      private var var_47:HotelMergeUI;
      
      private var var_36:IWindowContainer;
      
      public function HotelMergeNameChangeView(param1:HotelMergeUI)
      {
         super();
         var_47 = param1;
      }
      
      public function setNameAvailableView() : void
      {
         if(_window == null)
         {
            return;
         }
         nameCheckWaitEnd(true);
         var _loc1_:ITextWindow = _window.findChildByName("info_text") as ITextWindow;
         if(_loc1_ == null)
         {
            return;
         }
         var_47.localization.registerParameter("help.tutorial.name.available","name",var_347);
         _loc1_.text = var_47.localization.getKey("help.tutorial.name.available");
         var _loc2_:ITextFieldWindow = _window.findChildByName("input") as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.text = var_347;
         var _loc3_:IWindowContainer = _window.findChildByName("suggestions") as IWindowContainer;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.visible = false;
      }
      
      private function showView(param1:IWindowContainer) : void
      {
         var_822 = false;
         if(var_36)
         {
            var_36.visible = false;
         }
         var_36 = param1;
         var_36.visible = true;
         if(_window)
         {
            _window.content.width = var_36.width;
            _window.content.height = var_36.height;
         }
      }
      
      private function getName() : String
      {
         var _loc1_:* = null;
         if(_window)
         {
            _loc1_ = _window.findChildByName("input") as ITextFieldWindow;
            if(_loc1_)
            {
               return _loc1_.text;
            }
         }
         return null;
      }
      
      private function nameOut(param1:WindowMouseEvent) : void
      {
         var _loc2_:ITextWindow = param1.target as ITextWindow;
         if(_loc2_ != null)
         {
            _loc2_.color = var_1447;
         }
      }
      
      private function createWindow(param1:String) : IWindow
      {
         var _loc2_:XmlAsset = var_47.assets.getAssetByName(param1) as XmlAsset;
         if(!_loc2_)
         {
            return null;
         }
         return var_47.windowManager.buildFromXML(_loc2_.content as XML);
      }
      
      private function nameSelected(param1:WindowMouseEvent) : void
      {
         nameCheckWaitEnd(true);
         var _loc2_:ITextWindow = param1.target as ITextWindow;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:String = _loc2_.text;
         setNormalView();
         var _loc4_:ITextFieldWindow = _window.findChildByName("input") as ITextFieldWindow;
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.text = _loc3_;
      }
      
      private function nameOver(param1:WindowMouseEvent) : void
      {
         var _loc2_:ITextWindow = param1.target as ITextWindow;
         if(_loc2_ != null)
         {
            _loc2_.color = var_1847;
         }
      }
      
      private function showSelectionView() : void
      {
         if(!var_571)
         {
            var_571 = createWindow("hotel_merge_name_selection_xml") as IWindowContainer;
            if(!var_571)
            {
               return;
            }
            _window.content.addChild(var_571);
         }
         _window.caption = var_47.localization.getKey("hotel_merge.name_change.title.select");
         var _loc1_:IButtonWindow = _window.findChildByName("select_name_button") as IButtonWindow;
         if(_loc1_)
         {
            _loc1_.disable();
         }
         setNormalView();
         showView(var_571);
      }
      
      private function showConfirmationView() : void
      {
         if(!var_273)
         {
            var_273 = createWindow("hotel_merge_name_confirmation_xml") as IWindowContainer;
            if(!var_273)
            {
               return;
            }
            _window.content.addChild(var_273);
         }
         _window.caption = var_47.localization.getKey("hotel_merge.name_change.title.confirm");
         var _loc1_:ITextWindow = var_273.findChildByName("final_name") as ITextWindow;
         if(_loc1_)
         {
            _loc1_.text = var_347;
         }
         showView(var_273);
      }
      
      public function get id() : String
      {
         return TutorialUI.const_234;
      }
      
      public function dispose() : void
      {
         disposeWindow();
         if(var_823 != null)
         {
            var_823.dispose();
            var_823 = null;
         }
      }
      
      private function windowEventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(!var_822)
         {
            if(param1.type == WindowEvent.const_128)
            {
               if(param2.name == "input")
               {
                  _loc3_ = _window.findChildByName("select_name_button");
                  _loc4_ = param2 as ITextFieldWindow;
                  if(_loc3_ && _loc4_)
                  {
                     if(_loc4_.text.length > 2)
                     {
                        _loc3_.enable();
                     }
                     else
                     {
                        _loc3_.disable();
                     }
                  }
               }
            }
         }
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         switch(param2.name)
         {
            case "change_name_button":
               showSelectionView();
               break;
            case "keep_name_button":
               var_347 = var_47.myName;
               showConfirmationView();
               break;
            case "check_name_button":
               var_47.checkName(getName());
               nameCheckWaitBegin();
               break;
            case "select_name_button":
               _loc5_ = getName();
               if(_loc5_.length < 1)
               {
                  return;
               }
               if(var_347 != _loc5_)
               {
                  var_1209 = _loc5_;
                  var_47.checkName(_loc5_);
                  nameCheckWaitBegin();
               }
               else
               {
                  showConfirmationView();
               }
               break;
            case "cancel_selection_button":
               nameCheckWaitEnd(true);
               showMainView();
               break;
            case "confirm_name_button":
               var_47.changeName(var_347);
               break;
            case "cancel_confirmation_button":
               nameCheckWaitEnd(true);
               showMainView();
               break;
            case "header_button_close":
               disposeWindow();
         }
      }
      
      public function showMainView() : void
      {
         if(!_window)
         {
            _window = createWindow("hotel_merge_name_change_xml") as IFrameWindow;
            _window.center();
            _window.procedure = windowEventHandler;
            var_1208 = _window.content.getChildAt(0) as IWindowContainer;
         }
         var_47.localization.registerParameter("hotel_merge.name_change.current","name",var_47.myName);
         _window.caption = var_47.localization.getKey("hotel_merge.name_change.title.main");
         showView(var_1208);
      }
      
      public function setNameNotAvailableView(param1:int, param2:String, param3:Array) : void
      {
         var _loc8_:* = null;
         nameCheckWaitEnd(false);
         if(var_36 != var_571)
         {
            showSelectionView();
         }
         var_1209 = null;
         var_347 = null;
         if(_window == null)
         {
            return;
         }
         var _loc4_:ITextWindow = _window.findChildByName("info_text") as ITextWindow;
         if(_loc4_ == null)
         {
            return;
         }
         switch(param1)
         {
            case ChangeUserNameResultMessageEvent.var_941:
               var_47.localization.registerParameter("help.tutorial.name.taken","name",param2);
               _loc4_.text = var_47.localization.getKey("help.tutorial.name.taken");
               break;
            case ChangeUserNameResultMessageEvent.var_939:
               var_47.localization.registerParameter("help.tutorial.name.invalid","name",param2);
               _loc4_.text = var_47.localization.getKey("help.tutorial.name.invalid");
               break;
            case ChangeUserNameResultMessageEvent.var_938:
               break;
            case ChangeUserNameResultMessageEvent.var_937:
               _loc4_.text = var_47.localization.getKey("help.tutorial.name.long");
               break;
            case ChangeUserNameResultMessageEvent.var_940:
               _loc4_.text = var_47.localization.getKey("help.tutorial.name.short");
               break;
            case ChangeUserNameResultMessageEvent.var_1107:
               _loc4_.text = var_47.localization.getKey("help.tutorial.name.change_not_allowed");
               break;
            case ChangeUserNameResultMessageEvent.var_1108:
               _loc4_.text = var_47.localization.getKey("help.tutorial.name.merge_hotel_down");
         }
         var _loc5_:IWindowContainer = _window.findChildByName("suggestions") as IWindowContainer;
         if(_loc5_ == null)
         {
            return;
         }
         if(param1 == ChangeUserNameResultMessageEvent.var_1108 || param1 == ChangeUserNameResultMessageEvent.var_1107)
         {
            _loc5_.visible = false;
            return;
         }
         _loc5_.visible = true;
         var_823 = new NameSuggestionListRenderer(var_47);
         var _loc6_:int = var_823.render(param3,_loc5_);
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_.numChildren)
         {
            _loc8_ = _loc5_.getChildAt(_loc7_);
            _loc8_.color = var_1447;
            _loc8_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,nameSelected);
            _loc8_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,nameOver);
            _loc8_.addEventListener(WindowMouseEvent.const_32,nameOut);
            _loc7_++;
         }
      }
      
      public function nameCheckWaitEnd(param1:Boolean) : void
      {
         var _loc2_:* = null;
         if(_window && true)
         {
            if(param1)
            {
               _loc2_ = _window.findChildByName("select_name_button");
               if(_loc2_)
               {
                  _loc2_.enable();
               }
            }
            _loc2_ = _window.findChildByName("check_name_button");
            if(_loc2_)
            {
               _loc2_.enable();
            }
            _loc2_ = _window.findChildByName("input");
            if(_loc2_)
            {
               _loc2_.enable();
            }
         }
         var_822 = false;
      }
      
      public function set checkedName(param1:String) : void
      {
         var_347 = param1;
         if(var_1209 == var_347)
         {
            showConfirmationView();
            return;
         }
         setNameAvailableView();
      }
      
      public function get view() : IWindowContainer
      {
         return _window;
      }
      
      public function setNormalView() : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc1_:ITextWindow = _window.findChildByName("info_text") as ITextWindow;
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.text = var_47.localization.getKey("help.tutorial.name.info");
         var _loc2_:IWindowContainer = _window.findChildByName("suggestions") as IWindowContainer;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.visible = false;
      }
      
      private function disposeWindow() : void
      {
         var_1208 = null;
         var_571 = null;
         var_273 = null;
         var_36 = null;
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      public function nameCheckWaitBegin() : void
      {
         var _loc1_:* = null;
         if(_window && true)
         {
            _loc1_ = _window.findChildByName("select_name_button");
            if(_loc1_)
            {
               _loc1_.disable();
            }
            _loc1_ = _window.findChildByName("check_name_button");
            if(_loc1_)
            {
               _loc1_.disable();
            }
            _loc1_ = _window.findChildByName("input");
            if(_loc1_)
            {
               _loc1_.disable();
            }
            _loc1_ = _window.findChildByName("info_text");
            if(_loc1_)
            {
               _loc1_.caption = var_47.localization.getKey("help.tutorial.name.wait_while_checking");
            }
         }
         var_822 = true;
      }
   }
}
