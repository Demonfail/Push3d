/// @func p3d_gui_event_mousedown(button, alt, ctrl, shift)
/// @desc Creates a new "mousedown" event.
/// @param {real} button The mouse button that is down.
/// @param {bool} alt    True if the alt key is down.
/// @param {bool} ctrl   True if the ctrl key is down.
/// @param {bool} shift  True if the shift key is down.
/// @return {real} The created event.
var _e = p3d_gui_event("mousedown");
_e[? "bubble"] = false;
_e[? "button"] = argument0;
_e[? "alt"]    = argument1;
_e[? "ctrl"]   = argument2;
_e[? "shift"]  = argument3;
return _e;