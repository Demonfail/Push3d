/// @func xGuiGetEvent(gui)
gml_pragma("forceinline");
return ds_stack_pop(argument0[? "events"]);