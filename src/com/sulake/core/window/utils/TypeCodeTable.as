package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_517;
         param1["bitmap"] = const_677;
         param1["border"] = const_505;
         param1["border_notify"] = const_1380;
         param1["button"] = const_484;
         param1["button_thick"] = const_545;
         param1["button_icon"] = const_1351;
         param1["button_group_left"] = const_591;
         param1["button_group_center"] = const_631;
         param1["button_group_right"] = const_723;
         param1["canvas"] = const_654;
         param1["checkbox"] = const_543;
         param1["closebutton"] = const_979;
         param1["container"] = const_295;
         param1["container_button"] = const_509;
         param1["display_object_wrapper"] = const_729;
         param1["dropmenu"] = const_385;
         param1["dropmenu_item"] = const_379;
         param1["frame"] = const_300;
         param1["frame_notify"] = const_1374;
         param1["header"] = const_622;
         param1["icon"] = const_805;
         param1["itemgrid"] = const_912;
         param1["itemgrid_horizontal"] = const_428;
         param1["itemgrid_vertical"] = const_685;
         param1["itemlist"] = const_849;
         param1["itemlist_horizontal"] = const_299;
         param1["itemlist_vertical"] = const_331;
         param1["maximizebox"] = const_1190;
         param1["menu"] = const_1204;
         param1["menu_item"] = WINDOW_TYPE_MENU_ITEM;
         param1["submenu"] = const_855;
         param1["minimizebox"] = const_1156;
         param1["notify"] = const_1394;
         param1["HabboCommunicationMessagesIn"] = const_544;
         param1["password"] = const_706;
         param1["radiobutton"] = const_561;
         param1["region"] = const_465;
         param1["restorebox"] = const_1267;
         param1["scaler"] = const_726;
         param1["scaler_horizontal"] = const_1166;
         param1["scaler_vertical"] = const_1145;
         param1["scrollbar_horizontal"] = const_400;
         param1["scrollbar_vertical"] = const_735;
         param1["scrollbar_slider_button_up"] = const_903;
         param1["scrollbar_slider_button_down"] = const_942;
         param1["scrollbar_slider_button_left"] = const_881;
         param1["scrollbar_slider_button_right"] = const_1005;
         param1["scrollbar_slider_bar_horizontal"] = const_959;
         param1["scrollbar_slider_bar_vertical"] = const_1006;
         param1["scrollbar_slider_track_horizontal"] = const_980;
         param1["scrollbar_slider_track_vertical"] = const_1016;
         param1["scrollable_itemlist"] = const_1198;
         param1["scrollable_itemlist_vertical"] = const_449;
         param1["scrollable_itemlist_horizontal"] = const_807;
         param1["selector"] = const_737;
         param1["selector_list"] = const_745;
         param1["submenu"] = const_855;
         param1["tab_button"] = const_683;
         param1["tab_container_button"] = const_905;
         param1["tab_context"] = const_475;
         param1["tab_content"] = const_809;
         param1["tab_selector"] = WINDOW_TYPE_TAB_SELECTOR;
         param1["text"] = const_555;
         param1["input"] = const_694;
         param1["toolbar"] = const_1184;
         param1["tooltip"] = const_326;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  Logger.log("Overlapping window type code " + _loc3_ + "!");
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
