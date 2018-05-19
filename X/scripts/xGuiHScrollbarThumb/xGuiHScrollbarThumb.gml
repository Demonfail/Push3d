/// @func xGuiHScrollbarThumb()
var _thumb = xGuiWidget();
_thumb[? "width"] = 32;
_thumb[? "mouseXOffset"] = 0;
_thumb[? "scrDraw"] = xGuiDrawHScrollbarThumb;
xGuiAddEventAction(_thumb, "dragstart", xGuiOnDragStartHScrollbarThumb);
xGuiAddEventAction(_thumb, "drag", xGuiOnDragHScrollbarThumb);
return _thumb;