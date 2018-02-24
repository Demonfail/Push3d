/// @func xSsaoDraw(surSsao, surWork, surDepth, surNormal, matView, matProj, clipFar)
/// @desc Renders SSAO into the `surSsao` surface.
/// @param {real} surSsao   The surface to draw the SSAO to.
/// @param {real} surWork   A working surface used for blurring the SSAO. Must have
///                         the same size as `surSsao`!.
/// @param {real} surDepth  A surface containing the scene depth.
/// @param {real} surNormal A surface containing the scene normals.
/// @param {array} matView  The view matrix used when rendering the scene.
/// @param {array} matProj  The projection matrix used when rendering the scene.
/// @param {real} clipFar   A distance to the far clipping plane (same as in the
///                         projection used when rendering the scene).
var _surSsao = argument0;
var _surWork = argument1;
var _surSceneDepth = argument2;
var _texSceneNormal = surface_get_texture(argument3);
var _matView = argument4;
var _matProj = argument5;
var _clipFar = argument6;
var _tanAspect = [1/_matProj[0], -1/_matProj[5]];
var _width = surface_get_width(_surSsao);
var _height = surface_get_height(_surSsao);

if (!surface_exists(xSurSsaoNoise)) {
	xSurSsaoNoise = xSsaoMakeNoiseSurface(X_SSAO_NOISE_TEXTURE_SIZE);
}

// TODO: For the SSAO, texture repeat should be enabled only for the
// noise texture, otherwise false occlusion occurs on the screen edges.
var _texRepeat = gpu_get_tex_repeat();
gpu_set_tex_repeat(true);

var _shader = xShSSAO;
surface_set_target(_surSsao);
draw_clear(0);
shader_set(_shader);
texture_set_stage(1, _texSceneNormal);
texture_set_stage(2, surface_get_texture(xSurSsaoNoise));
if (X_SSAO_WORLD_SPACE_NORMALS) {
	shader_set_uniform_matrix_array(shader_get_uniform(_shader, "u_mView"),_matView);
}
shader_set_uniform_matrix_array(shader_get_uniform(_shader, "u_mProjection"), _matProj);
shader_set_uniform_f(shader_get_uniform(_shader, "u_fTexel"), 1/_width, 1/_height);
shader_set_uniform_f(shader_get_uniform(_shader, "u_fClipFar"), _clipFar); 
shader_set_uniform_f_array(shader_get_uniform(_shader, "u_fTanAspect"), _tanAspect);
shader_set_uniform_f_array(shader_get_uniform(_shader, "u_fSampleKernel"), xSsaoKernel);
shader_set_uniform_f(shader_get_uniform(_shader, "u_fRadius"), xSsaoRadius);
shader_set_uniform_f(shader_get_uniform(_shader, "u_fPower"), xSsaoPower);
shader_set_uniform_f(shader_get_uniform(_shader, "u_fNoiseScale"), _width/X_SSAO_NOISE_TEXTURE_SIZE, _height/X_SSAO_NOISE_TEXTURE_SIZE);
shader_set_uniform_f(shader_get_uniform(_shader, "u_fBias"), xSsaoBias);
draw_surface_stretched(_surSceneDepth, 0, 0, _width, _height);
shader_reset();
surface_reset_target();

surface_set_target(_surWork);
draw_clear(0);
shader_set(xShSSAOBlur);
shader_set_uniform_f(shader_get_uniform(xShSSAOBlur, "u_fTexel"), 1/_width, 0);
draw_surface(_surSsao, 0, 0);
shader_reset();
surface_reset_target();

surface_set_target(_surSsao);
draw_clear(0);
shader_set(xShSSAOBlur);
shader_set_uniform_f(shader_get_uniform(xShSSAOBlur, "u_fTexel"), 0, 1/_height);
draw_surface(_surWork, 0, 0);
shader_reset();
surface_reset_target();

gpu_set_tex_repeat(_texRepeat);