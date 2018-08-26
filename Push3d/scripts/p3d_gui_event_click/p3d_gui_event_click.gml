/// @func p3d_gui_event_click(alt, ctrl, shift)
/// @desc Creates a new "click" event.
/// @param {bool} alt   True if the alt key was held during the click.
/// @param {bool} ctrl  True if the ctrl key was held during the click.
/// @param {bool} shift True if the shift key was held during the click.
/// @return {real} The created event.
var _e = p3d_gui_event("click");
_e[? "alt"]   = argument0;
_e[? "ctrl"]  = argument1;
_e[? "shift"] = argument2;
return _e;