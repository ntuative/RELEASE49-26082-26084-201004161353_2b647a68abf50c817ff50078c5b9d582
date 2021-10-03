package com.sulake.habbo.avatar.wardrobe
{
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.common.ISideContentModel;
   import com.sulake.habbo.communication.messages.incoming.avatar.OutfitData;
   
   public class WardrobeModel implements ISideContentModel
   {
       
      
      private var _view:WardrobeView;
      
      private var var_160:Boolean = false;
      
      private var var_47:HabboAvatarEditor;
      
      private var var_515:Map;
      
      public function WardrobeModel(param1:HabboAvatarEditor)
      {
         super();
         var_47 = param1;
      }
      
      private function isSlotEnabled(param1:int) : Boolean
      {
         if(param1 <= 5)
         {
            return var_47.sessionData.hasUserRight("fuse_use_wardrobe");
         }
         return var_47.sessionData.hasUserRight("fuse_larger_wardrobe");
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         if(!var_160)
         {
            init();
         }
         return _view.getWindowContainer();
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         var_47 = null;
         for each(_loc1_ in var_515)
         {
            _loc1_.dispose();
            _loc1_ = null;
         }
         var_515 = null;
         if(_view)
         {
            _view.dispose();
            _view = null;
         }
         var_160 = false;
      }
      
      public function updateView() : void
      {
         _view.update();
      }
      
      public function reset() : void
      {
         var_160 = false;
      }
      
      private function init() : void
      {
         var _loc2_:* = null;
         if(false)
         {
            var_47.handler.getWardrobe();
         }
         if(var_515)
         {
            for each(_loc2_ in var_515)
            {
               _loc2_.dispose();
               _loc2_ = null;
            }
         }
         var_515 = new Map();
         var _loc1_:int = 1;
         while(_loc1_ <= 10)
         {
            var_515.add(_loc1_,new WardrobeSlot(var_47,_loc1_,isSlotEnabled(_loc1_)));
            _loc1_++;
         }
         if(_view)
         {
            _view.dispose();
         }
         _view = new WardrobeView(this);
         var_160 = true;
         updateView();
      }
      
      public function get slots() : Array
      {
         return var_515.getValues();
      }
      
      public function updateSlots(param1:int, param2:Array) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(!var_160)
         {
            return;
         }
         for each(_loc4_ in param2)
         {
            _loc3_ = var_515.getValue(_loc4_.slotId) as WardrobeSlot;
            if(_loc3_)
            {
               _loc3_.update(_loc4_.figureString,_loc4_.gender,isSlotEnabled(_loc3_.id));
            }
         }
      }
      
      public function get controller() : HabboAvatarEditor
      {
         return var_47;
      }
   }
}
