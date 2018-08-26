/// @func p3d_gui_hscrollbar()
/// @desc Creates a new horizontal scrollbar.
/// @return {real} The created horizontal scrollbar.
var _scrollbar = p3d_gui_widgetset();
var _height             = 16;
_scrollbar[? "height"]  = _height;
_scrollbar[? "scrDraw"] = p3d_gui_draw_hscrollbar;
var _thumb              = p3d_gui_hscrollbar_thumb();
_thumb[? "height"]      = _height;
p3d_gui_add_widget(_scrollbar, _thumb);
return _scrollbar;