/// @func p3d_ssao_init(radius, bias, power)
/// @desc Initializes resources necessary for the SSAO funcionality.
/// @param {real} radius Radius of the occlusion effect. Anything further than
///                      that won't add to occlusion.
/// @param {real} bias   Depth bias to avoid too much self occlusion. Higher
///                      values mean lower self occlusion.
/// @param {real} power  Strength of the occlusion effect. Should be greater
///                      than 0.

//> Comment out if you are using view-space normals instead of world-space.
//> This line is also present in the P3dShSSAO shader, so don't forget to comment
//> out that one as well!
#macro P3D_SSAO_WORLD_SPACE_NORMALS true

//> Size of the noise texture. Must be the same value as in the P3dShSSAOBlur
//> shader!
#macro P3D_SSAO_NOISE_TEXTURE_SIZE 4

//> The higher the better quality, but lower performance. Values between 16 and
//> 64 are suggested. Must be the same values as in the P3dShSSAO shader!
#macro P3D_SSAO_KERNEL_SIZE 16

p3dSurSsaoNoise = noone;
p3dSsaoKernel   = p3d_ssao_create_kernel(P3D_SSAO_KERNEL_SIZE);
p3dSsaoRadius   = argument0;
p3dSsaoBias     = argument1;
p3dSsaoPower    = argument2;

// Uniforms
p3dUSsaoTexNormal    = shader_get_sampler_index(P3dShSSAO, "texNormal");
p3dUSsaoTexRandom    = shader_get_sampler_index(P3dShSSAO, "texRandom");
p3dUSsaoMatView      = shader_get_uniform(P3dShSSAO, "u_mView");
p3dUSsaoMatProj      = shader_get_uniform(P3dShSSAO, "u_mProjection");
p3dUSsaoTexel        = shader_get_uniform(P3dShSSAO, "u_vTexel");
p3dUSsaoClipFar      = shader_get_uniform(P3dShSSAO, "u_fClipFar");
p3dUSsaoTanAspect    = shader_get_uniform(P3dShSSAO, "u_vTanAspect");
p3dUSsaoSampleKernel = shader_get_uniform(P3dShSSAO, "u_vSampleKernel");
p3dUSsaoRadius       = shader_get_uniform(P3dShSSAO, "u_fRadius");
p3dUSsaoPower        = shader_get_uniform(P3dShSSAO, "u_fPower");
p3dUSsaoNoiseScale   = shader_get_uniform(P3dShSSAO, "u_vNoiseScale");
p3dUSsaoBias         = shader_get_uniform(P3dShSSAO, "u_fBias");
p3dUSsaoBlurTexel    = shader_get_uniform(P3dShSSAOBlur, "u_vTexel");