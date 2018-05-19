/// @func xGuiDrawButton(button)
/// @desc Draws the button.
/// @param {real} button The button to draw.
var _text = argument0[? "text"];
var _x = argument0[? "x"];
var _y = argument0[? "y"];
var _width = string_width(_text) + 24;
argument0[? "width"] = _width;
var _height = argument0[? "height"];
xDrawRectangle(_x, _y, _width, _height, $101010);
draw_text(
	_x + 12,
	_y + round((_height - string_height(_text)) * 0.5),
	_text);