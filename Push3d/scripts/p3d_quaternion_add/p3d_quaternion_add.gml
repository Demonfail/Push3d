/// @func p3d_quaternion_add(q1, q2)
/// @desc Adds the quaternions `q1`, `q2` and stores the result to `q1`.
/// @param {array} q1 The first quaternion.
/// @param {array} q2 The second quaternion.
argument0[@ 0] += argument1[0];
argument0[@ 1] += argument1[1];
argument0[@ 2] += argument1[2];
argument0[@ 3] += argument1[3];