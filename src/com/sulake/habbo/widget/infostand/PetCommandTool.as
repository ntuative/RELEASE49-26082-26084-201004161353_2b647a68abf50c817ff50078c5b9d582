package com.sulake.habbo.widget.infostand
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetPetCommandMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetUserActionMessage;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class PetCommandTool
   {
       
      
      private var var_553:int;
      
      private var var_333:Timer;
      
      private var var_334:IFrameWindow;
      
      private var _widget:InfostandWidget;
      
      private var var_959:Map;
      
      private const const_1638:int = 1100;
      
      private var var_1658:String;
      
      private var var_39:IFrameWindow;
      
      public function PetCommandTool(param1:InfostandWidget)
      {
         super();
         _widget = param1;
         var_959 = new Map();
         var_333 = new Timer(const_1638);
         var_333.addEventListener(TimerEvent.TIMER,onButtonDisableTimeout);
      }
      
      private function onWindowDesktopResized(param1:WindowEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(var_39 && true)
         {
            _loc2_ = param1.window;
            _loc3_ = new Rectangle();
            var_39.getGlobalRectangle(_loc3_);
            if(_loc3_.x > _loc2_.width)
            {
               var_39.x = _loc2_.width - 0;
               var_39.getGlobalRectangle(_loc3_);
            }
            if(_loc3_.x + _loc3_.width <= 0)
            {
               var_39.x = 0;
               var_39.getGlobalRectangle(_loc3_);
            }
            if(_loc3_.y > _loc2_.height)
            {
               var_39.y = 0;
               var_39.getGlobalRectangle(_loc3_);
            }
            if(_loc3_.y + _loc3_.height <= 0)
            {
               var_39.y = 0;
               var_39.getGlobalRectangle(_loc3_);
            }
         }
      }
      
      public function showWindow(param1:Boolean) : void
      {
         if(param1)
         {
            if(var_39 == null)
            {
               createCommandWindow();
            }
            var_39.visible = true;
         }
         else if(var_39 != null)
         {
            var_39.visible = false;
         }
         var_333.stop();
      }
      
      private function createCommandWindow() : void
      {
         var _loc1_:XmlAsset = _widget.assets.getAssetByName("pet_commands") as XmlAsset;
         var_39 = (_widget.windowManager as ICoreWindowManager).buildFromXML(_loc1_.content as XML) as IFrameWindow;
         if(var_39 == null)
         {
            throw new Error("Failed to construct command window from XML!");
         }
         var_39.setParamFlag(WindowParam.const_91,true);
         var_39.context.getDesktopWindow().addEventListener(WindowEvent.const_46,onWindowDesktopResized);
         var_39.procedure = onCommandWindowProcedure;
         var_39.x = 80;
      }
      
      private function requestEnabledCommands(param1:int) : void
      {
         var _loc2_:RoomWidgetPetCommandMessage = new RoomWidgetPetCommandMessage(RoomWidgetPetCommandMessage.const_553,param1);
         _widget.messageListener.processWidgetMessage(_loc2_);
      }
      
      public function dispose() : void
      {
         if(var_333)
         {
            var_333.stop();
            var_333 = null;
         }
         if(_widget)
         {
            _widget = null;
         }
         if(var_39)
         {
            var_39.dispose();
         }
         var_39 = null;
         if(var_334)
         {
            var_334.dispose();
         }
         var_334 = null;
      }
      
      public function getPetId() : int
      {
         return var_553;
      }
      
      private function updateCommandButtonsViewState(param1:Array) : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         if(var_39 == null)
         {
            return;
         }
         if(param1 == null)
         {
            param1 = new Array();
         }
         var _loc3_:int = 0;
         do
         {
            _loc4_ = "btn_cmd_" + _loc3_;
            _loc2_ = var_39.findChildByName(_loc4_) as IButtonWindow;
            if(_loc2_ == null)
            {
               break;
            }
            if(param1.indexOf(_loc3_) > -1)
            {
               _loc2_.enable();
            }
            else
            {
               _loc2_.disable();
            }
            _loc3_++;
         }
         while(_loc2_ != null);
         
         var_333.stop();
      }
      
      public function setEnabledCommands(param1:int, param2:Array) : void
      {
         var_959.remove(param1);
         var_959.add(param1,param2);
         if(param1 != var_553)
         {
            return;
         }
         updateCommandButtonsViewState(param2);
         var_333.stop();
      }
      
      public function isVisible() : Boolean
      {
         if(var_39 == null)
         {
            return false;
         }
         return var_39.visible;
      }
      
      private function onInfoWindowProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:WindowMouseEvent = param1 as WindowMouseEvent;
         if(_loc3_ != null && _loc3_.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            if(param2.name == "header_button_close")
            {
               var_334.visible = false;
            }
         }
      }
      
      private function openInfoWindow() : void
      {
         var _loc1_:* = null;
         if(var_334 == null)
         {
            _loc1_ = _widget.assets.getAssetByName("pet_commands_info") as XmlAsset;
            var_334 = (_widget.windowManager as ICoreWindowManager).buildFromXML(_loc1_.content as XML) as IFrameWindow;
            if(var_334 == null)
            {
               throw new Error("Failed to construct command info window from XML!");
            }
            var_334.x = 200;
            var_334.procedure = onInfoWindowProcedure;
         }
         else
         {
            var_334.visible = true;
         }
      }
      
      private function onButtonDisableTimeout(param1:TimerEvent) : void
      {
         var _loc2_:Array = var_959.getValue(var_553) as Array;
         updateCommandButtonsViewState(_loc2_);
         var_333.stop();
      }
      
      private function onCommandWindowProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc3_:WindowMouseEvent = param1 as WindowMouseEvent;
         if(_loc3_ != null && _loc3_.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            if(param2.name == "header_button_close")
            {
               var_39.visible = false;
            }
            else if(param2.name == "description_link")
            {
               openInfoWindow();
            }
            else if(param2.name == "avatar_image")
            {
               _widget.messageListener.processWidgetMessage(new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.const_415,var_553));
            }
            else if(param2.name.indexOf("btn_cmd_") > -1)
            {
               _loc4_ = int(param2.name.substring(8));
               _loc5_ = "pet.command." + _loc4_;
               _loc6_ = _widget.localizations.getKey(_loc5_);
               _loc7_ = new RoomWidgetPetCommandMessage(RoomWidgetPetCommandMessage.const_571,var_553,var_1658 + " " + _loc6_);
               _widget.messageListener.processWidgetMessage(_loc7_);
               updateCommandButtonsViewState(new Array());
               var_333.start();
            }
         }
      }
      
      public function showCommandToolForPet(param1:int, param2:String, param3:BitmapData = null) : void
      {
         if(var_553 == param1)
         {
            return;
         }
         var_553 = param1;
         var_1658 = param2;
         if(var_39 == null)
         {
            return;
         }
         var _loc4_:ITextWindow = var_39.findChildByName("pet_name") as ITextWindow;
         if(_loc4_ != null)
         {
            _loc4_.text = param2;
         }
         var _loc5_:IBitmapWrapperWindow = var_39.findChildByName("avatar_image") as IBitmapWrapperWindow;
         if(_loc5_ != null)
         {
            _loc5_.bitmap = param3;
            _loc5_.width = param3.width;
            _loc5_.height = param3.height;
            _loc5_.invalidate();
         }
         var _loc6_:Array = var_959.getValue(param1) as Array;
         if(_loc6_ == null)
         {
            updateCommandButtonsViewState(new Array());
            requestEnabledCommands(var_553);
         }
         else
         {
            updateCommandButtonsViewState(_loc6_);
         }
      }
   }
}
