/// @func xGuiGetEvent(gui)
/// @desc Gets an event that occurred within the GUI system.
/// @param {real} gui The GUI system to get an event from.
/// @return {real} The event.
/// @note All events retrieved with this function must be destroyed when you're
///       done using them!
/// @see xGuiHasEvent
/// @see xGuiDestroyEvent
gml_pragma("forceinline");
return ds_stack_pop(argument0[? "events"]);