/// @func p3d_vec3_unproject(vector, screen, world, view, projection)
/// @desc Unprojects the vector from screen space to world space.
/// @param {array} vector     The vector in screen space.
/// @param {array} screen     An array containing `[screenWidth, screenHeight]`.
/// @param {array} world      The world matrix.
/// @param {array} view       The view matrix.
/// @param {array} projection The projection matrix. 
var _worldInv = p3d_matrix_clone(argument2);
p3d_matrix_inverse(_worldInv);
var _viewInv = p3d_matrix_clone(argument3);
p3d_matrix_inverse(argument3);
var _projectionInv = p3d_matrix_clone(argument4);
p3d_matrix_inverse(argument4);
var _vector = [
	(argument0[0] / argument1[0]) * 2 - 1,
	1 - (argument0[1] / argument1[1]) * 2,
	argument0[2],
	1
];
var _matrix = matrix_multiply(matrix_multiply(_projectionInv, _viewInv), _worldInv);
p3d_vec4_transform(_vector, _matrix);
argument0[@ 0] = _vector[0];
argument0[@ 1] = _vector[1];
argument0[@ 2] = _vector[2];