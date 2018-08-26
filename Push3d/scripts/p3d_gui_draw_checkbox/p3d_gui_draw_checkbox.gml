/// @func p3d_gui_draw_checkbox(checkbox)
/// @desc Draws the checkox.
/// @param {real} checkbox The checkbox to draw.
p3d_draw_rectangle(
	argument0[? "x"],
	argument0[? "y"],
	argument0[? "width"],
	argument0[? "height"],
	argument0[? "checked"] ? $FF8000 : $101010);