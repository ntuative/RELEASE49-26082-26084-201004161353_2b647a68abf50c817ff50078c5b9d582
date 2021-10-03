package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_606:int = 6;
      
      public static const const_230:int = 5;
      
      public static const const_615:int = 2;
      
      public static const const_334:int = 9;
      
      public static const const_301:int = 4;
      
      public static const const_275:int = 2;
      
      public static const const_713:int = 4;
      
      public static const const_205:int = 8;
      
      public static const const_535:int = 7;
      
      public static const const_246:int = 3;
      
      public static const const_318:int = 1;
      
      public static const const_197:int = 5;
      
      public static const const_412:int = 12;
      
      public static const const_294:int = 1;
      
      public static const const_621:int = 11;
      
      public static const const_512:int = 3;
      
      public static const const_1603:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_402:Array;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_402 = new Array();
         var_402.push(new Tab(_navigator,const_318,const_412,new EventsTabPageDecorator(_navigator),MainViewCtrl.const_391));
         var_402.push(new Tab(_navigator,const_275,const_294,new RoomsTabPageDecorator(_navigator),MainViewCtrl.const_391));
         var_402.push(new Tab(_navigator,const_301,const_621,new OfficialTabPageDecorator(_navigator),MainViewCtrl.const_932));
         var_402.push(new Tab(_navigator,const_246,const_230,new MyRoomsTabPageDecorator(_navigator),MainViewCtrl.const_391));
         var_402.push(new Tab(_navigator,const_197,const_205,new SearchTabPageDecorator(_navigator),MainViewCtrl.const_556));
         setSelectedTab(const_318);
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_402)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_402)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_402)
         {
            _loc1_.selected = false;
         }
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_301;
      }
      
      public function get tabs() : Array
      {
         return var_402;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         getTab(param1).selected = true;
      }
   }
}
