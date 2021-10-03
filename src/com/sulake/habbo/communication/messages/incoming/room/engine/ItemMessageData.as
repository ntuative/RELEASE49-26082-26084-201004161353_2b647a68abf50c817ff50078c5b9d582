package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ItemMessageData
   {
       
      
      private var var_84:Number = 0;
      
      private var _data:String = "";
      
      private var var_1409:int = 0;
      
      private var var_31:int = 0;
      
      private var _type:int = 0;
      
      private var _y:Number = 0;
      
      private var var_2213:Boolean = false;
      
      private var var_2379:String = "";
      
      private var _id:int = 0;
      
      private var var_206:Boolean = false;
      
      private var var_228:String = "";
      
      private var var_2214:int = 0;
      
      private var var_2212:int = 0;
      
      private var var_1989:int = 0;
      
      private var var_1993:int = 0;
      
      public function ItemMessageData(param1:int, param2:int, param3:Boolean)
      {
         super();
         _id = param1;
         _type = param2;
         var_2213 = param3;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_206)
         {
            _y = param1;
         }
      }
      
      public function get isOldFormat() : Boolean
      {
         return var_2213;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_206)
         {
            _type = param1;
         }
      }
      
      public function get dir() : String
      {
         return var_228;
      }
      
      public function get state() : int
      {
         return var_31;
      }
      
      public function set localX(param1:Number) : void
      {
         if(!var_206)
         {
            var_1989 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set wallX(param1:Number) : void
      {
         if(!var_206)
         {
            var_2214 = param1;
         }
      }
      
      public function set wallY(param1:Number) : void
      {
         if(!var_206)
         {
            var_2212 = param1;
         }
      }
      
      public function set dir(param1:String) : void
      {
         if(!var_206)
         {
            var_228 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function set localY(param1:Number) : void
      {
         if(!var_206)
         {
            var_1993 = param1;
         }
      }
      
      public function set state(param1:int) : void
      {
         if(!var_206)
         {
            var_31 = param1;
         }
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get localX() : Number
      {
         return var_1989;
      }
      
      public function set data(param1:String) : void
      {
         if(!var_206)
         {
            _data = param1;
         }
      }
      
      public function get wallX() : Number
      {
         return var_2214;
      }
      
      public function get wallY() : Number
      {
         return var_2212;
      }
      
      public function get localY() : Number
      {
         return var_1993;
      }
      
      public function setReadOnly() : void
      {
         var_206 = true;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_84;
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_206)
         {
            var_84 = param1;
         }
      }
   }
}
