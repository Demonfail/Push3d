/// @func p3d_cubemap_get_view_matrix(side, position)
/// @desc Creates a view matrix for given cubemap side.
/// @param {real}  side     The cubemap side.
/// @param {array} position The center position of the cubemap in the world
///                         space (vec3).
/// @return {array} The created view matrix.
var _negEye = p3d_vec3_clone(argument1);
p3d_vec3_scale(_negEye, -1);
var _x;
var _y;
var _z;

switch (argument0)
{
	case P3D_CUBEMAP_POS_X:
		_x = [0, +1, 0];
		_y = [0, 0, +1];
		_z = [+1, 0, 0];
		break;

	case P3D_CUBEMAP_NEG_X:
		_x = [0, -1, 0];
		_y = [0, 0, +1];
		_z = [-1, 0, 0];
		break;

	case P3D_CUBEMAP_POS_Y:
		_x = [-1, 0, 0];
		_y = [0, 0, +1];
		_z = [0, +1, 0];
		break;

	case P3D_CUBEMAP_NEG_Y:
		_x = [+1, 0, 0];
		_y = [0, 0, +1];
		_z = [0, -1, 0];
		break;

	case P3D_CUBEMAP_POS_Z:
		_x = [0, +1, 0];
		_y = [-1, 0, 0];
		_z = [0, 0, +1];
		break;

	case P3D_CUBEMAP_NEG_Z:
		_x = [0, +1, 0];
		_y = [+1, 0, 0];
		_z = [0, 0, -1];
		break;

	default:
		p3d_assert(false, "Wrong cubemap side!");
}

return [
	_x[0],                     _y[0],                     _z[0],                     0,
	_x[1],                     _y[1],                     _z[1],                     0,
	_x[2],                     _y[2],                     _z[2],                     0,
	p3d_vec3_dot(_x, _negEye), p3d_vec3_dot(_y, _negEye), p3d_vec3_dot(_z, _negEye), 1
];