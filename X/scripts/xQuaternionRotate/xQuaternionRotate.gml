/// @func xQuaternionRotate(q, v)
/// @desc Rotates the 3D vector by the quaternion.
/// @param {array} q The quaternion.
/// @param {array} v The 3D vector.
var _q = xQuaternionClone(argument0);
xQuaternionNormalize(_q);
var _V = xQuaternionCreate(argument1[0], argument1[1], argument1[2], 0);
var _conjugate = xQuaternionClone(_q);
xQuaternionConjugate(_q);
var _rot = xQuaternionClone(_q);
xQuaternionMultiply(_rot, _V);
xQuaternionMultiply(_rot, _conjugate);
argument1[@ 0] = _rot[0];
argument1[@ 1] = _rot[1];
argument1[@ 2] = _rot[2];