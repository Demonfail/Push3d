/// @func xGuiOnDragVScrollbarThumb(vScrollbarThumb, event)
/// @desc Defines how vertical scrollbar thumb handles a "drag" event.
/// @param {real} vScrollbarThumb The vertical scrollbar thumb.
/// @param {real} event           The event to handle.
var _delegate = argument0[? "delegate"];
argument0[? "y"] = clamp(
	argument0[? "y"] + argument1[? "y"] + argument0[? "mouseYOffset"],
	0,
	_delegate[? "height"] - argument0[? "height"]);
xGuiTriggerEvent(argument0, xGuiEventScroll());