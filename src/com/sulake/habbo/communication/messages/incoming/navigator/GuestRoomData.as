package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1684:int;
      
      private var var_1705:String;
      
      private var var_1704:int;
      
      private var var_1706:int;
      
      private var var_683:Boolean;
      
      private var var_1701:Boolean;
      
      private var var_394:int;
      
      private var var_1271:String;
      
      private var var_1625:int;
      
      private var var_1131:int;
      
      private var _ownerName:String;
      
      private var var_733:String;
      
      private var var_1703:int;
      
      private var var_1702:RoomThumbnailData;
      
      private var var_1624:Boolean;
      
      private var var_641:Array;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         var_641 = new Array();
         super();
         var_394 = param1.readInteger();
         var_683 = param1.readBoolean();
         var_733 = param1.readString();
         _ownerName = param1.readString();
         var_1625 = param1.readInteger();
         var_1684 = param1.readInteger();
         var_1703 = param1.readInteger();
         var_1271 = param1.readString();
         var_1704 = param1.readInteger();
         var_1624 = param1.readBoolean();
         var_1706 = param1.readInteger();
         var_1131 = param1.readInteger();
         var_1705 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            var_641.push(_loc4_);
            _loc3_++;
         }
         var_1702 = new RoomThumbnailData(param1);
         var_1701 = param1.readBoolean();
      }
      
      public function get maxUserCount() : int
      {
         return var_1703;
      }
      
      public function get roomName() : String
      {
         return var_733;
      }
      
      public function get userCount() : int
      {
         return var_1684;
      }
      
      public function get score() : int
      {
         return var_1706;
      }
      
      public function get eventCreationTime() : String
      {
         return var_1705;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_1624;
      }
      
      public function get tags() : Array
      {
         return var_641;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1701;
      }
      
      public function get event() : Boolean
      {
         return var_683;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_641 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get categoryId() : int
      {
         return var_1131;
      }
      
      public function get srchSpecPrm() : int
      {
         return var_1704;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return var_1702;
      }
      
      public function get doorMode() : int
      {
         return var_1625;
      }
      
      public function get flatId() : int
      {
         return var_394;
      }
      
      public function get description() : String
      {
         return var_1271;
      }
   }
}
