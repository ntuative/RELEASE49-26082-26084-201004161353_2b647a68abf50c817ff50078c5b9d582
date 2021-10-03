package com.sulake.habbo.avatar.pets
{
   public class Breed extends PetEditorInfo implements IBreed
   {
       
      
      private var var_628:String;
      
      private var _id:int;
      
      private var var_1900:String = "";
      
      private var var_1899:int;
      
      private var var_1898:String;
      
      private var var_1897:Boolean;
      
      public function Breed(param1:XML)
      {
         super(param1);
         _id = parseInt(param1.@id);
         var_1899 = parseInt(param1.@pattern);
         var_628 = String(param1.@gender);
         var_1897 = Boolean(parseInt(param1.@colorable));
         var_1900 = String(param1.@localizationKey);
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get localizationKey() : String
      {
         return var_1900;
      }
      
      public function get isColorable() : Boolean
      {
         return var_1897;
      }
      
      public function get gender() : String
      {
         return var_628;
      }
      
      public function get patternId() : int
      {
         return var_1899;
      }
      
      public function get avatarFigureString() : String
      {
         return var_1898;
      }
      
      public function set avatarFigureString(param1:String) : void
      {
         var_1898 = param1;
      }
   }
}
