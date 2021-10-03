package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1852:int;
      
      private var var_1038:int;
      
      private var var_1851:int;
      
      private var var_1448:int;
      
      private var var_112:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         var_1448 = param1.readInteger();
         var_1851 = param1.readInteger();
         var_1038 = param1.readInteger();
         var_1852 = param1.readInteger();
         var_112 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + var_1448);
      }
      
      public function get chatRecordId() : int
      {
         return var_1852;
      }
      
      public function get reportedUserId() : int
      {
         return var_1038;
      }
      
      public function get callerUserId() : int
      {
         return var_1851;
      }
      
      public function get callId() : int
      {
         return var_1448;
      }
      
      public function get room() : RoomChatlogData
      {
         return var_112;
      }
   }
}
