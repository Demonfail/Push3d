/// @func xQuaternionLength(q)
/// @desc Gets the length of the quaternion.
/// @param {array} q The quaternion.
/// @return {real} The length of the quaternion.
gml_pragma("forceinline");
return sqrt(argument0[0] * argument0[0]
	+ argument0[1] * argument0[1]
	+ argument0[2] * argument0[2]
	+ argument0[3] * argument0[3]);