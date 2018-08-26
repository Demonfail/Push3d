/// @func p3d_gui_widget()
var _w = ds_map_create();
_w[? "name"]     = "widget" + string(_w); // Should be unique
_w[? "delegate"] = noone;
_w[? "x"]        = 0;
_w[? "y"]        = 0;
_w[? "realX"]    = 0;
_w[? "realY"]    = 0;
_w[? "width"]    = 1;
_w[? "height"]   = 1;
_w[? "order"]    = 0; // TODO: Order items by this value...
return _w;