/// @func p3d_vec3_slerp(v1, v2, s)
/// @desc Performs a spherical linear interpolation between the vectors `v1`,
///       `v2` and stores the result to `v1`.
/// @param {array} v1 The first vector. Should be normalized!
/// @param {array} v2 The second vector. Should be normalized!
/// @param {real}  s  The slerping factor.
/// @source https://keithmaggio.wordpress.com/2011/02/15/math-magician-lerp-slerp-and-nlerp/
var _dot         = clamp(p3d_vec3_dot(argument0, argument1), -1, 1);     
var _theta       = arccos(_dot) * argument2;
var _relativeVec = p3d_vec3_clone(argument1);
var _sub         = p3d_vec3_clone(argument0);
p3d_vec3_scale(_sub, _dot);
p3d_vec3_subtract(_relativeVec, _sub);
p3d_vec3_normalize(_relativeVec);
p3d_vec3_scale(argument0, cos(_theta));
p3d_vec3_scale(_relativeVec, sin(_theta));
p3d_vec3_add(argument0, _relativeVec);