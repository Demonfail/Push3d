/// @func p3d_smoothstep(e0, e1, x)
/// @desc Performs smooth Hermite interpolation between 0 and 1 when
///       e0 < x < e1.
/// @param {real} e0 The lower edge of the Hermite function.
/// @param {real} e1 The upper edge of the Hermite function.
/// @param {real} x  The source value for interpolation.
/// @return {real} The resulting interpolated value.
/// @source https://www.khronos.org/registry/OpenGL-Refpages/gl4/html/smoothstep.xhtml
var _t = clamp((argument2 - argument0) / (argument1 - argument0), 0, 1);
return (_t * _t * (3 - 2 * _t));