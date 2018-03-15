/// @func xColorArgbToAlpha(argb)
/// @desc Converts ARGB color to alpha.
/// @param {real} argb The ARGB color.
/// @return {real} The alpha.
gml_pragma("forceinline");
return (((argument0 & $FF000000) >> 24) / 255);