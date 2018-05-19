/// @func xGuiEventMouseUp(button, alt, ctrl, shift)
var _e = xGuiEvent("mouseup");
_e[? "bubble"] = false;
_e[? "button"] = argument0;
_e[? "alt"] = argument1;
_e[? "ctrl"] = argument2;
_e[? "shift"] = argument3;
return _e;