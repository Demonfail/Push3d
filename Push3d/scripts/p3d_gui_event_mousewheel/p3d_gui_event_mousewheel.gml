/// @func p3d_gui_event_mousewheel(wheel, alt, ctrl, shift)
/// @desc Creates a new "mousewheel" event.
/// @param {real} wheel  The mouse wheel scrolling direction (`-1` is up, `1`
///                      is down).
/// @param {bool} alt    True if the alt key was held during the mouse wheel
///                      scroll.
/// @param {bool} ctrl   True if the ctrl key was held during the mouse wheel
///                      scroll.
/// @param {bool} shift  True if the shift key was held during the mouse wheel
///                      scroll.
/// @return {real} The created event.
var _e = p3d_gui_event("mousewheel");
_e[? "wheel"] = argument0;
_e[? "alt"]   = argument1;
_e[? "ctrl"]  = argument2;
_e[? "shift"] = argument3;
return _e;