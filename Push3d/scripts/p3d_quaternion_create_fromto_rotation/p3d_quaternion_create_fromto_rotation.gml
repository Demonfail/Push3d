/// @func p3d_quaternion_create_fromto_rotation(from, to)
/// @desc Creates a quaternion that represents rotation from one vector to
///       another.
/// @param {array} from The 3D "from" vector.
/// @param {array} to   The 3D "to" vector.
/// @return {array} The created quaternion.
var _from = argument0;
var _to   = argument1;
var _dot  = p3d_vec3_dot(_from, _to);
var _axis;
if (_dot <= math_get_epsilon() - 1)
{
	_axis = [1, 0, 0];
	p3d_vec3_cross(_axis, _from);
	if (p3d_vec3_length(_axis) < math_get_epsilon())
	{
		_axis = [0, 1, 0];
		p3d_vec3_cross(_axis, _from);
	}
	p3d_vec3_normalize(_axis);
	return p3d_quaternion_create_from_axisangle(_axis, 180);
}
if (_dot >= 1 - math_get_epsilon())
{
	return p3d_quaternion_create_identity();
}
_axis = p3d_vec3_clone(_from);
p3d_vec3_cross(_axis, _to);
var _quat = p3d_quaternion_create(_axis[0], _axis[1], _axis[2], 1 + _dot);
p3d_quaternion_normalize(_quat);
return _quat;