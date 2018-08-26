/// @func p3d_gui_onclick_checkbox(checkbox, event)
/// @desc Defines how checkbox handles a "click" event.
/// @param {real} checkbox The checkbox.
/// @param {real} event    The event to handle.
var _checked           = argument0[? "checked"];
argument0[? "checked"] = !_checked;
p3d_gui_trigger_event(argument0,
	p3d_gui_event_change(_checked, !_checked), p3d_gui_event_redraw());