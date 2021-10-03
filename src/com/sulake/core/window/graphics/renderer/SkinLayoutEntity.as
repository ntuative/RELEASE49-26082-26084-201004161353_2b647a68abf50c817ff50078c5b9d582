package com.sulake.core.window.graphics.renderer
{
   import flash.geom.Rectangle;
   
   public class SkinLayoutEntity implements ISkinLayoutEntity
   {
      
      public static const const_236:uint = 1;
      
      public static const const_478:uint = 0;
      
      public static const const_854:uint = 8;
      
      public static const const_268:uint = 4;
      
      public static const const_406:uint = 2;
       
      
      private var var_419:uint;
      
      private var var_1869:uint;
      
      private var _color:uint;
      
      private var _name:String;
      
      private var var_1870:uint;
      
      private var var_94:Rectangle;
      
      private var var_641:Array;
      
      private var _id:uint;
      
      public function SkinLayoutEntity(param1:uint, param2:String, param3:Rectangle, param4:uint = 4.294967295E9, param5:uint = 100, param6:uint = 0, param7:uint = 0)
      {
         super();
         _id = param1;
         _name = param2;
         var_94 = param3;
         _color = param4;
         var_419 = param5;
         var_1869 = param6;
         var_1870 = param7;
         var_641 = new Array();
      }
      
      public function get scaleH() : uint
      {
         return var_1869;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get blend() : uint
      {
         return var_419;
      }
      
      public function get scaleV() : uint
      {
         return var_1870;
      }
      
      public function get tags() : Array
      {
         return var_641;
      }
      
      public function get id() : uint
      {
         return _id;
      }
      
      public function dispose() : void
      {
         var_94 = null;
         var_641 = null;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get region() : Rectangle
      {
         return var_94;
      }
   }
}
