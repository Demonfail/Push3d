/// @func xGuiEvent(type)
var _e = ds_map_create();
_e[? "type"] = argument0;
_e[? "target"] = noone;
_e[? "bubble"] = true;
return _e;