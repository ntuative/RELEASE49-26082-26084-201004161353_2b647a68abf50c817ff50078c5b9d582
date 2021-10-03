package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2302:Boolean;
      
      private var var_2303:int;
      
      private var var_2301:Boolean;
      
      private var var_1480:String;
      
      private var var_1130:String;
      
      private var var_1944:int;
      
      private var var_1966:String;
      
      private var var_2300:String;
      
      private var var_1965:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1944 = param1.readInteger();
         this.var_1480 = param1.readString();
         this.var_1966 = param1.readString();
         this.var_2302 = param1.readBoolean();
         this.var_2301 = param1.readBoolean();
         param1.readString();
         this.var_2303 = param1.readInteger();
         this.var_1965 = param1.readString();
         this.var_2300 = param1.readString();
         this.var_1130 = param1.readString();
      }
      
      public function get realName() : String
      {
         return this.var_1130;
      }
      
      public function get avatarName() : String
      {
         return this.var_1480;
      }
      
      public function get avatarId() : int
      {
         return this.var_1944;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2302;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2300;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_1965;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2301;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_1966;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2303;
      }
   }
}
