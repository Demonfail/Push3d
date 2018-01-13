/// @func xVec2Normalize(v)
/// @desc TODO
/// @param {array} v TODO
var _lengthSqr = (argument0[0] * argument0[0]
	+ argument0[1] * argument0[1]);
if (_lengthSqr <= 0) {
	return;
}
var _n = 1 / sqrt(_lengthSqr);
argument0[@ 0] *= _n;
argument0[@ 1] *= _n;