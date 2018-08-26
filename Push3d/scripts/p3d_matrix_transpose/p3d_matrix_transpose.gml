/// @func p3d_matrix_transpose(m)
/// @desc Transposes the matrix.
/// @param {array} m The matrix to be transposed.
var _m = p3d_matrix_clone(argument0);
argument0[@ 0] = _m[ 0]; argument0[@ 4] = _m[ 1]; argument0[@  8] = _m[ 2]; argument0[@ 12] = _m[ 3];
argument0[@ 1] = _m[ 4]; argument0[@ 5] = _m[ 5]; argument0[@  9] = _m[ 6]; argument0[@ 13] = _m[ 7];
argument0[@ 2] = _m[ 8]; argument0[@ 6] = _m[ 9]; argument0[@ 10] = _m[10]; argument0[@ 14] = _m[11];
argument0[@ 3] = _m[12]; argument0[@ 7] = _m[13]; argument0[@ 11] = _m[14]; argument0[@ 15] = _m[15];