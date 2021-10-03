package com.sulake.room.renderer.cache
{
   public class RoomObjectCacheItem
   {
       
      
      private var var_551:RoomObjectLocationCacheItem = null;
      
      private var var_173:RoomObjectSortableSpriteCacheItem = null;
      
      public function RoomObjectCacheItem(param1:String)
      {
         super();
         var_551 = new RoomObjectLocationCacheItem(param1);
         var_173 = new RoomObjectSortableSpriteCacheItem();
      }
      
      public function get location() : RoomObjectLocationCacheItem
      {
         return var_551;
      }
      
      public function dispose() : void
      {
         if(var_551 != null)
         {
            var_551.dispose();
            var_551 = null;
         }
         if(var_173 != null)
         {
            var_173.dispose();
            var_173 = null;
         }
      }
      
      public function get sprites() : RoomObjectSortableSpriteCacheItem
      {
         return var_173;
      }
   }
}
