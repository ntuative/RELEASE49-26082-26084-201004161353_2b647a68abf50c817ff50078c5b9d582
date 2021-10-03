package com.sulake.habbo.communication.messages.parser.moderation
{
   import flash.utils.getTimer;
   
   public class IssueMessageData
   {
      
      public static const const_142:int = 1;
      
      public static const const_1167:int = 3;
      
      public static const const_447:int = 2;
       
      
      private var var_1881:int;
      
      private var var_1879:int;
      
      private var var_1878:int;
      
      private var var_1883:int;
      
      private var var_31:int;
      
      private var var_394:int;
      
      private var var_1363:int;
      
      private var var_1874:int;
      
      private var var_1038:int;
      
      private var _roomResources:String;
      
      private var var_1852:int;
      
      private var var_1872:int;
      
      private var var_1873:String;
      
      private var var_1875:String;
      
      private var var_1877:int = 0;
      
      private var var_1257:String;
      
      private var _message:String;
      
      private var var_1876:int;
      
      private var var_1882:String;
      
      private var var_1131:int;
      
      private var var_733:String;
      
      private var var_1880:String;
      
      private var var_1452:int;
      
      public function IssueMessageData()
      {
         super();
      }
      
      public function set reportedUserId(param1:int) : void
      {
         var_1038 = param1;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         var_1877 = param1;
      }
      
      public function get reporterUserId() : int
      {
         return var_1872;
      }
      
      public function set roomName(param1:String) : void
      {
         var_733 = param1;
      }
      
      public function set chatRecordId(param1:int) : void
      {
         var_1852 = param1;
      }
      
      public function get state() : int
      {
         return var_31;
      }
      
      public function get roomResources() : String
      {
         return _roomResources;
      }
      
      public function set roomResources(param1:String) : void
      {
         _roomResources = param1;
      }
      
      public function get roomName() : String
      {
         return var_733;
      }
      
      public function get message() : String
      {
         return _message;
      }
      
      public function set worldId(param1:int) : void
      {
         var_1883 = param1;
      }
      
      public function set state(param1:int) : void
      {
         var_31 = param1;
      }
      
      public function get unitPort() : int
      {
         return var_1879;
      }
      
      public function get priority() : int
      {
         return var_1881 + var_1877;
      }
      
      public function set issueId(param1:int) : void
      {
         var_1874 = param1;
      }
      
      public function get pickerUserName() : String
      {
         return var_1875;
      }
      
      public function getOpenTime() : String
      {
         var _loc1_:int = (getTimer() - var_1452) / 1000;
         var _loc2_:int = _loc1_ % 60;
         var _loc3_:int = _loc1_ / 60;
         var _loc4_:int = _loc3_ % 60;
         var _loc5_:int = _loc3_ / 60;
         var _loc6_:String = _loc2_ < 10 ? "0" + _loc2_ : "" + _loc2_;
         var _loc7_:String = _loc4_ < 10 ? "0" + _loc4_ : "" + _loc4_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         return _loc8_ + ":" + _loc7_ + ":" + _loc6_;
      }
      
      public function get categoryId() : int
      {
         return var_1131;
      }
      
      public function set reporterUserId(param1:int) : void
      {
         var_1872 = param1;
      }
      
      public function get roomType() : int
      {
         return var_1363;
      }
      
      public function set flatType(param1:String) : void
      {
         var_1873 = param1;
      }
      
      public function get chatRecordId() : int
      {
         return var_1852;
      }
      
      public function set message(param1:String) : void
      {
         _message = param1;
      }
      
      public function get worldId() : int
      {
         return var_1883;
      }
      
      public function set flatOwnerName(param1:String) : void
      {
         var_1880 = param1;
      }
      
      public function set reportedUserName(param1:String) : void
      {
         var_1257 = param1;
      }
      
      public function get issueId() : int
      {
         return var_1874;
      }
      
      public function set priority(param1:int) : void
      {
         var_1881 = param1;
      }
      
      public function set unitPort(param1:int) : void
      {
         var_1879 = param1;
      }
      
      public function get flatType() : String
      {
         return var_1873;
      }
      
      public function set reportedCategoryId(param1:int) : void
      {
         var_1878 = param1;
      }
      
      public function set pickerUserName(param1:String) : void
      {
         var_1875 = param1;
      }
      
      public function set pickerUserId(param1:int) : void
      {
         var_1876 = param1;
      }
      
      public function get reportedUserName() : String
      {
         return var_1257;
      }
      
      public function set roomType(param1:int) : void
      {
         var_1363 = param1;
      }
      
      public function get reportedCategoryId() : int
      {
         return var_1878;
      }
      
      public function set flatId(param1:int) : void
      {
         var_394 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1131 = param1;
      }
      
      public function set timeStamp(param1:int) : void
      {
         var_1452 = param1;
      }
      
      public function get pickerUserId() : int
      {
         return var_1876;
      }
      
      public function set reporterUserName(param1:String) : void
      {
         var_1882 = param1;
      }
      
      public function get timeStamp() : int
      {
         return var_1452;
      }
      
      public function get reportedUserId() : int
      {
         return var_1038;
      }
      
      public function get flatId() : int
      {
         return var_394;
      }
      
      public function get flatOwnerName() : String
      {
         return var_1880;
      }
      
      public function get reporterUserName() : String
      {
         return var_1882;
      }
   }
}
