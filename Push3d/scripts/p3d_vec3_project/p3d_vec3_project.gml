/// @func p3d_vec3_project(vector, screen, world, view, projection)
/// @desc Projects the vector from world space into screen space.
/// @param {array} vector     The vector.
/// @param {array} screen     An array containing `[screenWidth, screenHeight]`.
/// @param {array} world      The world matrix.
/// @param {array} view       The view matrix.
/// @param {array} projection The projection matrix. 
var _vec = [argument0[0], argument0[1], argument0[2], 1];
var _mat = matrix_multiply(matrix_multiply(argument2, argument3), argument4);
p3d_vec4_transform(_vec, _mat);
var _s   = 1 / _vec[3];
_vec[0] *= _s;
_vec[1] *= _s;
argument0[@ 0] = (_vec[0] * 0.5 + 0.5) * argument1[0];
argument0[@ 1] = (1 - (_vec[1] * 0.5 + 0.5)) * argument1[1];
argument0[@ 2] = _vec[2];