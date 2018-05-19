/// @func xGuiOnDragHScrollbarThumb(hscrollbar, event)
var _delegate = argument0[? "delegate"];
argument0[? "x"] = clamp(
	argument0[? "x"] + argument1[? "x"] + argument0[? "mouseXOffset"],
	0,
	_delegate[? "width"] - argument0[? "width"]);
xGuiTriggerEvent(argument0, xGuiEventScroll());