/// @func xQuaternionNormalize(q)
/// @desc Normalizes the quaternion.
/// @param {array} q The quaternion.
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