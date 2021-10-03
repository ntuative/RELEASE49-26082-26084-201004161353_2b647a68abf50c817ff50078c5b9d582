package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["HabboCommunicationMessagesIn"] = const_133;
         param1["bound_to_parent_rect"] = const_91;
         param1["child_window"] = const_1000;
         param1["embedded_controller"] = const_325;
         param1["resize_to_accommodate_children"] = const_69;
         param1["input_event_processor"] = const_49;
         param1["internal_event_handling"] = const_700;
         param1["mouse_dragging_target"] = const_200;
         param1["mouse_dragging_trigger"] = const_324;
         param1["mouse_scaling_target"] = const_256;
         param1["mouse_scaling_trigger"] = const_369;
         param1["horizontal_mouse_scaling_trigger"] = const_225;
         param1["vertical_mouse_scaling_trigger"] = const_217;
         param1["observe_parent_input_events"] = const_872;
         param1["optimize_region_to_layout_size"] = const_432;
         param1["parent_window"] = const_934;
         param1["relative_horizontal_scale_center"] = const_181;
         param1["relative_horizontal_scale_fixed"] = const_121;
         param1["relative_horizontal_scale_move"] = const_342;
         param1["relative_horizontal_scale_strech"] = const_274;
         param1["relative_scale_center"] = const_953;
         param1["relative_scale_fixed"] = const_676;
         param1["relative_scale_move"] = const_916;
         param1["relative_scale_strech"] = const_895;
         param1["relative_vertical_scale_center"] = const_177;
         param1["relative_vertical_scale_fixed"] = const_127;
         param1["relative_vertical_scale_move"] = const_321;
         param1["relative_vertical_scale_strech"] = const_259;
         param1["on_resize_align_left"] = const_689;
         param1["on_resize_align_right"] = const_485;
         param1["on_resize_align_center"] = const_416;
         param1["on_resize_align_top"] = const_614;
         param1["on_resize_align_bottom"] = const_421;
         param1["on_resize_align_middle"] = const_395;
         param1["on_accommodate_align_left"] = const_984;
         param1["on_accommodate_align_right"] = const_483;
         param1["on_accommodate_align_center"] = const_692;
         param1["on_accommodate_align_top"] = const_964;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_728;
         param1["route_input_events_to_parent"] = const_450;
         param1["use_parent_graphic_context"] = const_34;
         param1["draggable_with_mouse"] = const_878;
         param1["scalable_with_mouse"] = const_887;
         param1["reflect_horizontal_resize_to_parent"] = const_371;
         param1["reflect_vertical_resize_to_parent"] = WINDOW_PARAM_REFLECT_VERTICAL_RESIZE_TO_PARENT;
         param1["reflect_resize_to_parent"] = const_242;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  if(param1[_loc3_] != 0)
                  {
                     Logger.log("Conflictiong flags in window params: \"" + _loc3_ + "\"!");
                  }
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
