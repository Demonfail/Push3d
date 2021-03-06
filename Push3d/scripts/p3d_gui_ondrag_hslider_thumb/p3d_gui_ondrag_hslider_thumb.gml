/// @func p3d_gui_ondrag_hslider_thumb(hSliderThumb, event)
/// @desc Defines how horizontal slider thumb handles a "drag" event.
/// @param {real} hSliderThumb The horizontal slider thumb.
/// @param {real} event        The event to handle.
var _delegate        = argument0[? "delegate"];
var _xPrev           = argument0[? "x"];
var _xMax            = _delegate[? "width"] - argument0[? "width"];
var _xNew            = clamp(_xPrev + argument1[? "x"] + argument0[? "mouseXOffset"], 0, _xMax);
argument0[? "x"]     = _xNew;
var _valueNew        = lerp(_delegate[? "min"], _delegate[? "max"], _xNew / _xMax);
_delegate[? "value"] = _valueNew;

p3d_gui_trigger_event(argument0,
	p3d_gui_event_change(_delegate[? "value"], _valueNew),
	p3d_gui_event_redraw());