/// @func xGuiEventChange(valPrev, valueNew)
var _e = xGuiEvent("change");
_e[? "prev"] = argument0;
_e[? "new"] = argument1;
return _e;