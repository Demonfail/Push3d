/// @func p3d_gui_vscrollbar_thumb()
/// @desc Creates a new vertical scrollbar thumb.
/// @return {real} The created vertical scrollbar thumb.
var _thumb = p3d_gui_widget();
_thumb[? "height"]       = 32;
_thumb[? "mouseYOffset"] = 0;
_thumb[? "scrDraw"]      = p3d_gui_draw_vscrollbar_thumb;
p3d_gui_add_event_action(_thumb, "dragstart", p3d_gui_ondragstart_vscrollbar_thumb);
p3d_gui_add_event_action(_thumb, "drag", p3d_gui_ondrag_vscrollbar_thumb);
return _thumb;