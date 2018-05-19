/// @func xGuiContainer()
/// @desc Creates a new container.
/// @return {real} The created container.
var _c = xGuiWidgetSet();
_c[? "surface"] = noone;
_c[? "background"] = c_white;
_c[? "redraw"] = true;
_c[? "redrawing"] = false; // True if the surface is currently set as render target.
_c[? "scrollX"] = 0;
_c[? "scrollY"] = 0;
_c[? "scrDraw"] = xGuiDrawContainer;
xGuiAddEventAction(_c, "redraw", xGuiOnRedrawContainer);
return _c;