/// @func xGuiEventKeyDown(key, alt, ctrl, shift)
var _e = xGuiEvent("keydown");
_e[? "bubble"] = false;
_e[? "key"] = argument0;
_e[? "alt"] = argument1;
_e[? "ctrl"] = argument2;
_e[? "shift"] = argument3;
return _e;