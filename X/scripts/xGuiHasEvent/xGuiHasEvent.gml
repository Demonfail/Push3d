/// @func xGuiHasEvent(gui)
if (!ds_map_exists(argument0, "events"))
{
	return false;
}
return !ds_stack_empty(argument0[? "events"]);