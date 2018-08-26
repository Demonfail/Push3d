/// @func p3d_gui_button(text)
/// @desc Creates a new button.
/// @param {string} text The text on the button.
/// @return {real} The created button.
var _b = p3d_gui_widget();
_b[? "text"]    = argument0;
//_b[? "width"]   = 64;
_b[? "height"]  = 24;
_b[? "scrDraw"] = p3d_gui_draw_button;
return _b;