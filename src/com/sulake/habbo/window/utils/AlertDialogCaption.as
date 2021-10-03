package com.sulake.habbo.window.utils
{
   class AlertDialogCaption implements ICaption
   {
       
      
      private var var_363:Boolean;
      
      private var var_189:String;
      
      private var var_1167:String;
      
      function AlertDialogCaption(param1:String, param2:String, param3:Boolean)
      {
         super();
         var_189 = param1;
         var_1167 = param2;
         var_363 = param3;
      }
      
      public function get toolTip() : String
      {
         return var_1167;
      }
      
      public function set visible(param1:Boolean) : void
      {
         var_363 = param1;
      }
      
      public function get text() : String
      {
         return var_189;
      }
      
      public function get visible() : Boolean
      {
         return var_363;
      }
      
      public function set toolTip(param1:String) : void
      {
         var_1167 = param1;
      }
      
      public function set text(param1:String) : void
      {
         var_189 = param1;
      }
   }
}
