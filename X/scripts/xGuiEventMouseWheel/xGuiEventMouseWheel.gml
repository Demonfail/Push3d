/// @func xGuiEventMouseWheel(wheel, alt, ctrl, shift)
var _e = xGuiEvent("mousewheel");
_e[? "wheel"] = argument0;
_e[? "alt"] = argument1;
_e[? "ctrl"] = argument2;
_e[? "shift"] = argument3;
return _e;