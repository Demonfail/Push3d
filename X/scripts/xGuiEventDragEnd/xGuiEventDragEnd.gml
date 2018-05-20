/// @func xGuiEventDragEnd(x, y)
/// @desc Creates a new "dragend" event.
/// @param {real} x The final x position.
/// @param {real} y The final y position.
/// @return {real} The created event.
var _e = xGuiEvent("dragend");
_e[? "x"] = argument0;
_e[? "y"] = argument1;
return _e;