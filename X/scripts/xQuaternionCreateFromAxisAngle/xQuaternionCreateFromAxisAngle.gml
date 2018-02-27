/// @func xQuaternionCreateFromAxisAngle(axis, angle)
/// @desc Creates a quaternion form the axis an the angle.
/// @param {array} axis  A 3D vector representing the axis.
/// @param {real}  angle The angle in degrees.
/// @return {array} The created quaternion.
var _sinHalfAngle = dsin(argument1 * 0.5);
return [
	argument0[0] * _sinHalfAngle,
	argument0[1] * _sinHalfAngle,
	argument0[2] * _sinHalfAngle,
	dcos(argument1 * 0.5)
];