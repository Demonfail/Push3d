/// @func xGuiEvent(type)
/// @desc Creates a new event of given type.
/// @param {string} type The event type.
/// @return {real} The created event.
var _e = ds_map_create();
_e[? "type"] = argument0;
_e[? "target"] = noone;
_e[? "bubble"] = true;
return _e;