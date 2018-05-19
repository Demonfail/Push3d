/// @func xGuiCreate()
var _gui = xGuiWidgetSet();
_gui[? "events"] = ds_stack_create();
_gui[? "mouseX"] = 0;
_gui[? "mouseY"] = 0;
_gui[? "mouseXPrev"] = 0;
_gui[? "mouseYPrev"] = 0;
_gui[? "mouseXOffset"] = 0;
_gui[? "mouseYOffset"] = 0;
_gui[? "widgetDrag"] = noone;
_gui[? "dragging"] = false;
_gui[? "widgetHovered"] = undefined;
return _gui;