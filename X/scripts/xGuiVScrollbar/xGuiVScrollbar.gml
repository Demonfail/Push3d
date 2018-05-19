/// @func xGuiVScrollbar()
/// @desc Creates a new vertical scrollbar.
/// @return {real} The created vertical scrollbar.
var _scrollbar = xGuiWidgetSet();
var _width = 16;
_scrollbar[? "width"] = _width;
_scrollbar[? "scrDraw"] = xGuiDrawVScrollbar;
var _thumb = xGuiVScrollbarThumb();
_thumb[? "width"] = _width;
xGuiAddWidget(_scrollbar, _thumb);
return _scrollbar;