/// @func xSsaoFree()
/// @desc Frees resources used by the SSAO from memory.
if (surface_exists(xSurSsaoNoise)) {
	surface_free(xSurSsaoNoise);
}
xSsaoKernel = noone;