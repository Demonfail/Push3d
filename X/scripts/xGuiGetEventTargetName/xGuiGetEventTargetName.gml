/// @func xGuiGetEventTargetName(event)
/// @desc Gets the name of the event's target widget.
/// @return {string} The name of the event's target widget.
gml_pragma("forceinline");
return ds_map_find_value(argument0[? "target"], "name");