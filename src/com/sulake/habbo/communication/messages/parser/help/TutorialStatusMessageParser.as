package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1102:Boolean;
      
      private var var_1103:Boolean;
      
      private var var_1104:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return var_1102;
      }
      
      public function get hasChangedName() : Boolean
      {
         return var_1103;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1104 = param1.readBoolean();
         var_1103 = param1.readBoolean();
         var_1102 = param1.readBoolean();
         return true;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return var_1104;
      }
      
      public function flush() : Boolean
      {
         var_1104 = false;
         var_1103 = false;
         var_1102 = false;
         return true;
      }
   }
}
