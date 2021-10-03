package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData;
   
   public class ModeratorInitMessageParser implements IMessageParser
   {
       
      
      private var _roomMessageTemplates:Array;
      
      private var var_2245:Boolean;
      
      private var var_1600:Array;
      
      private var var_2252:Boolean;
      
      private var var_2250:Boolean;
      
      private var var_2248:Boolean;
      
      private var var_148:Array;
      
      private var var_2249:Boolean;
      
      private var var_2251:Boolean;
      
      private var var_1599:Array;
      
      private var var_2246:Boolean;
      
      private var var_2247:Boolean;
      
      public function ModeratorInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get banPermission() : Boolean
      {
         return var_2247;
      }
      
      public function get roomKickPermission() : Boolean
      {
         return var_2245;
      }
      
      public function get alertPermission() : Boolean
      {
         return var_2252;
      }
      
      public function get cfhPermission() : Boolean
      {
         return var_2249;
      }
      
      public function get roomMessageTemplates() : Array
      {
         return _roomMessageTemplates;
      }
      
      public function get roomAlertPermission() : Boolean
      {
         return var_2251;
      }
      
      public function get messageTemplates() : Array
      {
         return var_1600;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:IssueInfoMessageParser = new IssueInfoMessageParser();
         var_148 = [];
         var_1600 = [];
         _roomMessageTemplates = [];
         var_1599 = [];
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(!_loc2_.parse(param1))
            {
               return false;
            }
            var_148.push(_loc2_.issueData);
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1600.push(param1.readString());
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1599.push(new OffenceCategoryData(param1));
            _loc4_++;
         }
         var_2249 = param1.readBoolean();
         var_2248 = param1.readBoolean();
         var_2252 = param1.readBoolean();
         var_2250 = param1.readBoolean();
         var_2247 = param1.readBoolean();
         var_2251 = param1.readBoolean();
         var_2245 = param1.readBoolean();
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _roomMessageTemplates.push(param1.readString());
            _loc4_++;
         }
         var_2246 = param1.readBoolean();
         return true;
      }
      
      public function get kickPermission() : Boolean
      {
         return var_2250;
      }
      
      public function get offenceCategories() : Array
      {
         return var_1599;
      }
      
      public function get issues() : Array
      {
         return var_148;
      }
      
      public function get bobbaFilterPermission() : Boolean
      {
         return var_2246;
      }
      
      public function get chatlogsPermission() : Boolean
      {
         return var_2248;
      }
   }
}
