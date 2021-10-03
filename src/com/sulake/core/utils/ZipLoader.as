package com.sulake.core.utils
{
   import com.sulake.core.Core;
   import deng.fzip.FZip;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   import flash.utils.getQualifiedClassName;
   
   public class ZipLoader extends LibraryLoader
   {
       
      
      private var var_442:FZip;
      
      private var var_1347:Array;
      
      private var var_1091:uint = 0;
      
      private var var_2206:uint = 0;
      
      private var var_2394:Array;
      
      private var var_922:int = 0;
      
      private var var_1090:uint = 0;
      
      public function ZipLoader(param1:Boolean)
      {
         super(param1);
         var_1347 = new Array();
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         Logger.log(param1.text);
         dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,0,var_1090,var_1091));
      }
      
      public function get resources() : Array
      {
         return var_1347;
      }
      
      private function onComplete(param1:Event) : void
      {
         var event:Event = param1;
         var_922 = 0;
         var_2206 = var_442.getFileCount();
         removeEventListeners();
         try
         {
            if(var_14)
            {
               var_14.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoaderComplete);
               var_14.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
               var_14.loadBytes(var_442.getFileAt(var_922).content);
            }
         }
         catch(e:Error)
         {
            Core.crash("Crashed on ZipLoader.onComplete",Core.const_593,e);
         }
      }
      
      private function onLoaderComplete(param1:Event) : void
      {
         var loaderInfo:LoaderInfo = null;
         var name:String = null;
         var event:Event = param1;
         try
         {
            loaderInfo = event.target as LoaderInfo;
            name = getQualifiedClassName(var_14.content);
            var_1347.push(var_14.contentLoaderInfo.applicationDomain.getDefinition(name));
            ++var_922;
            if(var_1347.length == var_2206)
            {
               var_14.contentLoaderInfo.removeEventListener(Event.COMPLETE,onLoaderComplete);
               var_14.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,onIOError);
               dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,0,var_1090,var_1091));
            }
            else
            {
               var_14.loadBytes(var_442.getFileAt(var_922).content);
            }
         }
         catch(e:Error)
         {
            Core.crash("Crashed on ZipLoader.onLoaderComplete",Core.const_593,e);
         }
      }
      
      override public function load(param1:URLRequest, param2:LoaderContext = null, param3:int = 1) : void
      {
         var_288 = param1;
         _name = parseNameFromUrl(var_288.url);
         if(var_442)
         {
            var_442.close();
         }
         ErrorReportStorage.addDebugData("Library name","Library name " + _name);
         var_442 = new FZip();
         var_442.addEventListener(Event.COMPLETE,onComplete);
         var_442.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
         var_442.addEventListener(ProgressEvent.PROGRESS,onProgress);
         var_442.load(var_288);
      }
      
      override public function get bytesLoaded() : uint
      {
         return var_1091;
      }
      
      override public function get bytesTotal() : uint
      {
         return var_1090;
      }
      
      private function onProgress(param1:ProgressEvent) : void
      {
         var_1090 = param1.bytesTotal;
         var_1091 = param1.bytesLoaded;
         dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,0,var_1090,var_1091));
      }
   }
}
