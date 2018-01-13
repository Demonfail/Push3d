/// @func xVec3Unproject(vector, screen, world, view, projection)
/// @desc Unprojects the vector from screen space to world space.
/// @param {array} vector     The vector in screen space.
/// @param {array} screen     An array containing `[screenWidth, screenHeight]`.
/// @param {array} world      The world matrix.
/// @param {array} view       The view matrix.
/// @param {array} projection The projection matrix. 
var _worldInv = xMatrixClone(argument2);
xMatrixInverse(_worldInv);
var _viewInv = xMatrixClone(argument3);
xMatrixInverse(argument3);
var _projectionInv = xMatrixClone(argument4);
xMatrixInverse(argument4);
var _vector = [
	(argument0[0] / argument1[0]) * 2 - 1,
	1 - (argument0[1] / argument1[1]) * 2,
	argument0[2],
	1
];
var _matrix = matrix_multiply(matrix_multiply(_projectionInv, _viewInv), _worldInv);
xVec4Transform(_vector, _matrix);
argument0[@ 0] = _vector[0];
argument0[@ 1] = _vector[1];
argument0[@ 2] = _vector[2];