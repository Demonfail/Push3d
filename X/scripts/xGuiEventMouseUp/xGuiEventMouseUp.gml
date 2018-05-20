/// @func xGuiEventMouseUp(button, alt, ctrl, shift)
/// @desc Creates a new "mouseup" event.
/// @param {real} button The mouse button that was released.
/// @param {bool} alt    True if the alt key was held during the mouse button
///                      release.
/// @param {bool} ctrl   True if the ctrl key was held during the mouse button
///                      release.
/// @param {bool} shift  True if the shift key was held during the mouse button
///                      release.
/// @return {real} The created event.
var _e = xGuiEvent("mouseup");
_e[? "bubble"] = false;
_e[? "button"] = argument0;
_e[? "alt"] = argument1;
_e[? "ctrl"] = argument2;
_e[? "shift"] = argument3;
return _e;