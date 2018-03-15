/// @func xColorFromArgb(argb)
/// @desc Converts ARGB color to BGR color.
/// @param {real} argb The ARGB color.
/// @return {real} The BGR color.
gml_pragma("forceinline");
return xColorRgbToBgr(argument0 & $FFFFFF);