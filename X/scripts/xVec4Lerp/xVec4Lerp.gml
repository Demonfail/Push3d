/// @func xVec4Lerp(v1, v2, s)
/// @desc Linearly interpolates between vectors `v1`, `v2` and
///       stores the resulting vector into `v1`.
/// @param {array} v1 The first vector.
/// @param {array} v2 The second vector.
/// @param {real}  s  The interpolation factor.
argument0[@ 0] = lerp(argument0[0], argument1[0], argument2);
argument0[@ 1] = lerp(argument0[1], argument1[1], argument2);
argument0[@ 2] = lerp(argument0[2], argument1[2], argument2);
argument0[@ 3] = lerp(argument0[3], argument1[3], argument2);