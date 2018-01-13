/// @func xVec4Normalize(v)
/// @desc Normalizes the vector (makes the vector's length equal to `1`).
/// @param {array} v The vector to be normalized.
var _lengthSqr = (argument0[0] * argument0[0]
	+ argument0[1] * argument0[1]
	+ argument0[2] * argument0[2]
	+ argument0[3] * argument0[3]);
if (_lengthSqr <= 0) {
	return;
}
var _n = 1 / sqrt(_lengthSqr);
argument0[@ 0] *= _n;
argument0[@ 1] *= _n;
argument0[@ 2] *= _n;
argument0[@ 3] *= _n;