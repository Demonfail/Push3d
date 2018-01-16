/// @desc Render
var _shader;
var _screenWidth = window_get_width();
var _screenHeight = window_get_height();
var _texDefault = sprite_get_texture(xSprDefault, 0);

// Check surfaces
xSurfaceCheck(application_surface, _screenWidth, _screenHeight);
for (var i = xEGBuffer.SIZE - 1; i >= 0; --i) {
	surGBuffer[i] = xSurfaceCheck(surGBuffer[i], _screenWidth, _screenHeight);
}
surShadowMap = xSurfaceCheck(surShadowMap, shadowMapRes, shadowMapRes);

gpu_set_blendenable(false);

//==============================================================================
// Shadow map
surface_set_target(surShadowMap);
draw_clear_alpha(0, 0);

var _matViewSun = matrix_build_lookat(
	x, y, 0,
	x + sunDir[0],
	y + sunDir[1],
	sunDir[2],
	0, 0, 1);

var _matProjSun = matrix_build_projection_ortho(
	shadowMapArea, shadowMapArea,
	-shadowMapArea * 0.5, shadowMapArea * 0.5);

matrix_set(matrix_view, _matViewSun);
matrix_set(matrix_projection, _matProjSun);

var _matShadowMap = matrix_multiply(_matViewSun, _matProjSun);

shader_set(xShShadowMap);
vertex_submit(vBuffer, pr_trianglelist, _texDefault)
shader_reset();

surface_reset_target();

//==============================================================================
// G-Buffer pass
surface_set_target_ext(0, application_surface);
surface_set_target_ext(1, surGBuffer[xEGBuffer.Normal]);
surface_set_target_ext(2, surGBuffer[xEGBuffer.Depth]);
draw_clear_alpha(0, 0);

_shader = xShGBuffer;
shader_set(_shader);
shader_set_uniform_f(shader_get_uniform(_shader, "u_fClipFar"), clipFar);

var _matView = matrix_build_lookat(
	x, y, z,
	x + dcos(direction),
	y - dsin(direction),
	z + dtan(pitch),
	0, 0, 1);

var _matViewInverse = xMatrixClone(_matView);
xMatrixInverse(_matViewInverse);

matrix_set(matrix_view, _matView);
matrix_set(matrix_projection,
	matrix_build_projection_perspective_fov(
		60, window_get_width() / window_get_height(), 1, clipFar));

vertex_submit(vBuffer, pr_trianglelist, _texDefault);

shader_reset();
surface_reset_target();

gpu_set_blendenable(true);

surface_set_target(surGBuffer[xEGBuffer.Albedo]);
draw_clear_alpha(0, 0);
surface_reset_target();
surface_copy(surGBuffer[xEGBuffer.Albedo], 0, 0, application_surface);

//==============================================================================
// Light pass
surface_set_target(application_surface);
gpu_set_zwriteenable(false);
gpu_set_ztestenable(false);

// First render base lighting to be added upon
var _aspect = _screenWidth / _screenHeight;
var _tanFovY = dtan(fov * 0.5);

_shader = xShDeferredDirectional;
shader_set(_shader);
shader_set_uniform_f_array(shader_get_uniform(_shader, "u_fLightDir"), sunDir);
shader_set_uniform_f(shader_get_uniform(_shader, "u_fLightCol"), 0.8, 0.8, 0.5, 1.0);
shader_set_uniform_f(shader_get_uniform(_shader, "u_fClipFar"), clipFar);
shader_set_uniform_f(shader_get_uniform(_shader, "u_fTanAspect"), _tanFovY * _aspect, -_tanFovY);
shader_set_uniform_matrix_array(shader_get_uniform(_shader, "u_mInverse"), _matViewInverse);
shader_set_uniform_matrix_array(shader_get_uniform(_shader, "u_mShadowMap"), _matShadowMap);
texture_set_stage(1, surface_get_texture(surGBuffer[xEGBuffer.Normal]));
texture_set_stage(2, surface_get_texture(surGBuffer[xEGBuffer.Depth]));
texture_set_stage(3, surface_get_texture(surShadowMap));
draw_surface(surGBuffer[xEGBuffer.Albedo], 0, 0);
shader_reset();

// Blend other lights
gpu_set_blendmode_ext(bm_one, bm_one);

gpu_set_blendmode(bm_normal);

gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);
surface_reset_target();


//==============================================================================
// Forward pass