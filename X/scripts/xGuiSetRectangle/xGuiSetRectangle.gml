/// @func xGuiSetRectangle(widget, x, y, width, height)
/// @desc Sets the position and size of the widget.
/// @param {real} widget The widget.
/// @param {real} x      The new x position of the widget.
/// @param {real} y      The new y position of the widget.
/// @param {real} width  The new width of the widget.
/// @param {real} height The new height of the widget.
/// @return {real} The widget.
gml_pragma("forceinline");
argument0[? "x"] = argument1;
argument0[? "y"] = argument2;
argument0[? "width"] = argument3;
argument0[? "height"] = argument4;
return argument0;