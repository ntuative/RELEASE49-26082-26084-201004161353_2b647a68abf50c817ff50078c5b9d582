package com.sulake.core.runtime
{
   import com.sulake.core.Core;
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.utils.LibraryLoader;
   import com.sulake.core.utils.LibraryLoaderEvent;
   import com.sulake.core.utils.profiler.ProfilerViewer;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getTimer;
   
   public final class CoreComponent extends ComponentContext implements ICore
   {
      
      private static const const_136:uint = 3;
      
      private static const const_1112:String = "zip-libraries";
      
      private static const const_1111:String = "library";
      
      private static const const_1108:String = "library";
      
      private static const const_1110:String = "asset-libraries";
      
      private static const const_1107:String = "library";
      
      private static const const_1113:String = "service-libraries";
      
      private static const const_1109:String = "library";
      
      private static const const_1114:String = "component-libraries";
       
      
      private var var_1052:IEventDispatcher;
      
      private var var_267:Array;
      
      private var var_264:uint;
      
      private var var_880:Profiler;
      
      private var var_507:Array;
      
      private var var_604:Array;
      
      private var var_265:Array;
      
      private var var_266:Array;
      
      private var var_728:ProfilerViewer;
      
      private var var_263:Array;
      
      private var var_313:uint;
      
      public function CoreComponent(param1:DisplayObjectContainer, param2:uint)
      {
         super(this,Component.COMPONENT_FLAG_CONTEXT,new AssetLibraryCollection("_core_assets"));
         _debug = (param2 & 0) == Core.CORE_SETUP_DEBUG;
         var_507 = new Array();
         var_604 = new Array();
         var_208 = param1;
         var _loc3_:int = 0;
         while(_loc3_ < CoreComponent.const_136)
         {
            var_507.push(new Array());
            var_604.push(0);
            _loc3_++;
         }
         var_264 = getTimer();
         attachComponent(this,[new IIDCore()]);
         switch(param2 & 0)
         {
            case Core.const_1398:
               debug("Core; using simple frame update handler");
               var_208.addEventListener(Event.ENTER_FRAME,simpleFrameUpdateHandler);
               break;
            case Core.const_911:
               debug("Core; using complex frame update handler");
               var_208.addEventListener(Event.ENTER_FRAME,complexFrameUpdateHandler);
               break;
            case Core.const_1232:
               debug("Core; using profiler frame update handler");
               var_208.addEventListener(Event.ENTER_FRAME,profilerFrameUpdateHandler);
               var_880 = new Profiler(this);
               attachComponent(var_880,[new IIDProfiler()]);
               var_728 = new ProfilerViewer();
               var_208.addChild(var_728);
               break;
            case Core.CORE_SETUP_DEBUG:
               debug("Core; using debug frame update handler");
               var_208.addEventListener(Event.ENTER_FRAME,debugFrameUpdateHandler);
         }
      }
      
      private function errorInLoadingProcess(param1:LibraryLoaderEvent = null) : void
      {
         var _loc2_:LibraryLoader = LibraryLoader(param1.target);
         error("Failed to download library \"" + _loc2_.url + "\" HTTP status " + param1.status + ": " + _loc2_.getLastErrorMessage(),true,Core.const_1391);
         if(!_isDisposed)
         {
            updateLoadingProcess(param1);
         }
      }
      
      override public function removeUpdateReceiver(param1:IUpdateReceiver) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         while(_loc4_ < CoreComponent.const_136)
         {
            _loc3_ = var_507[_loc4_] as Array;
            _loc2_ = _loc3_.indexOf(param1);
            if(_loc2_ > -1)
            {
               _loc3_[_loc2_] = null;
               return;
            }
            _loc4_++;
         }
      }
      
      public function getNumberOfFilesPending() : uint
      {
         return NaN;
      }
      
      public function getNumberOfFilesLoaded() : uint
      {
         return var_313 - getNumberOfFilesPending();
      }
      
      private function updateLoadingProgress(param1:LibraryLoaderEvent = null) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(var_1052)
         {
            _loc2_ = getNumberOfFilesPending() - 1;
            _loc3_ = Number(param1.bytesLoaded) / Number(param1.bytesTotal);
            var_1052.dispatchEvent(new ProgressEvent(ProgressEvent.PROGRESS,false,false,param1.bytesLoaded,param1.bytesTotal));
         }
      }
      
      private function debugFrameUpdateHandler(param1:Event) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = 0;
         var _loc8_:int = 0;
         var _loc2_:uint = getTimer();
         var _loc3_:uint = _loc2_ - var_264;
         var_264 = _loc2_;
         _loc4_ = 0;
         while(_loc4_ < CoreComponent.const_136)
         {
            var_604[_loc4_] = 0;
            _loc5_ = var_507[_loc4_];
            _loc8_ = 0;
            _loc7_ = uint(_loc5_.length);
            while(_loc8_ != _loc7_)
            {
               _loc6_ = IUpdateReceiver(_loc5_[_loc8_]);
               if(_loc6_ == null || _loc6_.disposed)
               {
                  _loc5_.splice(_loc8_,1);
                  _loc7_--;
               }
               else
               {
                  _loc6_.update(_loc3_);
                  _loc8_++;
               }
            }
            _loc4_++;
         }
      }
      
      public function getLastErrorMessage() : String
      {
         return var_948;
      }
      
      private function simpleFrameUpdateHandler(param1:Event) : void
      {
         var criticality:uint = 0;
         var receivers:Array = null;
         var receiver:IUpdateReceiver = null;
         var length:uint = 0;
         var index:uint = 0;
         var event:Event = param1;
         var msCurrentTime:uint = getTimer();
         var msSinceLastUpdate:uint = msCurrentTime - var_264;
         var_264 = msCurrentTime;
         criticality = 0;
         while(criticality < CoreComponent.const_136)
         {
            var_604[criticality] = 0;
            receivers = var_507[criticality];
            index = 0;
            length = receivers.length;
            while(index != length)
            {
               receiver = IUpdateReceiver(receivers[index]);
               if(receiver == null || receiver.disposed)
               {
                  receivers.splice(index,1);
                  length--;
               }
               else
               {
                  try
                  {
                     receiver.update(msSinceLastUpdate);
                  }
                  catch(e:Error)
                  {
                     trace(e.getStackTrace());
                     error("Error in update receiver \"" + getQualifiedClassName(receiver) + "\": " + e.message,true,e.errorID,e);
                     return;
                  }
                  index++;
               }
            }
            criticality++;
         }
      }
      
      public function readConfigDocument(param1:XML, param2:IEventDispatcher = null) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         debug("Parsing config document");
         var_1052 = param2;
         if(var_267 == null)
         {
            var_267 = new Array();
         }
         _loc3_ = param1.child(const_1112)[0];
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.child(const_1111);
            for each(_loc5_ in _loc4_)
            {
               _loc6_ = _loc5_.attribute("url").toString();
               var_267.push(_loc6_);
               ++var_313;
            }
         }
         if(var_266 == null)
         {
            var_266 = new Array();
         }
         _loc3_ = param1.child(const_1110)[0];
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.child(const_1107);
            for each(_loc5_ in _loc4_)
            {
               _loc6_ = _loc5_.attribute("url").toString();
               var_266.push(_loc6_);
               ++var_313;
            }
         }
         if(var_263 == null)
         {
            var_263 = new Array();
         }
         _loc3_ = param1.child(const_1113)[0];
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.child(const_1109);
            for each(_loc5_ in _loc4_)
            {
               _loc6_ = _loc5_.attribute("url").toString();
               var_263.push(_loc6_);
               ++var_313;
            }
         }
         if(var_265 == null)
         {
            var_265 = new Array();
         }
         _loc3_ = param1.child(const_1114)[0];
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.child(const_1108);
            for each(_loc5_ in _loc4_)
            {
               _loc6_ = _loc5_.attribute("url").toString();
               var_265.push(_loc6_);
               ++var_313;
            }
         }
         updateLoadingProcess();
      }
      
      override public function registerUpdateReceiver(param1:IUpdateReceiver, param2:uint) : void
      {
         removeUpdateReceiver(param1);
         param2 = param2 >= CoreComponent.const_136 ? 4294967295 : uint(param2);
         var _loc3_:Array = var_507[param2] as Array;
         _loc3_.push(param1);
      }
      
      private function profilerFrameUpdateHandler(param1:Event) : void
      {
         var criticality:uint = 0;
         var receivers:Array = null;
         var receiver:IUpdateReceiver = null;
         var length:uint = 0;
         var index:uint = 0;
         var event:Event = param1;
         var msCurrentTime:uint = getTimer();
         var msSinceLastUpdate:uint = msCurrentTime - var_264;
         var_264 = msCurrentTime;
         var_880.start();
         criticality = 0;
         while(criticality < CoreComponent.const_136)
         {
            var_604[criticality] = 0;
            receivers = var_507[criticality];
            index = 0;
            length = receivers.length;
            while(index != length)
            {
               receiver = IUpdateReceiver(receivers[index]);
               if(receiver == null || receiver.disposed)
               {
                  receivers.splice(index,1);
                  length--;
               }
               else
               {
                  try
                  {
                     var_880.update(receiver,msSinceLastUpdate);
                  }
                  catch(e:Error)
                  {
                     error("Error in update receiver \"" + getQualifiedClassName(receiver) + "\": " + e.message,true,e.errorID,e);
                     return;
                  }
                  index++;
               }
            }
            criticality++;
         }
         var_880.stop();
         var_728.refresh(var_880);
      }
      
      public function initialize() : void
      {
         _events.dispatchEvent(new Event(Component.COMPONENT_EVENT_RUNNING));
         Logger.log(toXMLString());
      }
      
      override public function error(param1:String, param2:Boolean, param3:int = -1, param4:Error = null) : void
      {
         if(param2)
         {
            if(param4)
            {
               ErrorReportStorage.setParameter("error_data",String(param4.getStackTrace()));
            }
            ErrorReportStorage.setParameter("error_cat",String(param3));
            ErrorReportStorage.setParameter("error_desc",param1);
         }
         super.error(param1,param2,param3);
         if(param2)
         {
            dispose();
         }
      }
      
      private function finalizeLoadingEventDelegate() : void
      {
         if(var_1052)
         {
            var_1052.dispatchEvent(new Event(Event.COMPLETE));
         }
      }
      
      private function complexFrameUpdateHandler(param1:Event) : void
      {
         var criticality:uint = 0;
         var receivers:Array = null;
         var receiver:IUpdateReceiver = null;
         var length:uint = 0;
         var index:uint = 0;
         var skip:Boolean = false;
         var t:uint = 0;
         var event:Event = param1;
         var msCurrentTime:uint = getTimer();
         var msSinceLastUpdate:uint = msCurrentTime - var_264;
         var maxTimePerFrame:uint = 1000 / var_208.stage.frameRate;
         var_264 = msCurrentTime;
         criticality = 0;
         while(criticality < CoreComponent.const_136)
         {
            t = getTimer();
            skip = false;
            if(t - msCurrentTime > maxTimePerFrame)
            {
               if(var_604[criticality] < criticality)
               {
                  ++0;
                  skip = true;
               }
            }
            if(!skip)
            {
               var_604[criticality] = 0;
               receivers = var_507[criticality];
               index = 0;
               length = receivers.length;
               while(index != length)
               {
                  receiver = IUpdateReceiver(receivers[index]);
                  if(receiver == null || receiver.disposed)
                  {
                     receivers.splice(index,1);
                     length--;
                  }
                  else
                  {
                     try
                     {
                        receiver.update(msSinceLastUpdate);
                     }
                     catch(e:Error)
                     {
                        trace(e.getStackTrace());
                        error("Error in update receiver \"" + getQualifiedClassName(receiver) + "\": " + e.message,true,e.errorID,e);
                        return;
                     }
                     index++;
                  }
               }
            }
            criticality++;
         }
      }
      
      public function getLastDebugMessage() : String
      {
         return var_2275;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = 0;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         if(!disposed)
         {
            debug("Disposing core");
            var_208.removeEventListener(Event.ENTER_FRAME,simpleFrameUpdateHandler);
            var_208.removeEventListener(Event.ENTER_FRAME,complexFrameUpdateHandler);
            var_208.removeEventListener(Event.ENTER_FRAME,profilerFrameUpdateHandler);
            var_208 = null;
            _loc3_ = 0;
            while(_loc3_ < CoreComponent.const_136)
            {
               _loc2_ = var_507[_loc3_] as Array;
               _loc1_ = uint(_loc2_.length);
               while(_loc1_-- > 0)
               {
                  _loc2_.pop();
               }
               _loc3_++;
            }
            if(var_267 != null)
            {
               _loc1_ = 0;
               while(_loc1_-- > 0)
               {
                  var_267.pop();
               }
            }
            if(var_266 != null)
            {
               _loc1_ = 0;
               while(_loc1_-- > 0)
               {
                  var_266.pop();
               }
            }
            if(var_263 != null)
            {
               _loc1_ = 0;
               while(_loc1_-- > 0)
               {
                  var_263.pop();
               }
            }
            if(var_265 != null)
            {
               _loc1_ = 0;
               while(_loc1_-- > 0)
               {
                  var_265.pop();
               }
            }
            if(var_728 != null)
            {
               var_728.dispose();
               var_728 = null;
            }
            super.dispose();
         }
      }
      
      private function updateLoadingProcess(param1:LibraryLoaderEvent = null) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1 != null)
         {
            if(param1.type == LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE || param1.type == LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR)
            {
               _loc2_ = param1.target as LibraryLoader;
               _loc2_.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               _loc2_.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,updateLoadingProgress);
               _loc3_ = _loc2_.url;
               debug("Loading library \"" + _loc3_ + "\" " + (param1.type == LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE ? "ready" : "failed\n" + _loc2_.getLastErrorMessage()));
               if(false)
               {
                  if(var_267[0] == _loc3_)
                  {
                     var_267.splice(0,1);
                  }
               }
               if(false)
               {
                  if(var_266[0] == _loc3_)
                  {
                     var_266.splice(0,1);
                  }
               }
               if(false)
               {
                  if(var_263[0] == _loc3_)
                  {
                     var_263.splice(0,1);
                  }
               }
               if(false)
               {
                  if(var_265[0] == _loc3_)
                  {
                     var_265.splice(0,1);
                  }
               }
            }
         }
         if(false)
         {
            _loc3_ = "null";
            _loc2_ = _assets.loadFromArchive(new URLRequest(_loc3_),null);
            if(_loc2_.ready)
            {
               var_267.splice(0,1);
               updateLoadingProcess();
            }
            else
            {
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,updateLoadingProgress);
               debug("Loading zip library " + _loc3_);
            }
            return;
         }
         if(false)
         {
            _loc3_ = "null";
            _loc4_ = new LoaderContext(false,new ApplicationDomain());
            _loc2_ = _assets.loadFromFile(new URLRequest(_loc3_),true,_loc4_);
            if(_loc2_.ready)
            {
               var_266.splice(0,1);
               updateLoadingProcess();
            }
            else
            {
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,updateLoadingProgress);
               debug("Loading asset library " + _loc3_);
            }
            return;
         }
         if(false)
         {
            _loc3_ = "null";
            _loc2_ = loadFromFile(new URLRequest(_loc3_),new LoaderContext(false,ApplicationDomain.currentDomain,null));
            if(_loc2_.ready)
            {
               var_263.splice(0,1);
               updateLoadingProcess();
            }
            else
            {
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,updateLoadingProgress);
               debug("Loading service library " + _loc3_);
            }
            return;
         }
         if(false)
         {
            _loc3_ = "null";
            _loc2_ = loadFromFile(new URLRequest(_loc3_),new LoaderContext(false,ApplicationDomain.currentDomain,null));
            if(_loc2_.ready)
            {
               var_265.splice(0,1);
               updateLoadingProcess();
            }
            else
            {
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,updateLoadingProgress);
               debug("Loading component library " + _loc3_);
            }
            return;
         }
         finalizeLoadingEventDelegate();
         debug("All libraries loaded, Core is now running");
      }
   }
}
