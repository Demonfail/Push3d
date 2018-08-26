/// @func p3d_gui_event_mousemove(button, x, y, prevX, prevY, alt, ctrl, shift)
/// @desc Creates a new "mousemove" event.
/// @param {real} button The mouse button that was down during the mouse
///                      movement.
/// @param {real} x      The new mouse x position.
/// @param {real} y      The new mouse y position.
/// @param {real} prevX  The previous mouse x position.
/// @param {real} prevY  The previous mouse y position.
/// @param {bool} alt    True if the alt key was held during the mouse movement.
/// @param {bool} ctrl   True if the ctrl key was held during the mouse
///                      movement.
/// @param {bool} shift  True if the shift key was held during the mouse
///                      movement.
/// @return {real} The created event.
var _e = p3d_gui_event("mousemove");
_e[? "button"] = argument0;
_e[? "x"]      = argument1;
_e[? "y"]      = argument2;
_e[? "prevX"]  = argument3;
_e[? "prevY"]  = argument4;
_e[? "alt"]    = argument5;
_e[? "ctrl"]   = argument6;
_e[? "shift"]  = argument7;
return _e;