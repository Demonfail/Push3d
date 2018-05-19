/// @func xGuiHSliderThumb()
var _thumb = xGuiWidget();
_thumb[? "width"] = 24;
_thumb[? "height"] = 24;
_thumb[? "mouseXOffset"] = 0;
_thumb[? "scrDraw"] = xGuiDrawHSliderThumb;
xGuiAddEventAction(_thumb, "dragstart", xGuiOnDragStartHSliderThumb);
xGuiAddEventAction(_thumb, "drag", xGuiOnDragHSliderThumb);
return _thumb;