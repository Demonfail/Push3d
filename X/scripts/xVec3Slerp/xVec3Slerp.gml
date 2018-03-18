/// @func xVec3Slerp(v1, v2, s)
/// @desc Performs a spherical linear interpolation between
///       the vectors `v1`, `v2` and stores the result to `v1`.
/// @param {array} v1 The first vector. Should be normalized!
/// @param {array} v2 The second vector. Should be normalized!
/// @param {real}  s  The slerping factor.
/// @source https://keithmaggio.wordpress.com/2011/02/15/math-magician-lerp-slerp-and-nlerp/
var _dot = clamp(xVec3Dot(argument0, argument1), -1, 1);     
var _theta = arccos(_dot) * argument2;
var _relativeVec = xVec3Clone(argument1);
var _sub = xVec3Clone(argument0);
xVec3Scale(_sub, _dot);
xVec3Subtract(_relativeVec, _sub);
xVec3Normalize(_relativeVec);
xVec3Scale(argument0, cos(_theta));
xVec3Scale(_relativeVec, sin(_theta));
xVec3Add(argument0, _relativeVec);