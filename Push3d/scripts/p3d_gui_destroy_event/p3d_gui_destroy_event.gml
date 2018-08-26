/// @func p3d_gui_destroy_event(event)
/// @desc Destroys the event.
/// @param {real} event The event to be destroyed.
gml_pragma("forceinline");
ds_map_destroy(argument0);