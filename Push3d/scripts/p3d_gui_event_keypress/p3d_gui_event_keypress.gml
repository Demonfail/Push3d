/// @func p3d_gui_event_keypress(key, alt, ctrl, shift)
/// @desc Creates a new "keypress" event.
/// @param {real} key   The key that was pressed.
/// @param {bool} alt   True if the alt key was held during the key press.
/// @param {bool} ctrl  True if the ctrl key was held during the key press.
/// @param {bool} shift True if the shift key was held during the key press.
/// @return {real} The created event.
var _e = p3d_gui_event("keypress");
_e[? "bubble"] = false;
_e[? "key"]    = argument0;
_e[? "alt"]    = argument1;
_e[? "ctrl"]   = argument2;
_e[? "shift"]  = argument3;
return _e;