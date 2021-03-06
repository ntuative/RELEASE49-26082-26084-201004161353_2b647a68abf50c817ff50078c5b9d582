package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var var_2079:int;
      
      private var var_2077:int;
      
      private var var_2081:int;
      
      private var _userName:String;
      
      private var var_2080:int;
      
      private var var_2078:int;
      
      private var var_2076:int;
      
      private var _userId:int;
      
      private var var_702:Boolean;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         _userId = param1.readInteger();
         _userName = param1.readString();
         var_2078 = param1.readInteger();
         var_2080 = param1.readInteger();
         var_702 = param1.readBoolean();
         var_2081 = param1.readInteger();
         var_2077 = param1.readInteger();
         var_2079 = param1.readInteger();
         var_2076 = param1.readInteger();
      }
      
      public function get banCount() : int
      {
         return var_2076;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get online() : Boolean
      {
         return var_702;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return var_2080;
      }
      
      public function get abusiveCfhCount() : int
      {
         return var_2077;
      }
      
      public function get cautionCount() : int
      {
         return var_2079;
      }
      
      public function get cfhCount() : int
      {
         return var_2081;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return var_2078;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
