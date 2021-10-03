package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var var_1441:GarbageMonitor = null;
      
      private var var_1194:int = 0;
      
      private var var_1371:Boolean = false;
      
      private var var_1836:String = "";
      
      private var var_1442:String = "";
      
      private var var_345:Number = 0;
      
      private var var_1198:int = 10;
      
      private var var_2307:Array;
      
      private var var_642:int = 0;
      
      private var var_1195:int = 60;
      
      private var var_993:int = 0;
      
      private var var_992:int = 0;
      
      private var var_2261:String = "";
      
      private var var_1837:Number = 0;
      
      private var var_1197:int = 1000;
      
      private var var_1839:Boolean = true;
      
      private var var_1838:Number = 0.15;
      
      private var var_147:IHabboConfigurationManager = null;
      
      private var var_1835:String = "";
      
      private var var_1196:int = 0;
      
      private var _connection:IConnection = null;
      
      public function PerformanceTracker()
      {
         var_2307 = [];
         super();
         var_1442 = Capabilities.version;
         var_1836 = Capabilities.os;
         var_1371 = Capabilities.isDebugger;
         var_1835 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         var_1441 = new GarbageMonitor();
         updateGarbageMonitor();
         var_1194 = getTimer();
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = var_1441.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            var_1441.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function dispose() : void
      {
      }
      
      public function get averageUpdateInterval() : int
      {
         return var_345;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
      
      public function set reportInterval(param1:int) : void
      {
         var_1195 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
      
      public function get flashVersion() : String
      {
         return var_1442;
      }
      
      public function update(param1:uint) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         var _loc2_:Object = updateGarbageMonitor();
         if(_loc2_ != null)
         {
            ++var_992;
            Logger.log("Garbage collection");
         }
         var _loc3_:Boolean = false;
         if(param1 > var_1197)
         {
            ++var_993;
            _loc3_ = true;
         }
         else
         {
            ++var_642;
            if(var_642 <= 1)
            {
               var_345 = param1;
            }
            else
            {
               _loc4_ = Number(var_642);
               var_345 = var_345 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
            }
         }
         if(getTimer() - var_1194 > var_1195 * 1000 && var_1196 < var_1198)
         {
            Logger.log("*** Performance tracker: average frame rate " + 1000 / var_345);
            _loc5_ = true;
            if(var_1839 && var_1196 > 0)
            {
               _loc6_ = differenceInPercents(var_1837,var_345);
               if(_loc6_ < var_1838)
               {
                  _loc5_ = false;
               }
            }
            var_1194 = getTimer();
            if(_loc5_ || _loc3_)
            {
               var_1837 = var_345;
               if(sendReport())
               {
                  ++var_1196;
               }
            }
         }
      }
      
      public function set reportLimit(param1:int) : void
      {
         var_1198 = param1;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         var_1197 = param1;
      }
      
      private function sendReport() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(_connection != null)
         {
            _loc1_ = null;
            _loc2_ = getTimer() / 1000;
            _loc3_ = -1;
            _loc4_ = 0;
            _loc1_ = new PerformanceLogMessageComposer(_loc2_,var_1835,var_1442,var_1836,var_2261,var_1371,_loc4_,_loc3_,var_992,var_345,var_993);
            _connection.send(_loc1_);
            var_992 = 0;
            var_345 = 0;
            var_642 = 0;
            var_993 = 0;
            return true;
         }
         return false;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_147 = param1;
         var_1195 = int(var_147.getKey("performancetest.interval","60"));
         var_1197 = int(var_147.getKey("performancetest.slowupdatelimit","1000"));
         var_1198 = int(var_147.getKey("performancetest.reportlimit","10"));
         var_1838 = Number(var_147.getKey("performancetest.distribution.deviancelimit.percent","10"));
         var_1839 = Boolean(int(var_147.getKey("performancetest.distribution.enabled","1")));
      }
   }
}
