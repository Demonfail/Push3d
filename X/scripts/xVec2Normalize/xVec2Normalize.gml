/// @func xVec2Normalize(v)
/// @desc Normalizes the vector (makes the vector's length equal to `1`).
/// @param {array} v The vector to be normalized.
var _lengthSqr = (argument0[0] * argument0[0]
	+ argument0[1] * argument0[1]);
if (_lengthSqr > 0)
{
	var _n = 1 / sqrt(_lengthSqr);
	argument0[@ 0] *= _n;
	argument0[@ 1] *= _n;
}