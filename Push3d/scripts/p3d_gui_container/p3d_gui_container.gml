/// @func p3d_gui_container()
/// @desc Creates a new container.
/// @return {real} The created container.
var _c = p3d_gui_widgetset();
_c[? "surface"]    = noone;
_c[? "background"] = c_white;
_c[? "redraw"]     = true;
_c[? "redrawing"]  = false;
//< True if the surface is currently set as render target.
_c[? "scrollX"]    = 0;
_c[? "scrollY"]    = 0;
_c[? "scrDraw"]    = p3d_gui_draw_container;
p3d_gui_add_event_action(_c, "redraw", p3d_gui_onredraw_container);
return _c;