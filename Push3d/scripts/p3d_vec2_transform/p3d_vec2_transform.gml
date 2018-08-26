/// @func p3d_vec2_transform(v, m)
/// @desc Transforms a 4D vector `[vX, vY, 0, 1]` by the matrix `m` and stores
///       `[x, y]` of the resulting vector to `v`.
/// @param {array} v The vector to transform.
/// @param {array} m The transform matrix.
var _v = [argument0[0], argument0[1], 0, 1];
p3d_vec4_transform(_v, argument1);
argument0[@ 0] = _v[0];
argument0[@ 1] = _v[1];