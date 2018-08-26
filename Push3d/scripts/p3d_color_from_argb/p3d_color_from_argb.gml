/// @func p3d_color_from_argb(argb)
/// @desc Converts ARGB color to BGR color.
/// @param {real} argb The ARGB color.
/// @return {real} The BGR color.
gml_pragma("forceinline");
return p3d_color_rgb_to_bgr(argument0 & $FFFFFF);