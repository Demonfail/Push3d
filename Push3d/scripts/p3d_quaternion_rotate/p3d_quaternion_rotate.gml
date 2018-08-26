/// @func p3d_quaternion_rotate(q, v)
/// @desc Rotates the 3D vector by the quaternion.
/// @param {array} q The quaternion.
/// @param {array} v The 3D vector.
var _q = p3d_quaternion_clone(argument0);
p3d_quaternion_normalize(_q);
var _V = p3d_quaternion_create(argument1[0], argument1[1], argument1[2], 0);
var _conjugate = p3d_quaternion_clone(_q);
p3d_quaternion_conjugate(_q);
var _rot = p3d_quaternion_clone(_q);
p3d_quaternion_multiply(_rot, _V);
p3d_quaternion_multiply(_rot, _conjugate);
argument1[@ 0] = _rot[0];
argument1[@ 1] = _rot[1];
argument1[@ 2] = _rot[2];