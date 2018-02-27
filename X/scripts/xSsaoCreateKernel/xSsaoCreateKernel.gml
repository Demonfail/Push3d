/// @func xSsaoCreateKernel(size)
/// @desc Generates a kernel of random vectors to be used for the SSAO.
/// @param {real} size Number of vectors in the kernel.
/// @return {array} The created kernel as `[v1X, v1Y, v1Z, v2X, v2Y, v2Z, ..., vnX, vnY, vnZ]`.
var _kernel;
for (var i = argument0 - 1; i >= 0; --i)
{
	var _vec = xVec3Create(random_range(-1, 1), random_range(-1, 1), random(1));
	xVec3Normalize(_vec);
	var _s = i/argument0;
	_s = lerp(0.1, 1.0, _s*_s);
	xVec3Scale(_vec, _s);
	_kernel[i*3 + 2] = _vec[2];
	_kernel[i*3 + 1] = _vec[1];
	_kernel[i*3 + 0] = _vec[0];
}
return _kernel;