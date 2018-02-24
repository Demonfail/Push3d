/// @func xSsaoInit(radius, bias, power)
/// @desc Initializes resources necessary for the SSAO funcionality.
/// @param {real} radius Radius of the occlusion effect. Anything
///                      further than that won't add to occlusion.
/// @param {real} bias   Depth bias to avoid too much self occlusion.
///                      Higher values mean lower self occlusion.
/// @param {real} power  Strength of the occlusion effect. Should be
///                      greater than 0.

//> Comment out if you are using view-space normals instead
//> of world-space. This line is also present in the xShSSAO shader,
//> so don't forget to comment out that one as well!
#macro X_SSAO_WORLD_SPACE_NORMALS true

//> Size of the noise texture. Must be the same value as in the
//> xShSSAOBlur shader!
#macro X_SSAO_NOISE_TEXTURE_SIZE 4

//> The higher the better quality, but lower performance.
//> Values between 16 and 64 are suggested.
//> Must be the same values as in the xShSSAO shader!
#macro X_SSAO_KERNEL_SIZE 16

xSurSsaoNoise = noone;
xSsaoKernel = xSsaoCreateKernel(X_SSAO_KERNEL_SIZE);
xSsaoRadius = argument0;
xSsaoBias = argument1;
xSsaoPower = argument2

// TODO: Store SSAO shader uniforms once instead of calling
// shader_get_uniform every frame.