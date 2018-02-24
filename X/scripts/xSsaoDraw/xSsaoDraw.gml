/// @func xSsaoDraw(surSsao, surWork, surDepth, surNormal, clipFar, aspect, fovY, matProj, matView)
/// @desc Renders SSAO into the `surSsao` surface.
/// @param {real} surSsao   The surface to draw the SSAO to.
/// @param {real} surWork   A working surface used for blurring the SSAO. Must have
///                         the same size as `surSsao`!.
/// @param {real} surDepth  A surface containing the scene depth.
/// @param {real} surNormal A surface containing the scene normals.
/// @param {real} clipFar   A distance to the far clipping plane (same as in the
///                         projection used when rendering the scene).
/// @param {real} aspect    An aspect ratio (same as in the projection used when
///                         rendering the scene).
/// @param {real} fovY      A field of view (in degrees) (same as in the projection
///                         used when rendering the scene).
/// @param {array} matProj 
/// @param {array} matView 
/// @note It is necessary to have the same `matrix_projection` as when rendering the
///       scene. If you are using world-space normals (eg. X_SSAO_WORLD_SPACE_NORMALS
///       is set to true), then the same applies for the `matrix_view`.
var _surSsao = argument0;
var _surWork = argument1;
var _surSceneDepth = argument2;
var _texSceneNormal = surface_get_texture(argument3);
var _clipFar = argument4;
var _aspect = argument5;
var _tanFovY = dtan(argument6 * 0.5);
var _matProj = argument7;
var _matView = argument8;
var _tanAspect = [_tanFovY * _aspect, -_tanFovY];
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