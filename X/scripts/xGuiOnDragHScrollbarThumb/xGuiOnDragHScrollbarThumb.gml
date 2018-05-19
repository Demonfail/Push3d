/// @func xGuiOnDragHScrollbarThumb(hScrollbarThumb, event)
/// @desc Defines how horizontal scrollbar thumb handles a "drag" event.
/// @param {real} hScrollbarThumb The horizontal scrollbar thumb.
/// @param {real} event           The event to handle.
var _delegate = argument0[? "delegate"];
argument0[? "x"] = clamp(
	argument0[? "x"] + argument1[? "x"] + argument0[? "mouseXOffset"],
	0,
	_delegate[? "width"] - argument0[? "width"]);
xGuiTriggerEvent(argument0, xGuiEventScroll());