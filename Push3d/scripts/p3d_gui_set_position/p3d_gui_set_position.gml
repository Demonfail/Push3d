/// @func p3d_gui_set_position(widget, x, y)
/// @desc Sets the position of the widget.
/// @param {real} widget The widget.
/// @param {real} x      The new x position of the widget.
/// @param {real} y      The new y position of the widget.
/// @return {real} The widget.
gml_pragma("forceinline");
argument0[? "x"] = argument1;
argument0[? "y"] = argument2;
return argument0;