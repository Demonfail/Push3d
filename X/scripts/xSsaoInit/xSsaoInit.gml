/// @func xSsaoInit(radius, bias, power)
/// @desc Initializes resources necessary for the SSAO funcionality.
/// @param {real} radius Radius of the occlusion effect. Anything further than
///                      that won't add to occlusion.
/// @param {real} bias   Depth bias to avoid too much self occlusion. Higher
///                      values mean lower self occlusion.
/// @param {real} power  Strength of the occlusion effect. Should be greater
///                      than 0.

//> Comment out if you are using view-space normals instead of world-space.
//> This line is also present in the xShSSAO shader, so don't forget to comment
//> out that one as well!
#macro X_SSAO_WORLD_SPACE_NORMALS true

//> Size of the noise texture. Must be the same value as in the xShSSAOBlur
//> shader!
#macro X_SSAO_NOISE_TEXTURE_SIZE 4

//> The higher the better quality, but lower performance. Values between 16 and
//> 64 are suggested. Must be the same values as in the xShSSAO shader!
#macro X_SSAO_KERNEL_SIZE 16

xSurSsaoNoise = noone;
xSsaoKernel   = xSsaoCreateKernel(X_SSAO_KERNEL_SIZE);
xSsaoRadius   = argument0;
xSsaoBias     = argument1;
xSsaoPower    = argument2;

// Uniforms
xUSsaoTexNormal    = shader_get_sampler_index(xShSSAO, "texNormal");
xUSsaoTexRandom    = shader_get_sampler_index(xShSSAO, "texRandom");
xUSsaoMatView      = shader_get_uniform(xShSSAO, "u_mView");
xUSsaoMatProj      = shader_get_uniform(xShSSAO, "u_mProjection");
xUSsaoTexel        = shader_get_uniform(xShSSAO, "u_vTexel");
xUSsaoClipFar      = shader_get_uniform(xShSSAO, "u_fClipFar");
xUSsaoTanAspect    = shader_get_uniform(xShSSAO, "u_vTanAspect");
xUSsaoSampleKernel = shader_get_uniform(xShSSAO, "u_vSampleKernel");
xUSsaoRadius       = shader_get_uniform(xShSSAO, "u_fRadius");
xUSsaoPower        = shader_get_uniform(xShSSAO, "u_fPower");
xUSsaoNoiseScale   = shader_get_uniform(xShSSAO, "u_vNoiseScale");
xUSsaoBias         = shader_get_uniform(xShSSAO, "u_fBias");
xUSsaoBlurTexel    = shader_get_uniform(xShSSAOBlur, "u_vTexel");