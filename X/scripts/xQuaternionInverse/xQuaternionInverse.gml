/// @func xQuaternionInverse(q)
/// @desc Inverts the quaternion.
/// @param {array} q The quaternion.
xQuaternionConjugate(argument0);
var _n = 1 / sqrt(argument0[0] * argument0[0]
  + argument0[1] * argument0[1]
  + argument0[2] * argument0[2]
  + argument0[3] * argument0[3]);
xQuaternionScale(argument0, _n);