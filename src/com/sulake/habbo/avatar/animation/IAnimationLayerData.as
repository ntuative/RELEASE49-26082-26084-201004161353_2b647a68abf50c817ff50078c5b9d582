package com.sulake.habbo.avatar.animation
{
   import com.sulake.habbo.avatar.actions.IActiveActionData;
   
   public interface IAnimationLayerData
   {
       
      
      function get method_5() : int;
      
      function get dx() : int;
      
      function get dy() : int;
      
      function get dz() : int;
      
      function get animationFrame() : int;
      
      function get id() : String;
      
      function get action() : IActiveActionData;
      
      function get frameCounter() : int;
   }
}
