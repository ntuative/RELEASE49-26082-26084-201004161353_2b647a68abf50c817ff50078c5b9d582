package com.sulake.habbo.communication
{
   import com.sulake.core.Core;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.ICoreCommunicationManager;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.connection.IConnectionStateListener;
   import com.sulake.core.communication.enum.ConnectionType;
   import com.sulake.core.communication.messages.IMessageConfiguration;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.protocol.IProtocol;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.habbo.communication.enum.HabboConnectionType;
   import com.sulake.habbo.communication.enum.HabboProtocolType;
   import com.sulake.habbo.communication.messages.outgoing.handshake.DisconnectMessageComposer;
   import com.sulake.habbo.communication.protocol.WedgieProtocol;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.configuration.enum.HabboConfigurationEvent;
   import com.sulake.habbo.tracking.HabboErrorVariableEnum;
   import com.sulake.iid.IIDCoreCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class HabboCommunicationManager extends Component implements IHabboCommunicationManager, IConnectionStateListener
   {
       
      
      private var var_699:int = 0;
      
      private var var_32:String = "";
      
      private var var_1124:Timer;
      
      private var var_245:Array;
      
      private var var_1630:Boolean = false;
      
      private var var_80:String = "";
      
      private var _habboConfiguration:IHabboConfigurationManager;
      
      private var var_1056:IMessageConfiguration;
      
      private const const_1635:int = 5;
      
      private var var_329:int = -1;
      
      private var var_289:ICoreCommunicationManager;
      
      private var var_774:int = 1;
      
      private var var_1631:Boolean = false;
      
      private var var_1632:Boolean = false;
      
      private var _connection:IConnection;
      
      public function HabboCommunicationManager(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_1056 = new HabboMessages();
         var_245 = [];
         var_1124 = new Timer(100,1);
         super(param1,param2,param3);
         this.queueInterface(new IIDCoreCommunicationManager(),onCoreCommunicationManagerInit);
         this.queueInterface(new IIDHabboConfigurationManager(),onHabboConfigurationInit);
         param1.events.addEventListener(Event.UNLOAD,unloading);
      }
      
      public function get port() : int
      {
         if(var_329 < 0 || var_329 >= var_245.length)
         {
            return 0;
         }
         return var_245[var_329];
      }
      
      private function unloading(param1:Event) : void
      {
         _connection.send(new DisconnectMessageComposer());
      }
      
      private function onSecurityError(param1:SecurityErrorEvent) : void
      {
         Logger.log("[HabboCommunicationManager] Security Error: " + param1.text);
         ErrorReportStorage.addDebugData("Communication Security Error","SecurityError on connect: " + param1.text + ". Port was " + var_245[var_329]);
         tryNextPort();
      }
      
      private function onConnect(param1:Event) : void
      {
         ErrorReportStorage.addDebugData("Connection","Connected with " + var_774 + " attempts");
      }
      
      private function onConfigurationReady(param1:Event = null) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         Logger.log("Habbo Communication Manager: init based on configuration: " + _habboConfiguration);
         if(_habboConfiguration == null)
         {
            Core.crash("Received configuration ready event but configuration was null",Core.const_1011);
         }
         else
         {
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config Ready");
            var_245 = [];
            var_32 = _habboConfiguration.getKey("connection.info.host","fused37-public-proxy-1.hotel.varoke.net");
            _loc2_ = _habboConfiguration.getKey("connection.info.port","25001");
            if(_habboConfiguration.keyExists("local.environment"))
            {
               var_32 = _habboConfiguration.getKey("connection.info.host.local");
               _loc2_ = _habboConfiguration.getKey("connection.info.port.local");
            }
            _loc3_ = _loc2_.split(",");
            for each(_loc4_ in _loc3_)
            {
               var_245.push(parseInt(_loc4_.replace(" ","")));
            }
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config Host: " + var_32);
            Logger.log("Connection Host: " + var_32);
            Logger.log("Connection Ports: " + var_245);
            Logger.log("Habbo Connection Info:" + _connection);
            var_1631 = true;
            if(var_1632)
            {
               nextPort();
            }
         }
      }
      
      public function messageReceived(param1:String, param2:String) : void
      {
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1393,String(new Date().getTime()));
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1233,param1 + " " + param2);
         if(false)
         {
            var_80 += ",R:" + param1;
         }
         else
         {
            var_80 = "R:" + param1;
         }
         if(false)
         {
            var_80 = var_80.substring(-150);
         }
         ErrorReportStorage.addDebugData("MESSAGE_QUEUE",var_80);
      }
      
      private function nextPort() : void
      {
         ++var_329;
         if(var_329 >= var_245.length)
         {
            ++var_774;
            ErrorReportStorage.addDebugData("ConnectionRetry","Connection attempt " + var_774);
            if(var_774 > const_1635)
            {
               if(var_1630)
               {
                  return;
               }
               var_1630 = true;
               Core.error("Connection failed to host " + var_32 + " ports " + var_245,true,Core.const_558);
               return;
            }
            var_329 = 0;
         }
         _connection.timeout = var_774 * 5000;
         _connection.init(var_32,var_245[var_329]);
      }
      
      private function onTryNextPort(param1:TimerEvent) : void
      {
         var_1124.stop();
         nextPort();
      }
      
      public function get mode() : int
      {
         return var_699;
      }
      
      override public function dispose() : void
      {
         if(_connection)
         {
            _connection.dispose();
            _connection = null;
         }
         if(var_289)
         {
            var_289.release(new IIDCoreCommunicationManager());
            var_289 = null;
         }
         if(_habboConfiguration)
         {
            _habboConfiguration.release(new IIDHabboConfigurationManager());
            _habboConfiguration = null;
         }
         super.dispose();
      }
      
      public function initConnection(param1:String) : void
      {
         switch(param1)
         {
            case HabboConnectionType.const_252:
               if(_habboConfiguration == null)
               {
                  Core.crash("Tried to connect to proxy but configuration was null",Core.const_558);
                  return;
               }
               if(_connection == null)
               {
                  Core.crash("Tried to connect to proxy but connection was null",Core.const_558);
                  return;
               }
               var_1632 = true;
               if(var_1631)
               {
                  nextPort();
               }
               break;
            default:
               Logger.log("Unknown Habbo Connection Type: " + param1);
         }
      }
      
      public function habboWebLogin(param1:String, param2:String) : IHabboWebLogin
      {
         var _loc3_:String = "";
         _loc3_ = _habboConfiguration.getKey("url.prefix",_loc3_);
         _loc3_ = _loc3_.replace("http://","");
         _loc3_ = _loc3_.replace("https://","");
         return new HabboWebLogin(param1,param2,_loc3_);
      }
      
      public function addHabboConnectionMessageEvent(param1:IMessageEvent) : void
      {
         var_289.addConnectionMessageEvent(HabboConnectionType.const_252,param1);
      }
      
      public function connectionInit(param1:String, param2:int) : void
      {
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1266,param1);
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1225,String(param2));
      }
      
      public function messageSent(param1:String, param2:String) : void
      {
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1144,String(new Date().getTime()));
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1221,param1 + " " + param2);
         if(false)
         {
            var_80 += ",S:" + param1;
         }
         else
         {
            var_80 = "S:" + param1;
         }
         if(false)
         {
            var_80 = var_80.substring(-150);
         }
         ErrorReportStorage.addDebugData("MESSAGE_QUEUE",var_80);
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         Logger.log("[HabboCommunicationManager] IO Error: " + param1.text);
         switch(param1.type)
         {
            case IOErrorEvent.IO_ERROR:
               break;
            case IOErrorEvent.DISK_ERROR:
               break;
            case IOErrorEvent.NETWORK_ERROR:
               break;
            case IOErrorEvent.VERIFY_ERROR:
         }
         ErrorReportStorage.addDebugData("Communication IO Error","IOError " + param1.type + " on connect: " + param1.text + ". Port was " + var_245[var_329]);
         tryNextPort();
      }
      
      public function set mode(param1:int) : void
      {
         var_699 = param1;
      }
      
      private function onCoreCommunicationManagerInit(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:* = null;
         Logger.log("Habbo Communication Manager: Core Communication Manager found:: " + [param1,param2]);
         if(param2 != null)
         {
            var_289 = param2 as ICoreCommunicationManager;
            var_289.connectionStateListener = this;
            var_289.registerProtocolType(HabboProtocolType.const_875,WedgieProtocol);
            _connection = var_289.createConnection(HabboConnectionType.const_252,ConnectionType.const_865);
            _loc3_ = var_289.getProtocolInstanceOfType(HabboProtocolType.const_875);
            _connection.registerMessageClasses(var_1056);
            _connection.protocol = _loc3_;
            _connection.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
            _connection.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onSecurityError);
            _connection.addEventListener(Event.CONNECT,onConnect);
         }
      }
      
      private function tryNextPort() : void
      {
         var_1124.addEventListener(TimerEvent.TIMER,onTryNextPort);
         var_1124.start();
      }
      
      private function onHabboConfigurationInit(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 != null)
         {
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config Received");
            _habboConfiguration = param2 as IHabboConfigurationManager;
            (_habboConfiguration as Component).events.addEventListener(HabboConfigurationEvent.INIT,onConfigurationReady);
         }
         else
         {
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config NOT received");
         }
      }
      
      public function getHabboMainConnection(param1:Function) : IConnection
      {
         return !!var_289 ? var_289.queueConnection(HabboConnectionType.const_252,param1) : null;
      }
   }
}
