/// @func xGuiCheckbox(checked)
var _cb = xGuiWidget();
_cb[? "checked"] = argument0;
_cb[? "width"] = 24;
_cb[? "height"] = 24;
_cb[? "scrDraw"] = xGuiDrawCheckbox;
xGuiAddEventAction(_cb, "click", xGuiOnClickCheckbox);
return _cb;