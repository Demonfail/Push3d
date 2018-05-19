/// @func xGuiOnClickCheckbox(checkbox, event)
var _checked = argument0[? "checked"];
argument0[? "checked"] = !_checked;
xGuiTriggerEvent(argument0, xGuiEventChange(_checked, !_checked));
xGuiTriggerEvent(argument0, xGuiEventRedraw());