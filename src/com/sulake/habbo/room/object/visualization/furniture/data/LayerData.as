package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class LayerData
   {
      
      public static const const_372:int = 255;
      
      public static const INK_DARKEN:int = 3;
      
      public static const const_404:int = 0;
      
      public static const const_808:int = 2;
      
      public static const const_859:int = 1;
      
      public static const const_567:Boolean = false;
      
      public static const const_718:String = "";
      
      public static const const_482:int = 0;
      
      public static const const_430:int = 0;
      
      public static const const_441:int = 0;
       
      
      private var var_1811:int = 0;
      
      private var var_1762:String = "";
      
      private var var_1561:int = 0;
      
      private var var_1808:int = 0;
      
      private var var_1810:Number = 0;
      
      private var var_1807:int = 255;
      
      private var var_1809:Boolean = false;
      
      public function LayerData()
      {
         super();
      }
      
      public function get yOffset() : int
      {
         return var_1811;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            tag = param1.tag;
            ink = param1.ink;
            alpha = param1.alpha;
            ignoreMouse = param1.ignoreMouse;
            xOffset = param1.xOffset;
            yOffset = param1.yOffset;
            zOffset = param1.zOffset;
         }
      }
      
      public function set ink(param1:int) : void
      {
         var_1561 = param1;
      }
      
      public function get zOffset() : Number
      {
         return var_1810;
      }
      
      public function set xOffset(param1:int) : void
      {
         var_1808 = param1;
      }
      
      public function set yOffset(param1:int) : void
      {
         var_1811 = param1;
      }
      
      public function get tag() : String
      {
         return var_1762;
      }
      
      public function get alpha() : int
      {
         return var_1807;
      }
      
      public function get ink() : int
      {
         return var_1561;
      }
      
      public function set zOffset(param1:Number) : void
      {
         var_1810 = param1;
      }
      
      public function get xOffset() : int
      {
         return var_1808;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         var_1809 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return var_1809;
      }
      
      public function set tag(param1:String) : void
      {
         var_1762 = param1;
      }
      
      public function set alpha(param1:int) : void
      {
         var_1807 = param1;
      }
   }
}
