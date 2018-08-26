/// @func p3d_gui_vscrollbar()
/// @desc Creates a new vertical scrollbar.
/// @return {real} The created vertical scrollbar.
var _scrollbar = p3d_gui_widgetset();
var _width              = 16;
_scrollbar[? "width"]   = _width;
_scrollbar[? "scrDraw"] = p3d_gui_draw_vscrollbar;
var _thumb              = p3d_gui_vscrollbar_thumb();
_thumb[? "width"]       = _width;
p3d_gui_add_widget(_scrollbar, _thumb);
return _scrollbar;