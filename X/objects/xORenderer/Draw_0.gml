/// @desc Render
var _shader;
var _screenWidth = window_get_width();
var _screenHeight = window_get_height();
var _texAlbedo = sprite_get_texture(xSprDefault, 0);
var _texNormal = sprite_get_texture(xSprDefault, 1);

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
draw_clear(c_red);

var _matViewSun = matrix_build_lookat(
	x, y, 0,
	x + sunDir[0],
	y + sunDir[1],
	sunDir[2],
	0, 0, 1);

var _matProjSun = matrix_build_projection_ortho(
	shadowMapArea, shadowMapArea,
	0, shadowMapArea);

matrix_set(matrix_view, _matViewSun);
matrix_set(matrix_projection, _matProjSun);

var _matShadowMap = matrix_multiply(_matViewSun, _matProjSun);

shader_set(xShShadowMap);
matrix_set(matrix_world, matrix_build(0, 0, 0, 0, 0, 0, 40, 40, 40));
vertex_submit(vBuffer, pr_trianglelist, _texAlbedo)
matrix_set(matrix_world, matrix_build_identity());
shader_reset();

surface_reset_target();

//==============================================================================
// G-Buffer pass
surface_set_target_ext(0, application_surface);
surface_set_target_ext(1, surGBuffer[xEGBuffer.Normal]);
surface_set_target_ext(2, surGBuffer[xEGBuffer.Depth]);
// TODO: surface_set_target_ext(3, surEmissive);
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

var _matProj = matrix_build_projection_perspective_fov(
	60, window_get_width() / window_get_height(), 1, clipFar);

matrix_set(matrix_view, _matView);
matrix_set(matrix_projection, _matProj);

texture_set_stage(1, _texNormal); // Set normal map
matrix_set(matrix_world, matrix_build(0, 0, 0, 0, 0, 0, 40, 40, 40));
vertex_submit(vBuffer, pr_trianglelist, _texAlbedo);
matrix_set(matrix_world, matrix_build_identity());

shader_reset();
surface_reset_target();

gpu_set_blendenable(true);

surface_set_target(surGBuffer[xEGBuffer.Albedo]);
draw_clear_alpha(0, 0);
surface_reset_target();
surface_copy(surGBuffer[xEGBuffer.Albedo], 0, 0, application_surface);

//==============================================================================
// SSAO
var _ssaoWidth = _screenWidth * ssaoResolution;
var _ssaoHeight = _screenHeight * ssaoResolution;
surSSAO = xSurfaceCheck(surSSAO, _ssaoWidth, _ssaoHeight);
surWork = xSurfaceCheck(surWork, _ssaoWidth, _ssaoHeight);

var _aspect = _screenWidth / _screenHeight;
var _tanFovY = dtan(fov * 0.5);
var _tanAspect = [_tanFovY * _aspect, -_tanFovY];
var _texSceneNormal = surface_get_texture(surGBuffer[xEGBuffer.Normal]);
var _texSceneDepth = surface_get_texture(surGBuffer[xEGBuffer.Depth]);

// Make kernel
if (!is_array(ssaoKernel)) {
	for (var i = ssaoKernelSize - 1; i >= 0; --i) {
		var _vec = xVec3Create(random_range(-1, 1), random_range(-1, 1), random(1));
		xVec3Normalize(_vec);
		var _s = i/ssaoKernelSize;
		_s = lerp(0.1, 1.0, _s*_s);
		xVec3Scale(_vec, _s);
		ssaoKernel[i*3 + 2] = _vec[2];
		ssaoKernel[i*3 + 1] = _vec[1];
		ssaoKernel[i*3 + 0] = _vec[0];
	}
}

// Make noise texture
if (!surface_exists(surSSAONoise)) {
	surSSAONoise = surface_create(ssaoNoiseTexSize, ssaoNoiseTexSize);
	surface_set_target(surSSAONoise);
	draw_clear(0);
	for (var i = 0; i < ssaoNoiseTexSize; ++i) {
		for (var j = 0; j < ssaoNoiseTexSize; ++j) {
			var _vec = xVec3Create(random_range(-1, 1), random_range(-1, 1), 0);
			xVec3Normalize(_vec);
			draw_point_colour(i, j,
				make_colour_rgb(
					(_vec[0] * 0.5 + 0.5) * 255,
					(_vec[1] * 0.5 + 0.5) * 255,
					(_vec[2] * 0.5 + 0.5) * 255));
		}
	}
	surface_reset_target();
}

gpu_set_tex_repeat(true);

_shader = xShSSAO;
surface_set_target(surSSAO);
draw_clear(0);
shader_set(_shader);
texture_set_stage(1, _texSceneNormal);
texture_set_stage(2, surface_get_texture(surSSAONoise));
shader_set_uniform_matrix_array(shader_get_uniform(_shader, "u_mView"), _matView); // Only when using world-space normals
shader_set_uniform_matrix_array(shader_get_uniform(_shader, "u_mProjection"), _matProj);
shader_set_uniform_f(shader_get_uniform(_shader, "u_fTexel"), 1/_ssaoWidth, 1/_ssaoHeight);
shader_set_uniform_f(shader_get_uniform(_shader, "u_fClipFar"), clipFar); 
shader_set_uniform_f_array(shader_get_uniform(_shader, "u_fTanAspect"), _tanAspect);
shader_set_uniform_i(shader_get_uniform(_shader, "u_iSampleKernelSize"), ssaoKernelSize);
shader_set_uniform_f_array(shader_get_uniform(_shader, "u_fSampleKernel"), ssaoKernel);
shader_set_uniform_f(shader_get_uniform(_shader, "u_fRadius"), ssaoRadius);
shader_set_uniform_f(shader_get_uniform(_shader, "u_fPower"), ssaoPower);
shader_set_uniform_f(shader_get_uniform(_shader, "u_fNoiseScale"),
	_screenWidth/ssaoNoiseTexSize, _screenHeight/ssaoNoiseTexSize);
shader_set_uniform_f(shader_get_uniform(_shader, "u_fBias"), 4);
draw_surface_stretched(surGBuffer[xEGBuffer.Depth], 0, 0, _ssaoWidth, _ssaoHeight);
shader_reset();
surface_reset_target();

surface_set_target(surWork);
draw_clear(0);
shader_set(xShSSAOBlur);
shader_set_uniform_f(shader_get_uniform(xShSSAOBlur, "u_fTexel"), 1/_ssaoWidth, 0);
draw_surface(surSSAO, 0, 0);
shader_reset();
surface_reset_target();

surface_set_target(surSSAO);
draw_clear(0);
shader_set(xShSSAOBlur);
shader_set_uniform_f(shader_get_uniform(xShSSAOBlur, "u_fTexel"), 0, 1/_ssaoHeight);
draw_surface(surWork, 0, 0);
shader_reset();
surface_reset_target();

//==============================================================================
// Light pass
surface_set_target_ext(0, application_surface);
// TODO: surface_set_target_ext(1, surEmissive);
gpu_set_zwriteenable(false);
gpu_set_ztestenable(false);

// First render base lighting to be added upon
_shader = xShAmbient;
shader_set(_shader);
texture_set_stage(1, surface_get_texture(surSSAO));
shader_set_uniform_f(shader_get_uniform(_shader, "u_fAmbient"), 1, 1, 1, 0.1);
draw_surface(surGBuffer[xEGBuffer.Albedo], 0, 0);
shader_reset();

// Blend other lights
gpu_set_blendmode_ext(bm_one, bm_one);

_shader = xShDeferredDirectional;
shader_set(_shader);
shader_set_uniform_f_array(shader_get_uniform(_shader, "u_fLightDir"), sunDir);
shader_set_uniform_f(shader_get_uniform(_shader, "u_fShadowMapArea"), shadowMapArea);
var _texel = 1 / shadowMapRes;
shader_set_uniform_f(shader_get_uniform(_shader, "u_fShadowMapTexel"), _texel, _texel);
shader_set_uniform_f(shader_get_uniform(_shader, "u_fLightCol"), 0.8, 0.8, 0.5, 1.0);
shader_set_uniform_f(shader_get_uniform(_shader, "u_fClipFar"), clipFar);
shader_set_uniform_f_array(shader_get_uniform(_shader, "u_fTanAspect"), _tanAspect);
shader_set_uniform_matrix_array(shader_get_uniform(_shader, "u_mInverse"), _matViewInverse);
shader_set_uniform_matrix_array(shader_get_uniform(_shader, "u_mShadowMap"), _matShadowMap);
texture_set_stage(1, _texSceneNormal);
texture_set_stage(2, _texSceneDepth);
texture_set_stage(3, surface_get_texture(surShadowMap));
draw_surface(surGBuffer[xEGBuffer.Albedo], 0, 0);
shader_reset();

// Point lights
if (instance_exists(xOLightPoint)) {
	var _cullMode = gpu_get_cullmode();
	_shader = xShDeferredPoint;
	shader_set(_shader);
	shader_set_uniform_f(shader_get_uniform(_shader, "u_fClipFar"), clipFar);
	shader_set_uniform_f_array(shader_get_uniform(_shader, "u_fTanAspect"), _tanAspect);
	shader_set_uniform_matrix_array(shader_get_uniform(_shader, "u_mInverse"), _matViewInverse);
	texture_set_stage(1, _texSceneNormal);
	texture_set_stage(2, _texSceneDepth);

	var _matWorld = matrix_get(matrix_world);
	matrix_set(matrix_view, _matView);
	matrix_set(matrix_projection, _matProj);

	gpu_set_cullmode(cull_clockwise);

	var _1by255 = 1 / 255;
	var _texSceneAlbedo = surface_get_texture(surGBuffer[xEGBuffer.Albedo]);
	var _uLightPos = shader_get_uniform(_shader, "u_fLightPos");
	var _uLightCol = shader_get_uniform(_shader, "u_fLightCol");

	with (xOLightPoint) {
		shader_set_uniform_f(_uLightPos, x, y, z, radius);
		shader_set_uniform_f(_uLightCol,
			color_get_red(color) * _1by255,
			color_get_green(color) * _1by255,
			color_get_blue(color) * _1by255,
			intensity);

		var _scale = radius + 0.2;
		matrix_set(matrix_world,
			matrix_build(x, y, z, 0, 0, 0, _scale, _scale, _scale));
		vertex_submit(other.vBufferLightPoint, pr_trianglelist, _texSceneAlbedo);
	}
	matrix_set(matrix_world, _matWorld);

	gpu_set_cullmode(_cullMode);
	shader_reset();
}

gpu_set_blendmode(bm_normal);

gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);
surface_reset_target();

//==============================================================================
// Forward pass
//surface_set_target(application_surface);
//matrix_set(matrix_view, _matView);
//matrix_set(matrix_projection, _matProj);
// TODO: Render particles and other forward shaded stuff here...
//surface_reset_target();