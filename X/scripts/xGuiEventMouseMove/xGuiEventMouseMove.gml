/// @func xGuiEventMouseMove(button, x, y, prevX, prevY, alt, ctrl, shift)
var _e = xGuiEvent("mousemove");
_e[? "button"] = argument0;
_e[? "x"] = argument1;
_e[? "y"] = argument2;
_e[? "prevX"] = argument3;
_e[? "prevY"] = argument4;
_e[? "alt"] = argument5;
_e[? "ctrl"] = argument6;
_e[? "shift"] = argument7;
return _e;