/// @func xGuiHSlider(valueMin, valueMax)
var _slider = xGuiWidgetSet();
var _height = 16;
_slider[? "value"] = argument0;
_slider[? "min"] = argument0;
_slider[? "max"] = argument1;
_slider[? "height"] = _height;
_slider[? "scrDraw"] = xGuiDrawHSlider;
var _thumb = xGuiHSliderThumb();
_thumb[? "y"] += round((_height - _thumb[? "height"]) * 0.5);
xGuiAddWidget(_slider, _thumb);
return _slider;