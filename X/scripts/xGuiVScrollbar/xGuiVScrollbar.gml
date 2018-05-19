/// @func xGuiVScrollbar()
var _scrollbar = xGuiWidgetSet();
var _width = 16;
_scrollbar[? "width"] = _width;
_scrollbar[? "scrDraw"] = xGuiDrawVScrollbar;
var _thumb = xGuiVScrollbarThumb();
_thumb[? "width"] = _width;
xGuiAddWidget(_scrollbar, _thumb);
return _scrollbar;