/// @func xQuaternionCreateLookRotation(forward, up)
/// @desc Creates a quaternion with the specified forward and up vectors.
///       These vectors must not be parallel! If they are, then an identity
///       quaternion will be returned.
/// @param {array} forward The 3D forward unit vector.
/// @param {array} up      The 3D up unit vector.
/// @return {array} An array representing the quaternion.
var _forward = argument0;
var _up = argument1;
var _rot1 = bbQuaternionCreateFromToRotation([0, 0, 1], _forward);
var _right = xVec3Clone(_forward);
xVec3Cross(_right, _up);
_up = xVec3Clone(_right);
xVec3Cross(_up, _forward);
xVec3Normalize(_up);
var _newUp = [0, 1, 0];
xQuaternionRotate(_rot1, _newUp);
var _rot2 = xQuaternionCreateFromToRotation(_newUp, _up);
xQuaternionMultiply(_rot2, _rot1);
return _rot2;