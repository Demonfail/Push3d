/// @func p3d_quaternion_inverse(q)
/// @desc Inverts the quaternion.
/// @param {array} q The quaternion.
p3d_quaternion_conjugate(argument0);
var _n = 1 / sqrt(argument0[0] * argument0[0]
	+ argument0[1] * argument0[1]
	+ argument0[2] * argument0[2]
	+ argument0[3] * argument0[3]);
p3d_quaternion_scale(argument0, _n);