/// @func xVec3Reflect(v, n)
/// @desc Reflects the incident vector `v` off the normal vector `n`.
/// @param {array} v The incident vector.
/// @param {array} v The normal vector.
var _dot = xVec3Dot(argument0, argument1);
argument[@ 0] = argument0[0] - 2 * _dot * argument1[0];
argument[@ 1] = argument0[1] - 2 * _dot * argument1[1];
argument[@ 2] = argument0[2] - 2 * _dot * argument1[2];