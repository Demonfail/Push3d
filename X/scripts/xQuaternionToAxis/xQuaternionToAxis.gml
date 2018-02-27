/// @func xQuaternionToAxis(q)
/// @desc Creates 3D axis from the quaternion.
/// @param {array} q The quaternion.
/// @return {array} The created axis as `[x, y, z]`.
var _sinThetaInv = 1 / sin(arccos(argument0[3]));
return [
	argument0[0] * _sinThetaInv,
	argument0[1] * _sinThetaInv,
	argument0[2] * _sinThetaInv
];