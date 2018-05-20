/// @func xGuiDestroyEvent(event)
/// @desc Destroys the event.
/// @param {real} event The event to be destroyed.
gml_pragma("forceinline");
ds_map_destroy(argument0);