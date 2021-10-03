package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PopularTagData
   {
       
      
      private var var_1684:int;
      
      private var var_1917:String;
      
      public function PopularTagData(param1:IMessageDataWrapper)
      {
         super();
         var_1917 = param1.readString();
         var_1684 = param1.readInteger();
      }
      
      public function get tagName() : String
      {
         return var_1917;
      }
      
      public function get userCount() : int
      {
         return var_1684;
      }
   }
}
