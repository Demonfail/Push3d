/// @func p3d_quaternion_multiply(q1, q2)
/// @desc Multiplies the quaternions `q1`, `q2` and stores the result to `q1`.
/// @param {array} q1 The first quaternion.
/// @param {array} q2 The second quaternion.
var _x = argument0[1]*argument1[2] - argument0[2]*argument1[1]
	+ argument0[3]*argument1[0] + argument0[0]*argument1[3];
var _y = argument0[2]*argument1[0] - argument0[0]*argument1[2]
	+ argument0[3]*argument1[1] + argument0[1]*argument1[3];
var _z = argument0[0]*argument1[1] - argument0[1]*argument1[0]
	+ argument0[3]*argument1[2] + argument0[2]*argument1[3];
var _w = argument0[3]*argument1[3] - argument0[0]*argument1[0]
	- argument0[1]*argument1[1] - argument0[2]*argument1[2];
argument[@ 0] = _x;
argument[@ 1] = _y;
argument[@ 2] = _z;
argument[@ 3] = _w;