/// @func p3d_gui_event_dragstart(x, y)
/// @desc Creates a new "dragstart" event.
/// @param {real} x The starting x position.
/// @param {real} y The starting y position.
/// @return {real} The created event.
var _e = p3d_gui_event("dragstart");
_e[? "x"] = argument0;
_e[? "y"] = argument1;
return _e;