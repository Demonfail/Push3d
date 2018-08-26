/// @func p3d_color_rgb_to_bgr(color)
/// @desc Converts between RGB and BGR color format.
/// @param {real} color The BGR or RGB color.
/// @return {real} The resulting color.
gml_pragma("forceinline");
return ((argument0 & $FF0000) >> 16)
	| (argument0 & $FF00)
	| ((argument0 & $FF) << 16);