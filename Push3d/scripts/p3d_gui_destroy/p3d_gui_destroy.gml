/// @func p3d_gui_destroy(gui)
/// @desc Destroys the GUI system.
/// @param {real} gui The GUI system to be destroyed.
var _events = argument0[? "events"];
repeat (ds_stack_size(_events))
{
	ds_map_destroy(ds_stack_pop(_events));
}
ds_stack_destroy(_events);