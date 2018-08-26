/// @func p3d_color_argb_to_alpha(argb)
/// @desc Converts ARGB color to alpha.
/// @param {real} argb The ARGB color.
/// @return {real} The alpha.
gml_pragma("forceinline");
return (((argument0 & $FF000000) >> 24) / 255);