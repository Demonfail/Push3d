/// @func xVec3Transform(v, m)
/// @desc Transforms a 4D vector `[vX, vY, vZ, 1]` by the matrix `m` and stores
///       `[x, y, z]` of the resulting vector to `v`.
/// @param {array} v The vector to transform.
/// @param {array} m The transform matrix.
var _v = [argument0[0], argument0[1], argument0[2], 1];
xVec4Transform(_v, argument1);
argument0[@ 0] = _v[0];
argument0[@ 1] = _v[1];
argument0[@ 2] = _v[2];