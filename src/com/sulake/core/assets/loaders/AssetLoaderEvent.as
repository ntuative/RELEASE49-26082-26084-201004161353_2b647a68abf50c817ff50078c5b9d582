package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   
   public class AssetLoaderEvent extends Event
   {
      
      public static const const_957:String = "AssetLoaderEventUnload";
      
      public static const const_47:String = "AssetLoaderEventError";
      
      public static const const_985:String = "AssetLoaderEventOpen";
      
      public static const const_978:String = "AssetLoaderEventProgress";
      
      public static const const_949:String = "AssetLoaderEventStatus";
      
      public static const const_36:String = "AssetLoaderEventComplete";
       
      
      private var var_377:int;
      
      public function AssetLoaderEvent(param1:String, param2:int)
      {
         var_377 = param2;
         super(param1,false,false);
      }
      
      public function get status() : int
      {
         return var_377;
      }
      
      override public function clone() : Event
      {
         return new AssetLoaderEvent(type,var_377);
      }
   }
}
