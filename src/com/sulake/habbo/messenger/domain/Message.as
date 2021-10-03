package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_715:int = 2;
      
      public static const const_967:int = 6;
      
      public static const const_734:int = 1;
      
      public static const const_690:int = 3;
      
      public static const const_846:int = 4;
      
      public static const const_506:int = 5;
       
      
      private var var_1800:String;
      
      private var var_1093:int;
      
      private var var_1799:String;
      
      private var _type:int;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         _type = param1;
         var_1093 = param2;
         var_1799 = param3;
         var_1800 = param4;
      }
      
      public function get time() : String
      {
         return var_1800;
      }
      
      public function get senderId() : int
      {
         return var_1093;
      }
      
      public function get messageText() : String
      {
         return var_1799;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
