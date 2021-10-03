package com.sulake.habbo.avatar.alias
{
   public class AssetAlias
   {
       
      
      private var var_978:Boolean;
      
      private var _name:String;
      
      private var var_2182:String;
      
      private var var_979:Boolean;
      
      public function AssetAlias(param1:XML)
      {
         super();
         _name = String(param1.@name);
         var_2182 = String(param1.@link);
         var_979 = Boolean(parseInt(param1.@fliph));
         var_978 = Boolean(parseInt(param1.@flipv));
      }
      
      public function get flipH() : Boolean
      {
         return var_979;
      }
      
      public function get flipV() : Boolean
      {
         return var_978;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get link() : String
      {
         return var_2182;
      }
   }
}
