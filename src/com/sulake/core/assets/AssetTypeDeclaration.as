package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2116:Class;
      
      private var var_2117:Class;
      
      private var var_2118:String;
      
      private var var_1307:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         var_2118 = param1;
         var_2117 = param2;
         var_2116 = param3;
         if(rest == null)
         {
            var_1307 = new Array();
         }
         else
         {
            var_1307 = rest;
         }
      }
      
      public function get loaderClass() : Class
      {
         return var_2116;
      }
      
      public function get assetClass() : Class
      {
         return var_2117;
      }
      
      public function get mimeType() : String
      {
         return var_2118;
      }
      
      public function get fileTypes() : Array
      {
         return var_1307;
      }
   }
}
