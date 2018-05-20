/// @func xGuiEventChange(valPrev, valueNew)
/// @desc Creates a new "change" event.
/// @param {any} valPrev  The previous value of the property that has changed.
/// @param {any} valueNew The new value of the property that has changed.
/// @return {real} The created event.
var _e = xGuiEvent("change");
_e[? "prev"] = argument0;
_e[? "new"] = argument1;
return _e;