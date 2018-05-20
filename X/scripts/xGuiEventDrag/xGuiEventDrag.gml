/// @func xGuiEventDrag(x, y)
/// @desc Creates a new "drag" event.
/// @param {real} x The new x position.
/// @param {real} y The new y position.
/// @return {real} The created event.
var _e = xGuiEvent("drag");
_e[? "x"] = argument0;
_e[? "y"] = argument1;
return _e;