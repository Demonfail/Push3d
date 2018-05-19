/// @func xGuiDrawCheckbox(checkbox)
/// @desc Draws the checkox.
/// @param {real} checkbox The checkbox to draw.
xDrawRectangle(
	argument0[? "x"],
	argument0[? "y"],
	argument0[? "width"],
	argument0[? "height"],
	argument0[? "checked"] ? $FF8000 : $101010);