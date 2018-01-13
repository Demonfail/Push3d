/// @func xQuaternionToMatrix(q)
/// @desc Creates a rotation matrix from the quaternion.
/// @param {array} q The quaternion.
/// @return {array} The created rotation matrix.
gml_pragma("forceinline");
return [
	1-2*(argument0[1]*argument0[1]+argument0[2]*argument0[2]), 2*(argument0[0]*argument0[1]+argument0[3]*argument0[2]),   2*(argument0[0]*argument0[2]-argument0[3]*argument0[1]),   0,
	2*(argument0[0]*argument0[1]-argument0[3]*argument0[2]),   1-2*(argument0[0]*argument0[0]+argument0[2]*argument0[2]), 2*(argument0[1]*argument0[2]+argument0[3]*argument0[0]),   0,
	2*(argument0[0]*argument0[2]+argument0[3]*argument0[1]),   2*(argument0[1]*argument0[2]-argument0[3]*argument0[0]),   1-2*(argument0[0]*argument0[0]+argument0[1]*argument0[1]), 0,
	0,                                                         0,                                                         0,                                                         1
];