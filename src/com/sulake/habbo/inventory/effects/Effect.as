package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDrawableItem;
   import com.sulake.habbo.widget.memenu.IWidgetAvatarEffect;
   import flash.display.BitmapData;
   
   public class Effect implements IWidgetAvatarEffect, IThumbListDrawableItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_2183:Date;
      
      private var var_1332:Boolean = false;
      
      private var _type:int;
      
      private var var_374:BitmapData;
      
      private var var_256:Boolean = false;
      
      private var var_1317:int;
      
      private var var_621:int = 1;
      
      private var var_1081:int;
      
      public function Effect()
      {
         super();
      }
      
      public function get icon() : BitmapData
      {
         return var_374;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function setOneEffectExpired() : void
      {
         --var_621;
         if(var_621 < 0)
         {
            var_621 = 0;
         }
         var_1081 = var_1317;
         var_256 = false;
         var_1332 = false;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function set secondsLeft(param1:int) : void
      {
         var_1081 = param1;
      }
      
      public function get method_3() : Boolean
      {
         return var_256;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         var_374 = param1;
      }
      
      public function get duration() : int
      {
         return var_1317;
      }
      
      public function get isInUse() : Boolean
      {
         return var_1332;
      }
      
      public function get effectsInInventory() : int
      {
         return var_621;
      }
      
      public function get iconImage() : BitmapData
      {
         return var_374;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function set method_3(param1:Boolean) : void
      {
         if(param1 && !var_256)
         {
            var_2183 = new Date();
         }
         var_256 = param1;
      }
      
      public function set effectsInInventory(param1:int) : void
      {
         var_621 = param1;
      }
      
      public function get secondsLeft() : int
      {
         var _loc1_:int = 0;
         if(var_256)
         {
            _loc1_ = var_1081 - (new Date().valueOf() - var_2183.valueOf()) / 1000;
            _loc1_ = Math.floor(_loc1_);
            if(_loc1_ < 0)
            {
               _loc1_ = 0;
            }
            return _loc1_;
         }
         return var_1081;
      }
      
      public function set isInUse(param1:Boolean) : void
      {
         var_1332 = param1;
      }
      
      public function set duration(param1:int) : void
      {
         var_1317 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
