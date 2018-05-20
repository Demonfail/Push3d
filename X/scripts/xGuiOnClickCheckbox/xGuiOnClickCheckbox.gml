/// @func xGuiOnClickCheckbox(checkbox, event)
/// @desc Defines how checkbox handles a "click" event.
/// @param {real} checkbox The checkbox.
/// @param {real} event    The event to handle.
var _checked = argument0[? "checked"];
argument0[? "checked"] = !_checked;
xGuiTriggerEvent(argument0, xGuiEventChange(_checked, !_checked), xGuiEventRedraw());