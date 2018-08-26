/// @func p3d_vec3_orthonormalize(v1, v2)
/// @desc Orthonormalizes the vectors using the Gram–Schmidt process.
/// @param {array} v1 The first vector.
/// @param {array} v2 The second vector.
/// @return {bool} True if the vectors were orthonormalized.
/// @source https://www.gamedev.net/forums/topic/585184-orthonormalize-two-vectors/
var _v1 = p3d_vec3_clone(argument0);
p3d_vec3_normalize(_v1);
var _proj = p3d_vec3_clone(_v1);
p3d_vec3_scale(_proj, p3d_vec3_dot(argument1, _v1));
var _v2 = p3d_vec3_clone(argument1);
p3d_vec3_subtract(_v2, _proj);

if (p3d_vec3_lengthsqr(_v2) <= 0)
{
	return false;
}

p3d_vec3_normalize(_v2);

argument0[@ 0] = _v1[0];
argument0[@ 1] = _v1[1];
argument0[@ 2] = _v1[2];

argument1[@ 0] = _v2[0];
argument1[@ 1] = _v2[1];
argument1[@ 2] = _v2[2];

return true;