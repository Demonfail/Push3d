/// @func xQuaternionCreateFromToRotation(from, to)
/// @desc Creates a quaternion that represents rotation from one vector to
///       another.
/// @param {array} from The 3D "from" vector.
/// @param {array} to   The 3D "to" vector.
/// @return {array} The created quaternion.
var _from = argument0;
var _to = argument1;
var _dot = xVec3Dot(_from, _to);
var _axis;
if (_dot <= math_get_epsilon() - 1)
{
	_axis = [1, 0, 0];
	xVec3Cross(_axis, _from);
	if (xVec3Length(_axis) < math_get_epsilon())
	{
		_axis = [0, 1, 0];
		xVec3Cross(_axis, _from);
	}
	xVec3Normalize(_axis);
	return xQuaternionCreateFromAxisAngle(_axis, 180);
}
if (_dot >= 1 - math_get_epsilon())
{
	return xQuaternionCreateIdentity();
}
_axis = xVec3Clone(_from);
xVec3Cross(_axis, _to);
var _quat = xQuaternionCreate(_axis[0], _axis[1], _axis[2], 1 + _dot);
xQuaternionNormalize(_quat);
return _quat;