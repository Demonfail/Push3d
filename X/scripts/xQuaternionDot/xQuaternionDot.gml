/// @func xQuaternionDot(q1, q2)
/// @desc Gets the dot product of the two quaternions.
/// @param {array} q1 The first quaternion.
/// @param {array} q2 The second quaternion.
/// @return {real} The dot product of the two quaternions.
gml_pragma("forceinline");
return (argument0[0] * argument1[0]
	+ argument0[1] * argument1[1]
	+ argument0[2] * argument1[2]
	+ argument0[3] * argument1[3]);