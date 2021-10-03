package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_1796:String;
      
      private var var_628:String;
      
      private var var_1598:int;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         var_1598 = param1.readInteger();
         var_1796 = param1.readString();
         var_628 = param1.readString();
      }
      
      public function get gender() : String
      {
         return var_628;
      }
      
      public function get figureString() : String
      {
         return var_1796;
      }
      
      public function get slotId() : int
      {
         return var_1598;
      }
   }
}
