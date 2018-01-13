/// @func xQuaternionLerp(q1, q2, s)
/// @desc Performs a linear interpolation between the quaternions
///       `q1`, `q2` and stores the result to `q1`.
/// @param {array} q1 The first quaternion.
/// @param {array} q2 The second quaternion.
/// @param {real}  s  The lerping factor.
argument0[@ 0] = lerp(argument0[0], argument1[0], argument2);
argument0[@ 1] = lerp(argument0[1], argument1[1], argument2);
argument0[@ 2] = lerp(argument0[2], argument1[2], argument2);
argument0[@ 3] = lerp(argument0[3], argument1[3], argument2);