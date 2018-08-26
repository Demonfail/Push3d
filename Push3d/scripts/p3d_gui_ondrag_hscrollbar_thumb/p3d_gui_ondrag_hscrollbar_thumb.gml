/// @func p3d_gui_ondrag_hscrollbar_thumb(hScrollbarThumb, event)
/// @desc Defines how horizontal scrollbar thumb handles a "drag" event.
/// @param {real} hScrollbarThumb The horizontal scrollbar thumb.
/// @param {real} event           The event to handle.
var _delegate    = argument0[? "delegate"];
argument0[? "x"] = clamp(
	argument0[? "x"] + argument1[? "x"] + argument0[? "mouseXOffset"],
	0,
	_delegate[? "width"] - argument0[? "width"]);
p3d_gui_trigger_event(argument0, p3d_gui_event_scroll());