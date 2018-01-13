/// @func xVec4Multiply(v1, v2)
/// @desc Multiplies the vectors `v1`, `v2` componentwise and
///       stores the result into `v1`.
/// @param {array} v1 The first vector.
/// @param {array} v2 The second vector.
/// @example
/// This would make the vector `_v1` equal to `[5, 12, 21, 32]`.
/// ```
/// var _v1 = [1, 2, 3, 4];
/// var _v2 = [5, 6, 7, 8];
/// xVec4Multiply(_v1, _v2);
/// ```
argument0[@ 0] *= argument1[0];
argument0[@ 1] *= argument1[1];
argument0[@ 2] *= argument1[2];
argument0[@ 3] *= argument1[3];