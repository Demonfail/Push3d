/// @func xGuiButton(text)
/// @desc Creates a new button.
/// @param {string} text The text on the button.
/// @return {real} The created button.
var _b = xGuiWidget();
_b[? "text"] = argument0;
//_b[? "width"] = 64;
_b[? "height"] = 24;
_b[? "scrDraw"] = xGuiDrawButton;
return _b;