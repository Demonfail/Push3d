/// @func p3d_gui_hscrollbar_thumb()
/// @desc Creates a new horizontal scrollbar thumb.
/// @return {real} The created horizontal scrollbar thumb.
var _thumb = p3d_gui_widget();
_thumb[? "width"]        = 32;
_thumb[? "mouseXOffset"] = 0;
_thumb[? "scrDraw"]      = p3d_gui_draw_hscrollbar_thumb;
p3d_gui_add_event_action(_thumb, "dragstart", p3d_gui_ondragstart_hscrollbar_thumb);
p3d_gui_add_event_action(_thumb, "drag", p3d_gui_ondrag_hscrollbar_thumb);
return _thumb;