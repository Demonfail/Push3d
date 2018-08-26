/// @func p3d_gui_hslider(valueMin, valueMax)
/// @desc Creates a new horizontal slider.
/// @param {real} valueMin The minimal value of the slider.
/// @param {real} valueMax The maxmimum value of the slider.
/// @return {real} The created horizontal slider.
var _slider = p3d_gui_widgetset();
var _height          = 16;
_slider[? "value"]   = argument0;
_slider[? "min"]     = argument0;
_slider[? "max"]     = argument1;
_slider[? "height"]  = _height;
_slider[? "scrDraw"] = p3d_gui_draw_hslider;
var _thumb           = p3d_gui_hslider_thumb();
_thumb[? "y"]        += round((_height - _thumb[? "height"]) * 0.5);
p3d_gui_add_widget(_slider, _thumb);
return _slider;