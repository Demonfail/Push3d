/// @func p3d_ssao_free()
/// @desc Frees resources used by the SSAO from memory.
if (surface_exists(p3dSurSsaoNoise))
{
	surface_free(p3dSurSsaoNoise);
}
p3dSsaoKernel = noone;