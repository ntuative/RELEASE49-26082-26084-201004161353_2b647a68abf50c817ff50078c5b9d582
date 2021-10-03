package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_345:Number = 0.5;
      
      private static const const_751:int = 3;
      
      private static const const_1061:Number = 1;
       
      
      private var var_1742:Boolean = false;
      
      private var var_1739:Boolean = false;
      
      private var var_974:int = 0;
      
      private var var_248:Vector3d = null;
      
      private var var_1747:int = 0;
      
      private var var_1746:int = 0;
      
      private var var_1744:Boolean = false;
      
      private var var_1741:int = -2;
      
      private var var_1743:Boolean = false;
      
      private var var_1745:int = 0;
      
      private var var_1748:int = -1;
      
      private var var_387:Vector3d = null;
      
      private var var_1740:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get roomWd() : int
      {
         return var_1747;
      }
      
      public function get targetId() : int
      {
         return var_1748;
      }
      
      public function set roomHt(param1:int) : void
      {
         var_1745 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         var_1747 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         var_1742 = param1;
      }
      
      public function set targetId(param1:int) : void
      {
         var_1748 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         var_1739 = param1;
      }
      
      public function dispose() : void
      {
         var_387 = null;
         var_248 = null;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(var_387 == null)
         {
            var_387 = new Vector3d();
         }
         var_387.assign(param1);
         var_974 = 0;
      }
      
      public function get targetCategory() : int
      {
         return var_1741;
      }
      
      public function get screenHt() : int
      {
         return var_1740;
      }
      
      public function set screenWd(param1:int) : void
      {
         var_1746 = param1;
      }
      
      public function get location() : IVector3d
      {
         return var_248;
      }
      
      public function set screenHt(param1:int) : void
      {
         var_1740 = param1;
      }
      
      public function get roomHt() : int
      {
         return var_1745;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return var_1742;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return var_1739;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(var_387 != null && var_248 != null)
         {
            ++var_974;
            _loc2_ = Vector3d.dif(var_387,var_248);
            if(_loc2_.length <= const_345)
            {
               var_248 = var_387;
               var_387 = null;
            }
            else
            {
               _loc2_.div(_loc2_.length);
               if(_loc2_.length < const_345 * (const_751 + 1))
               {
                  _loc2_.mul(const_345);
               }
               else if(var_974 <= const_751)
               {
                  _loc2_.mul(const_345);
               }
               else
               {
                  _loc2_.mul(const_1061);
               }
               var_248 = Vector3d.sum(var_248,_loc2_);
            }
         }
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         var_1744 = param1;
      }
      
      public function get screenWd() : int
      {
         return var_1746;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         var_1743 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         var_1741 = param1;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(var_248 != null)
         {
            return;
         }
         var_248 = new Vector3d();
         var_248.assign(param1);
      }
      
      public function get centeredLocX() : Boolean
      {
         return var_1744;
      }
      
      public function get centeredLocY() : Boolean
      {
         return var_1743;
      }
   }
}
