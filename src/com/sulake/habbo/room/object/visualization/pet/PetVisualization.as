package com.sulake.habbo.room.object.visualization.pet
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.utils.getTimer;
   
   public class PetVisualization extends RoomObjectSpriteVisualization
   {
       
      
      private var var_294:String;
      
      private var var_642:int = 0;
      
      private const const_1636:int = 1;
      
      private const const_1414:int = 0;
      
      private var var_348:ExperienceData;
      
      private var var_388:Boolean;
      
      private const const_769:int = 3;
      
      private var var_958:int = 0;
      
      private var var_463:int = 0;
      
      private var var_465:BitmapDataAsset;
      
      private const const_1043:int = 3;
      
      private const const_1637:int = 2;
      
      private var var_645:PetVisualizationData = null;
      
      private var var_332:Map;
      
      private var var_779:Array;
      
      public function PetVisualization()
      {
         super();
         var_779 = new Array();
         var_332 = new Map();
         var_388 = false;
      }
      
      override public function update(param1:IRoomGeometry = null, param2:int = 0) : void
      {
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:Boolean = false;
         var _loc21_:* = null;
         var _loc22_:* = false;
         var _loc23_:int = 0;
         var _loc24_:* = null;
         var _loc25_:* = null;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:* = null;
         var _loc29_:* = null;
         var _loc30_:int = 0;
         var _loc31_:int = 0;
         var _loc32_:int = 0;
         var _loc33_:int = 0;
         var _loc34_:* = null;
         var _loc35_:int = 0;
         var _loc36_:int = 0;
         var _loc37_:int = 0;
         var _loc38_:int = 0;
         var _loc39_:int = 0;
         var _loc40_:* = null;
         var _loc41_:* = null;
         var _loc42_:int = 0;
         var _loc43_:int = 0;
         var _loc44_:int = 0;
         var _loc45_:* = null;
         var _loc46_:int = 0;
         var _loc3_:IRoomObject = object;
         if(_loc3_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(var_645 == null)
         {
            return;
         }
         var _loc4_:IRoomObjectModel = _loc3_.getModel();
         var _loc5_:String = "avatar" + param1.scale.toString();
         var _loc6_:* = var_332.getValue(_loc5_) as IAvatarImage;
         var _loc7_:String = _loc4_.getString(RoomObjectVariableEnum.const_159);
         var _loc9_:int = _loc4_.getNumber(RoomObjectVariableEnum.const_899);
         var_348.alpha = 0;
         if(_loc9_ > 0)
         {
            _loc14_ = getTimer() - _loc9_;
            if(_loc14_ < AvatarAction.const_1029)
            {
               var_348.alpha = int(Math.sin(_loc14_ / 0 * 0) * 255);
               var_348.setExperience(_loc4_.getNumber(RoomObjectVariableEnum.const_836));
               var_463 = const_1043;
            }
         }
         var _loc10_:Boolean = false;
         var _loc11_:String = _loc4_.getString(RoomObjectVariableEnum.const_276);
         switch(_loc11_)
         {
            case AvatarAction.const_867:
            case AvatarAction.const_812:
            case AvatarAction.const_1026:
            case AvatarAction.const_921:
            case AvatarAction.const_1012:
            case AvatarAction.const_811:
            case AvatarAction.const_891:
            case AvatarAction.const_362:
            case AvatarAction.const_384:
               _loc10_ = true;
         }
         var _loc12_:Boolean = var_287 != _loc3_.getUpdateID() || var_209 != param1.scale || var_161 != _loc4_.getUpdateID();
         var _loc13_:Boolean = var_388 || var_463 > 0 || _loc10_;
         if(_loc12_ || _loc13_)
         {
            increaseUpdateId();
            _loc15_ = getTimer();
            --var_463;
            if(var_294 != _loc7_)
            {
               for each(_loc29_ in var_332.getKeys())
               {
                  var_332.remove(_loc29_);
               }
               _loc6_ = null;
            }
            if(_loc6_ == null)
            {
               _loc6_ = var_645.getAvatar(_loc7_,param1.scale);
               if(_loc6_ == null)
               {
                  return;
               }
               var_332.remove(_loc5_);
               var_332.add(_loc5_,_loc6_);
               var_294 = _loc7_;
            }
            _loc16_ = _loc3_.getDirection().x - (param1.direction.x + 135 - 22.5);
            _loc16_ = (_loc16_ % 360 + 360) % 360;
            _loc6_.setDirectionAngle(AvatarSetType.const_39,_loc16_);
            _loc17_ = _loc4_.getNumber(RoomObjectVariableEnum.const_340);
            if(isNaN(_loc17_))
            {
               _loc17_ = _loc16_;
            }
            else
            {
               _loc17_ -= param1.direction.x + 135 - 22.5;
            }
            _loc17_ = (_loc17_ % 360 + 360) % 360;
            _loc6_.setDirectionAngle(AvatarSetType.const_48,_loc17_);
            _loc6_.initActionAppends();
            _loc18_ = _loc4_.getString(RoomObjectVariableEnum.const_276);
            _loc19_ = _loc4_.getString(RoomObjectVariableEnum.const_649);
            _loc6_.appendAction(AvatarAction.const_670,_loc18_,_loc19_);
            _loc20_ = false;
            if(_loc18_ == "lay")
            {
               _loc30_ = int(_loc19_);
               if(_loc30_ < 0)
               {
                  _loc20_ = true;
               }
            }
            _loc21_ = _loc4_.getString(RoomObjectVariableEnum.const_403);
            if(_loc21_ != null && _loc21_ != "")
            {
               _loc31_ = _loc4_.getNumber(RoomObjectVariableEnum.const_422);
               _loc32_ = 3;
               _loc33_ = param2 - _loc31_;
               if(_loc33_ < _loc32_ * 1000)
               {
                  _loc6_.appendAction(AvatarAction.const_319,_loc21_);
               }
            }
            _loc22_ = _loc4_.getNumber(RoomObjectVariableEnum.const_359) > 0;
            if(_loc22_)
            {
               _loc6_.appendAction(AvatarAction.const_587);
            }
            _loc6_.endActionAppends();
            ++var_642;
            ++var_958;
            if(var_958 > 1)
            {
               _loc6_.updateAnimationByFrames(1);
               var_958 = 0;
            }
            var_388 = _loc6_.isAnimating();
            _loc23_ = _loc6_.getSprites().length + const_769;
            if(_loc23_ != spriteCount)
            {
               createSprites(_loc23_);
            }
            _loc25_ = _loc6_.getCanvasOffsets();
            if(_loc25_ == null || _loc25_.length < 3)
            {
               _loc25_ = new Array(0,0,0);
            }
            _loc26_ = 0;
            if(object.getLocation().z > 0)
            {
               _loc26_ = Math.min(param1.scale / 2.75,0);
            }
            _loc24_ = getSprite(const_1414);
            if(_loc24_ && _loc6_)
            {
               _loc24_.asset = _loc6_.getImage(AvatarSetType.const_39,false);
               _loc24_.offsetX = -1 * param1.scale / 2 + _loc25_[0];
               _loc24_.offsetY = -_loc24_.asset.height + param1.scale / 4 + _loc25_[1] + _loc26_;
            }
            _loc27_ = const_769;
            for each(_loc28_ in _loc6_.getSprites())
            {
               _loc24_ = getSprite(_loc27_);
               if(_loc24_ != null)
               {
                  _loc34_ = _loc6_.getLayerData(_loc28_);
                  _loc35_ = 0;
                  _loc36_ = _loc28_.getDirectionOffsetX(_loc6_.getDirection());
                  _loc37_ = _loc28_.getDirectionOffsetY(_loc6_.getDirection());
                  _loc38_ = _loc28_.getDirectionOffsetZ(_loc6_.getDirection());
                  _loc39_ = 0;
                  if(_loc28_.hasDirections)
                  {
                     _loc39_ = _loc6_.getDirection();
                  }
                  if(_loc34_ != null)
                  {
                     _loc35_ = _loc34_.animationFrame;
                     _loc36_ += _loc34_.dx;
                     _loc37_ += _loc34_.dy;
                     _loc39_ += _loc34_.method_5;
                  }
                  if(param1.scale < 48)
                  {
                     _loc36_ /= 2;
                     _loc37_ /= 2;
                  }
                  if(_loc39_ < 0)
                  {
                     _loc39_ += 8;
                  }
                  if(_loc39_ > 7)
                  {
                     _loc39_ -= 8;
                  }
                  _loc40_ = _loc6_.getScale() + "_" + _loc28_.member + "_" + _loc39_ + "_" + _loc35_;
                  _loc41_ = _loc6_.getAsset(_loc40_);
                  if(_loc41_ != null)
                  {
                     _loc24_.asset = _loc41_.content as BitmapData;
                     _loc24_.offsetX = -1 * _loc41_.offset.x - param1.scale / 2 + _loc36_;
                     _loc24_.offsetY = -1 * _loc41_.offset.y + _loc37_;
                     _loc24_.relativeDepth = -0.01 - 0.1 * _loc27_ * _loc38_;
                     if(_loc28_.ink == 33)
                     {
                        _loc24_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc24_.blendMode = BlendMode.NORMAL;
                     }
                     _loc27_++;
                  }
               }
            }
            var_465 = null;
            if(_loc18_ == "mv" || _loc18_ == "std")
            {
               _loc23_ = _loc6_.getSprites().length + const_769;
               if(_loc23_ != spriteCount)
               {
                  createSprites(_loc23_);
               }
               _loc24_ = getSprite(const_1636);
               _loc42_ = 0;
               _loc43_ = 0;
               switch(param1.scale)
               {
                  case 32:
                     var_465 = _loc6_.getAsset("sh_std_sd_1_0_0");
                     _loc42_ = -8;
                     _loc43_ = -3;
                     break;
                  case 64:
                     var_465 = _loc6_.getAsset("h_std_sd_1_0_0");
                     _loc42_ = -17;
                     _loc43_ = -7;
               }
               if(var_465)
               {
                  _loc24_.asset = var_465.content as BitmapData;
                  _loc24_.offsetX = _loc42_;
                  _loc24_.offsetY = _loc43_;
                  _loc24_.alpha = 50;
                  _loc24_.relativeDepth = 1;
               }
            }
            _loc24_ = getSprite(const_1637);
            if(false)
            {
               _loc24_.asset = var_348.image;
               _loc24_.offsetX = -20;
               _loc24_.offsetY = -80;
               _loc24_.alpha = var_348.alpha;
               _loc24_.visible = true;
            }
            else
            {
               _loc24_.visible = false;
            }
            var_287 = _loc3_.getUpdateID();
            var_161 = _loc4_.getUpdateID();
            var_209 = param1.scale;
            var_779.push(getTimer() - _loc15_);
            if(false)
            {
               _loc44_ = 0;
               _loc45_ = "[";
               for each(_loc46_ in var_779)
               {
                  _loc44_ += _loc46_;
                  _loc45_ += "," + _loc46_;
               }
               _loc45_ += "]";
               var_779 = new Array();
            }
         }
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         var_645 = param1 as PetVisualizationData;
         createSprites(const_769);
         var_348 = new ExperienceData(var_645);
         return true;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         super.dispose();
         if(var_332 != null)
         {
            _loc1_ = var_332.getKeys();
            for each(_loc2_ in _loc1_)
            {
               _loc3_ = var_332.getValue(_loc2_) as IAvatarImage;
            }
         }
         var_332.dispose();
         if(var_348)
         {
            var_348.dispose();
         }
         var_348 = null;
         var_645 = null;
      }
   }
}
