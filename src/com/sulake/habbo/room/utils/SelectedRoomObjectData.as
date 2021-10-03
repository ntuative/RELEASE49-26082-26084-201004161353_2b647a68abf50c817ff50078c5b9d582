package com.sulake.habbo.room.utils
{
   import com.sulake.habbo.room.ISelectedRoomObjectData;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class SelectedRoomObjectData implements ISelectedRoomObjectData
   {
       
      
      private var var_71:Vector3d = null;
      
      private var _id:int = 0;
      
      private var var_228:Vector3d = null;
      
      private var var_1681:int = 0;
      
      private var var_2240:String = null;
      
      private var _category:int = 0;
      
      private var var_2241:String = "";
      
      public function SelectedRoomObjectData(param1:int, param2:int, param3:String, param4:IVector3d, param5:IVector3d, param6:int = 0, param7:String = null)
      {
         super();
         _id = param1;
         _category = param2;
         var_2241 = param3;
         var_71 = new Vector3d();
         var_71.assign(param4);
         var_228 = new Vector3d();
         var_228.assign(param5);
         var_1681 = param6;
         var_2240 = param7;
      }
      
      public function get loc() : Vector3d
      {
         return var_71;
      }
      
      public function get typeId() : int
      {
         return var_1681;
      }
      
      public function get dir() : Vector3d
      {
         return var_228;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get instanceData() : String
      {
         return var_2240;
      }
      
      public function get operation() : String
      {
         return var_2241;
      }
      
      public function dispose() : void
      {
         var_71 = null;
         var_228 = null;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
