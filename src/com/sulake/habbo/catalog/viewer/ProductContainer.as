package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.IRoomEngine;
   import flash.display.BitmapData;
   
   public class ProductContainer extends ProductGridItem implements IGetImageListener, IProductContainer, IGridItem
   {
       
      
      private var var_899:Array;
      
      private var var_452:int;
      
      protected var var_75:Offer;
      
      public function ProductContainer(param1:Offer, param2:Array)
      {
         super();
         var_75 = param1;
         var_899 = param2;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         super.dispose();
         for each(_loc1_ in var_899)
         {
            _loc1_.dispose();
         }
         var_899 = null;
         var_452 = 0;
      }
      
      public function get products() : Array
      {
         return var_899;
      }
      
      public function initProductIcon(param1:IRoomEngine) : void
      {
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         setIconImage(param2);
      }
      
      public function get firstProduct() : IProduct
      {
         return var_899[0] as IProduct;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_452 = param1;
      }
      
      public function get iconCallbackId() : int
      {
         return var_452;
      }
      
      public function get offer() : Offer
      {
         return var_75;
      }
   }
}
