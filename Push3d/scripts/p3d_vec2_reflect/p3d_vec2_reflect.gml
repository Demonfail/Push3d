/// @func p3d_vec2_reflect(v, n)
/// @desc Reflects the incident vector `v` off the normal vector `n`.
/// @param {array} v The incident vector.
/// @param {array} v The normal vector.
var _dot = p3d_vec2_dot(argument0, argument1);
argument[@ 0] = argument0[0] - 2 * _dot * argument1[0];
argument[@ 1] = argument0[1] - 2 * _dot * argument1[1];