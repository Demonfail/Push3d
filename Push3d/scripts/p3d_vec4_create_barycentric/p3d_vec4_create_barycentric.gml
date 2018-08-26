/// @func p3d_vec4_create_barycentric(v1, v2, v3, f, g)
/// @desc Creates a new vector using barycentric coordinates, following formula
///       `v1 + f(v2-v1) + g(v3-v1)`.
/// @param {array} v1 The first point of triangle.
/// @param {array} v2 The second point of triangle.
/// @param {array} v3 The third point of triangle.
/// @param {real}  f  The first weighting factor.
/// @param {real}  g  The second weighting factor.
/// @return {array} The created vector.
return [
	argument0[0] + argument3*(argument1[0]-argument0[0]) + argument4*(argument2[0]-argument0[0]),
	argument0[1] + argument3*(argument1[1]-argument0[1]) + argument4*(argument2[1]-argument0[1]),
	argument0[2] + argument3*(argument1[2]-argument0[2]) + argument4*(argument2[2]-argument0[2]),
	argument0[3] + argument3*(argument1[3]-argument0[3]) + argument4*(argument2[3]-argument0[3])
];