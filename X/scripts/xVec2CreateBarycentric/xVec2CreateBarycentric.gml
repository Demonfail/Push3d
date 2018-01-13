/// @func xVec2CreateBarycentric(v1, v2, v3, f, g)
/// @desc TODO
/// @param {array} v1 TODO
/// @param {array} v2 TODO
/// @param {array} v3 TODO
/// @param {real}  f  TODO
/// @param {real}  g  TODO
/// @return {array} TODO
// v1 + f(v2-v1) + g(v3-v1)
return [
	argument0[0] + argument3*(argument1[0]-argument0[0]) + argument4*(argument2[0]-argument0[0]),
	argument0[1] + argument3*(argument1[1]-argument0[1]) + argument4*(argument2[1]-argument0[1])
];