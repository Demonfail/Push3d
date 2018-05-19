/// @func xGuiVScrollbarThumb()
var _thumb = xGuiWidget();
_thumb[? "height"] = 32;
_thumb[? "mouseYOffset"] = 0;
_thumb[? "scrDraw"] = xGuiDrawVScrollbarThumb;
xGuiAddEventAction(_thumb, "dragstart", xGuiOnDragStartVScrollbarThumb);
xGuiAddEventAction(_thumb, "drag", xGuiOnDragVScrollbarThumb);
return _thumb;