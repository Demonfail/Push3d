/// @func p3d_gui_has_event(gui)
/// @desc Checks whether some events occurred within the GUI system.
/// @param {real} gui The GUI system.
/// @return {bool} True if there are some event.
/// @see p3d_gui_het_event
if (!ds_map_exists(argument0, "events"))
{
	return false;
}
return !ds_stack_empty(argument0[? "events"]);