/// @func xQuaternionLengthSqr(q)
/// @desc Gets the squared length of the quaternion.
/// @param {array} q An array representing the quaternion.
/// @return {real} The squared length of the quaternion.
gml_pragma("forceinline");
return (argument0[0] * argument0[0]
	+ argument0[1] * argument0[1]
	+ argument0[2] * argument0[2]
	+ argument0[3] * argument0[3]);