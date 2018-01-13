/// @func xVec2Reflect(v1, v2)
/// @desc TODO
/// @param {array} v1 TODO
/// @param {array} v2 TODO
var _dot = xVec2Dot(argument0, argument1);
argument[@ 0] = -(argument0[0] - 2 * _dot * argument1[0]);
argument[@ 1] = -(argument0[1] - 2 * _dot * argument1[1]);