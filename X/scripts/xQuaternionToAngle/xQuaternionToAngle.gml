/// @func xQuaternionToAngle(q)
/// @desc Gets quaternion angle in degrees.
/// @param {array} q The quaternion.
/// @return {real} The quaternion angle in degrees.
gml_pragma("forceinline");
return radtodeg(arccos(argument0[3]) * 2);