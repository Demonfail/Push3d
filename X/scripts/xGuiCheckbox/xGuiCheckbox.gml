/// @func xGuiCheckbox(checked)
/// @desc Creates a new checkbox.
/// @param {bool} checked True to set it's default state to "checked".
/// @return {real} The created checkbox.
var _cb = xGuiWidget();
_cb[? "checked"] = argument0;
_cb[? "width"] = 24;
_cb[? "height"] = 24;
_cb[? "scrDraw"] = xGuiDrawCheckbox;
xGuiAddEventAction(_cb, "click", xGuiOnClickCheckbox);
return _cb;