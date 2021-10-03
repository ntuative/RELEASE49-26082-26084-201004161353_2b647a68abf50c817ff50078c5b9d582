package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var var_294:String;
      
      private var var_2320:String;
      
      private var var_2318:int;
      
      private var var_2319:int;
      
      private var var_606:String;
      
      private var var_1130:String;
      
      private var _name:String;
      
      private var var_492:int;
      
      private var var_838:int;
      
      private var var_2316:int;
      
      private var var_2123:int;
      
      private var var_2317:String;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function get directMail() : int
      {
         return this.var_2319;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get realName() : String
      {
         return this.var_1130;
      }
      
      public function get customData() : String
      {
         return this.var_2320;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_492;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2318;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2317;
      }
      
      public function get figure() : String
      {
         return this.var_294;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2123;
      }
      
      public function get sex() : String
      {
         return this.var_606;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_294 = param1.readString();
         this.var_606 = param1.readString();
         this.var_2320 = param1.readString();
         this.var_1130 = param1.readString();
         this.var_2316 = param1.readInteger();
         this.var_2317 = param1.readString();
         this.var_2318 = param1.readInteger();
         this.var_2319 = param1.readInteger();
         this.var_2123 = param1.readInteger();
         this.var_838 = param1.readInteger();
         this.var_492 = param1.readInteger();
         return true;
      }
      
      public function get tickets() : int
      {
         return this.var_2316;
      }
      
      public function get respectLeft() : int
      {
         return this.var_838;
      }
   }
}
