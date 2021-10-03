package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var var_294:String;
      
      private var var_1129:String;
      
      private var var_1128:String;
      
      private var var_1131:int;
      
      private var var_628:int;
      
      private var var_1130:String;
      
      private var _name:String;
      
      private var var_1132:Boolean;
      
      private var var_702:Boolean;
      
      private var _id:int;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_628 = param1.readInteger();
         this.var_702 = param1.readBoolean();
         this.var_1132 = param1.readBoolean();
         this.var_294 = param1.readString();
         this.var_1131 = param1.readInteger();
         this.var_1128 = param1.readString();
         this.var_1129 = param1.readString();
         this.var_1130 = param1.readString();
      }
      
      public function get gender() : int
      {
         return var_628;
      }
      
      public function get realName() : String
      {
         return var_1130;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get motto() : String
      {
         return var_1128;
      }
      
      public function get categoryId() : int
      {
         return var_1131;
      }
      
      public function get online() : Boolean
      {
         return var_702;
      }
      
      public function get followingAllowed() : Boolean
      {
         return var_1132;
      }
      
      public function get lastAccess() : String
      {
         return var_1129;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get figure() : String
      {
         return var_294;
      }
   }
}
