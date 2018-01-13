/// @func xVec2Multiply(v1, v2)
/// @desc Multiplies the vectors `v1`, `v2` componentwise and
///       stores the result into `v1`.
/// @param {array} v1 The first vector.
/// @param {array} v2 The second vector.
/// @example
/// This would make the vector `v1` equal to `[3, 8]`.
/// ```
/// var _v1 = [1, 2];
/// var _v2 = [3, 4];
/// xVec2Multiply(_v1, _v2);
/// ```
argument0[@ 0] *= argument1[0];
argument0[@ 1] *= argument1[1];