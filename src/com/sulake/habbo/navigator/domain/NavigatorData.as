package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.navigator.NavigatorSettingsMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1428:int = 10;
       
      
      private var var_1520:NavigatorSettingsMessageParser;
      
      private var var_1276:int;
      
      private var var_2049:int;
      
      private var var_2050:Boolean;
      
      private var var_1050:Array;
      
      private var var_878:Dictionary;
      
      private var var_1051:Array;
      
      private var var_2329:int;
      
      private var var_2048:int;
      
      private var var_1944:int;
      
      private var var_2047:int;
      
      private var var_603:PublicRoomShortData;
      
      private var var_420:RoomEventData;
      
      private var var_128:MsgWithRequestId;
      
      private var var_2052:Boolean;
      
      private var _navigator:HabboNavigator;
      
      private var var_2051:Boolean;
      
      private var var_194:GuestRoomData;
      
      private var var_727:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         var_1050 = new Array();
         var_1051 = new Array();
         var_878 = new Dictionary();
         super();
         _navigator = param1;
      }
      
      public function get createdFlatId() : int
      {
         return var_2049;
      }
      
      public function get eventMod() : Boolean
      {
         return var_2051;
      }
      
      public function startLoading() : void
      {
         this.var_727 = true;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return false;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         var_2051 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(var_420 != null)
         {
            var_420.dispose();
         }
         var_420 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return var_128 != null && var_128 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return var_128 != null && var_128 as GuestRoomSearchResultData != null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return var_128 as GuestRoomSearchResultData;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return var_194;
      }
      
      public function get allCategories() : Array
      {
         return var_1050;
      }
      
      public function onRoomExit() : void
      {
         if(var_420 != null)
         {
            var_420.dispose();
            var_420 = null;
         }
         if(var_603 != null)
         {
            var_603.dispose();
            var_603 = null;
         }
         if(var_194 != null)
         {
            var_194.dispose();
            var_194 = null;
         }
         _currentRoomOwner = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         disposeCurrentMsg();
         var_128 = param1;
         var_727 = false;
      }
      
      public function get settings() : NavigatorSettingsMessageParser
      {
         return var_1520;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         disposeCurrentMsg();
         var_128 = param1;
         var_727 = false;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         var_603 = null;
         var_194 = null;
         _currentRoomOwner = false;
         if(param1.guestRoom)
         {
            _currentRoomOwner = param1.owner;
         }
         else
         {
            var_603 = param1.publicSpace;
            var_420 = null;
         }
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return _currentRoomOwner;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2329 = param1.limit;
         this.var_1276 = param1.favouriteRoomIds.length;
         this.var_878 = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this.var_878[_loc2_] = "yes";
         }
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return var_128 as PopularRoomTagsData;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return var_603;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return var_2050;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         disposeCurrentMsg();
         var_128 = param1;
         var_727 = false;
      }
      
      public function set avatarId(param1:int) : void
      {
         var_1944 = param1;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return var_194 != null && _currentRoomOwner;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_727;
      }
      
      public function get visibleCategories() : Array
      {
         return var_1051;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         var_1050 = param1;
         var_1051 = new Array();
         for each(_loc2_ in var_1050)
         {
            if(_loc2_.visible)
            {
               var_1051.push(_loc2_);
            }
         }
      }
      
      public function get currentRoomRating() : int
      {
         return var_2048;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return var_2047;
      }
      
      public function set settings(param1:NavigatorSettingsMessageParser) : void
      {
         var_1520 = param1;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(var_128 == null)
         {
            return;
         }
         var_128.dispose();
         var_128 = null;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return var_420;
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         var_878[param1] = !!param2 ? "yes" : null;
         var_1276 += !!param2 ? 1 : -1;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return var_128 as OfficialRoomsData;
      }
      
      public function get avatarId() : int
      {
         return var_1944;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = 0;
         return false;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return var_128 != null && var_128 as OfficialRoomsData != null;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         var_2050 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         var_2048 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         var_2052 = param1;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(var_194 != null)
         {
            var_194.dispose();
         }
         var_194 = param1;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(var_194 == null)
         {
            return false;
         }
         var _loc1_:int = 0;
         return this.var_1520.homeRoomId == _loc1_;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return var_1276 >= var_2329;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         var_2047 = param1;
      }
      
      public function get hcMember() : Boolean
      {
         return var_2052;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return var_194 != null && !_currentRoomOwner;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         var_2049 = param1;
      }
   }
}
