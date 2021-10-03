package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_765:IAssetLoader;
      
      private var var_1290:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         var_1290 = param1;
         var_765 = param2;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return var_765;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(var_765 != null)
            {
               if(true)
               {
                  var_765.dispose();
                  var_765 = null;
               }
            }
            super.dispose();
         }
      }
      
      public function get assetName() : String
      {
         return var_1290;
      }
   }
}
