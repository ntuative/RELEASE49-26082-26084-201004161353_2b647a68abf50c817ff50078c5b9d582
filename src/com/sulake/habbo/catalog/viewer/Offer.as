package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_863:String = "price_type_none";
      
      public static const const_399:String = "pricing_model_multi";
      
      public static const const_333:String = "price_type_credits";
      
      public static const const_364:String = "price_type_credits_and_pixels";
      
      public static const const_473:String = "pricing_model_bundle";
      
      public static const const_470:String = "pricing_model_single";
      
      public static const const_619:String = "price_type_credits_or_credits_and_pixels";
      
      public static const const_1146:String = "pricing_model_unknown";
      
      public static const const_435:String = "price_type_pixels";
       
      
      private var var_2133:int;
      
      private var var_897:int;
      
      private var _offerId:int;
      
      private var var_896:int;
      
      private var var_433:String;
      
      private var var_612:String;
      
      private var var_436:ICatalogPage;
      
      private var var_432:IProductContainer;
      
      private var var_1314:String;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         _offerId = param1.offerId;
         var_1314 = param1.localizationId;
         var_897 = param1.priceInCredits;
         var_896 = param1.priceInPixels;
         var_436 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(param1.localizationId);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         analyzePricingModel(_loc3_);
         analyzePriceType();
         createProductContainer(_loc3_);
      }
      
      public function get pricingModel() : String
      {
         return var_433;
      }
      
      public function get page() : ICatalogPage
      {
         return var_436;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_2133 = param1;
      }
      
      public function get productContainer() : IProductContainer
      {
         return var_432;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_896;
      }
      
      public function dispose() : void
      {
         _offerId = 0;
         var_1314 = "";
         var_897 = 0;
         var_896 = 0;
         var_436 = null;
         if(var_432 != null)
         {
            var_432.dispose();
            var_432 = null;
         }
      }
      
      public function get previewCallbackId() : int
      {
         return var_2133;
      }
      
      public function get priceInCredits() : int
      {
         return var_897;
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               var_433 = const_470;
            }
            else
            {
               var_433 = const_399;
            }
         }
         else if(param1.length > 1)
         {
            var_433 = const_473;
         }
         else
         {
            var_433 = const_1146;
         }
      }
      
      public function get priceType() : String
      {
         return var_612;
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(var_433)
         {
            case const_470:
               var_432 = new SingleProductContainer(this,param1);
               break;
            case const_399:
               var_432 = new MultiProductContainer(this,param1);
               break;
            case const_473:
               var_432 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + var_433);
         }
      }
      
      public function get localizationId() : String
      {
         return var_1314;
      }
      
      private function analyzePriceType() : void
      {
         if(var_897 > 0 && var_896 > 0)
         {
            var_612 = const_364;
         }
         else if(var_897 > 0)
         {
            var_612 = const_333;
         }
         else if(var_896 > 0)
         {
            var_612 = const_435;
         }
         else
         {
            var_612 = const_863;
         }
      }
   }
}
