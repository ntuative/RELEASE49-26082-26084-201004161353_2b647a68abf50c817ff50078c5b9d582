package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1300:String = "F";
      
      public static const const_986:String = "M";
       
      
      private var var_83:Number = 0;
      
      private var var_294:String = "";
      
      private var var_2242:int = 0;
      
      private var var_1795:String = "";
      
      private var var_1794:int = 0;
      
      private var var_1772:int = 0;
      
      private var var_1793:String = "";
      
      private var var_606:String = "";
      
      private var _id:int = 0;
      
      private var var_206:Boolean = false;
      
      private var var_228:int = 0;
      
      private var var_2243:String = "";
      
      private var _name:String = "";
      
      private var var_1763:int = 0;
      
      private var _y:Number = 0;
      
      private var var_84:Number = 0;
      
      public function UserMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get z() : Number
      {
         return var_84;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get dir() : int
      {
         return var_228;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_206)
         {
            var_228 = param1;
         }
      }
      
      public function set name(param1:String) : void
      {
         if(!var_206)
         {
            _name = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get userType() : int
      {
         return var_2242;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!var_206)
         {
            var_1794 = param1;
         }
      }
      
      public function get subType() : String
      {
         return var_2243;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!var_206)
         {
            var_1793 = param1;
         }
      }
      
      public function set subType(param1:String) : void
      {
         if(!var_206)
         {
            var_2243 = param1;
         }
      }
      
      public function set xp(param1:int) : void
      {
         if(!var_206)
         {
            var_1772 = param1;
         }
      }
      
      public function set figure(param1:String) : void
      {
         if(!var_206)
         {
            var_294 = param1;
         }
      }
      
      public function set userType(param1:int) : void
      {
         if(!var_206)
         {
            var_2242 = param1;
         }
      }
      
      public function set sex(param1:String) : void
      {
         if(!var_206)
         {
            var_606 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return var_1794;
      }
      
      public function get groupID() : String
      {
         return var_1793;
      }
      
      public function set webID(param1:int) : void
      {
         if(!var_206)
         {
            var_1763 = param1;
         }
      }
      
      public function set custom(param1:String) : void
      {
         if(!var_206)
         {
            var_1795 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_206 = true;
      }
      
      public function get sex() : String
      {
         return var_606;
      }
      
      public function get figure() : String
      {
         return var_294;
      }
      
      public function get webID() : int
      {
         return var_1763;
      }
      
      public function get custom() : String
      {
         return var_1795;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_206)
         {
            _y = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_206)
         {
            var_84 = param1;
         }
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_206)
         {
            var_83 = param1;
         }
      }
      
      public function get x() : Number
      {
         return var_83;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get xp() : int
      {
         return var_1772;
      }
   }
}
