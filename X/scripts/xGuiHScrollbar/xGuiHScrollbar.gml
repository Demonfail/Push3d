/// @func xGuiHScrollbar()
/// @desc Creates a new horizontal scrollbar.
/// @return {real} The created horizontal scrollbar.
var _scrollbar = xGuiWidgetSet();
var _height = 16;
_scrollbar[? "height"] = _height;
_scrollbar[? "scrDraw"] = xGuiDrawHScrollbar;
var _thumb = xGuiHScrollbarThumb();
_thumb[? "height"] = _height;
xGuiAddWidget(_scrollbar, _thumb);
return _scrollbar;