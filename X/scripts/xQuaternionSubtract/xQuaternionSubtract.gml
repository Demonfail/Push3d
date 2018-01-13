/// @func xQuaternionSubtract(q1, q2)
/// @desc Subtracts quaternion `q2` from `q1` and stores the result into `q1`.
/// @param {array} q1 The quaternion to subtract from.
/// @param {array} q2 The quaternion to subtract.
argument0[@ 0] -= argument1[0];
argument0[@ 1] -= argument1[1];
argument0[@ 2] -= argument1[2];
argument0[@ 3] -= argument1[3];