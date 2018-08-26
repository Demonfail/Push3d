/// @func p3d_gui_event_change(valPrev, valueNew)
/// @desc Creates a new "change" event.
/// @param {any} valPrev  The previous value of the property that has changed.
/// @param {any} valueNew The new value of the property that has changed.
/// @return {real} The created event.
var _e = p3d_gui_event("change");
_e[? "prev"] = argument0;
_e[? "new"] = argument1;
return _e;