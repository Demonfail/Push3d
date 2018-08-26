/// @func p3d_gui_get_event_target_name(event)
/// @desc Gets the name of the event's target widget.
/// @return {string} The name of the event's target widget.
gml_pragma("forceinline");
return ds_map_find_value(argument0[? "target"], "name");