package com.sulake.habbo.avatar
{
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.geom.ColorTransform;
   
   public class AvatarImagePartContainer
   {
       
      
      private var _frames:Array;
      
      private var var_2108:int;
      
      private var var_2107:String;
      
      private var var_1410:IActionDefinition;
      
      private var var_2105:Boolean;
      
      private var _color:IPartColor;
      
      private var var_2109:String;
      
      private var var_2106:String;
      
      private var var_1897:Boolean;
      
      private var var_2110:ColorTransform;
      
      private var var_2001:int;
      
      public function AvatarImagePartContainer(param1:String, param2:String, param3:int, param4:IPartColor, param5:Array, param6:IActionDefinition, param7:Boolean, param8:int, param9:String = "", param10:Boolean = false, param11:Number = 1)
      {
         super();
         var_2107 = param1;
         var_2109 = param2;
         var_2108 = param3;
         _color = param4;
         _frames = param5;
         var_1410 = param6;
         var_1897 = param7;
         var_2001 = param8;
         var_2106 = param9;
         var_2105 = param10;
         var_2110 = new ColorTransform(1,1,1,param11);
      }
      
      public function get isColorable() : Boolean
      {
         return var_1897;
      }
      
      public function get partType() : String
      {
         return var_2109;
      }
      
      public function getFrameIndex(param1:int) : int
      {
         return 0;
      }
      
      public function get paletteMapId() : int
      {
         return var_2001;
      }
      
      public function get isBlendable() : Boolean
      {
         return var_2105;
      }
      
      public function get color() : IPartColor
      {
         return _color;
      }
      
      public function get partId() : int
      {
         return var_2108;
      }
      
      public function get flippedPartType() : String
      {
         return var_2106;
      }
      
      public function get bodyPartId() : String
      {
         return var_2107;
      }
      
      public function get action() : IActionDefinition
      {
         return var_1410;
      }
      
      public function get blendTransform() : ColorTransform
      {
         return var_2110;
      }
   }
}
