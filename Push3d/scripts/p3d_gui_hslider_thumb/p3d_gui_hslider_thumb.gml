/// @func p3d_gui_hslider_thumb()
/// @desc Creates a new horizontal slider thumb.
/// @return {real} The created horizontal slider thumb.
var _thumb = p3d_gui_widget();
_thumb[? "width"]        = 24;
_thumb[? "height"]       = 24;
_thumb[? "mouseXOffset"] = 0;
_thumb[? "scrDraw"]      = p3d_gui_draw_hslider_thumb;
p3d_gui_add_event_action(_thumb, "dragstart", p3d_gui_ondragstart_hslider_thumb);
p3d_gui_add_event_action(_thumb, "drag", p3d_gui_ondrag_hslider_thumb);
return _thumb;