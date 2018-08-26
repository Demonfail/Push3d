/// @func p3d_gui_checkbox(checked)
/// @desc Creates a new checkbox.
/// @param {bool} checked True to set it's default state to "checked".
/// @return {real} The created checkbox.
var _cb = p3d_gui_widget();
_cb[? "checked"] = argument0;
_cb[? "width"]   = 24;
_cb[? "height"]  = 24;
_cb[? "scrDraw"] = p3d_gui_draw_checkbox;
p3d_gui_add_event_action(_cb, "click", p3d_gui_onclick_checkbox);
return _cb;