package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1395:int = 4;
      
      public static const const_629:int = 3;
      
      public static const const_518:int = 2;
      
      public static const const_848:int = 1;
       
      
      private var var_1909:String;
      
      private var _disposed:Boolean;
      
      private var var_1684:int;
      
      private var var_1908:Boolean;
      
      private var var_790:String;
      
      private var var_826:PublicRoomData;
      
      private var var_1911:int;
      
      private var _index:int;
      
      private var var_1910:String;
      
      private var _type:int;
      
      private var var_1762:String;
      
      private var var_827:GuestRoomData;
      
      private var var_1912:String;
      
      private var _open:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         _index = param1.readInteger();
         var_1909 = param1.readString();
         var_1912 = param1.readString();
         var_1908 = param1.readInteger() == 1;
         var_1910 = param1.readString();
         var_790 = param1.readString();
         var_1911 = param1.readInteger();
         var_1684 = param1.readInteger();
         _type = param1.readInteger();
         if(_type == const_848)
         {
            var_1762 = param1.readString();
         }
         else if(_type == const_629)
         {
            var_826 = new PublicRoomData(param1);
         }
         else if(_type == const_518)
         {
            var_827 = new GuestRoomData(param1);
         }
      }
      
      public function get folderId() : int
      {
         return var_1911;
      }
      
      public function get popupCaption() : String
      {
         return var_1909;
      }
      
      public function get userCount() : int
      {
         return var_1684;
      }
      
      public function get open() : Boolean
      {
         return _open;
      }
      
      public function get showDetails() : Boolean
      {
         return var_1908;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_848)
         {
            return 0;
         }
         if(this.type == const_518)
         {
            return this.var_827.maxUserCount;
         }
         if(this.type == const_629)
         {
            return this.var_826.maxUsers;
         }
         return 0;
      }
      
      public function get popupDesc() : String
      {
         return var_1912;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(this.var_827 != null)
         {
            this.var_827.dispose();
            this.var_827 = null;
         }
         if(this.var_826 != null)
         {
            this.var_826.dispose();
            this.var_826 = null;
         }
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return var_827;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get picText() : String
      {
         return var_1910;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return var_826;
      }
      
      public function get picRef() : String
      {
         return var_790;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tag() : String
      {
         return var_1762;
      }
      
      public function toggleOpen() : void
      {
         _open = !_open;
      }
   }
}
