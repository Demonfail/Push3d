/// @func xGuiHScrollbar()
var _scrollbar = xGuiWidgetSet();
var _height = 16;
_scrollbar[? "height"] = _height;
_scrollbar[? "scrDraw"] = xGuiDrawHScrollbar;
var _thumb = xGuiHScrollbarThumb();
_thumb[? "height"] = _height;
xGuiAddWidget(_scrollbar, _thumb);
return _scrollbar;