/// @func xVec3OrthoNormalize(v1, v2)
/// @desc Orthonormalizes the vectors using the Gram–Schmidt process.
/// @param {array} v1 The first vector.
/// @param {array} v2 The second vector.
/// @return {bool} True if the vectors were orthonormalized.
// Source: https://www.gamedev.net/forums/topic/585184-orthonormalize-two-vectors/
var _v1 = xVec3Clone(argument0);
xVec3Normalize(_v1);
var _proj = xVec3Clone(_v1);
xVec3Scale(_proj, xVec3Dot(argument1, _v1));
var _v2 = xVec3Clone(argument1);
xVec3Subtract(_v2, _proj);

if (xVec3LengthSqr(_v2) <= 0)
{
	return false;
}

xVec3Normalize(_v2);

argument0[@ 0] = _v1[0];
argument0[@ 1] = _v1[1];
argument0[@ 2] = _v1[2];

argument1[@ 0] = _v2[0];
argument1[@ 1] = _v2[1];
argument1[@ 2] = _v2[2];

return true;