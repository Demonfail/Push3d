/// @func xGuiGetEventTargetName(event)
gml_pragma("forceinline");
return ds_map_find_value(argument0[? "target"], "name");