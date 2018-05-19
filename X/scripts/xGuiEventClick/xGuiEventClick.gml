/// @func xGuiEventClick(alt, ctrl, shift)
var _e = xGuiEvent("click");
_e[? "alt"] = argument0;
_e[? "ctrl"] = argument1;
_e[? "shift"] = argument2;
return _e;