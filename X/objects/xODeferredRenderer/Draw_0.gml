/// @desc Render
var _shader;
var _screenWidth  = window_get_width();
var _screenHeight = window_get_height();
var _texAlbedo    = sprite_get_texture(xSprDefault, 0);
var _texNormal    = sprite_get_texture(xSprDefault, 1);
var _texEmissive  = sprite_get_texture(xSprDefault, 2);

// Check surfaces
xSurfaceCheck(application_surface, _screenWidth, _screenHeight);
for (var i = xEGBuffer.SIZE - 1; i >= 0; --i)
{
	surGBuffer[i] = xSurfaceCheck(surGBuffer[i], _screenWidth, _screenHeight);
}
surShadowMap = xSurfaceCheck(surShadowMap, shadowMapRes, shadowMapRes);

gpu_set_blendenable(false);

//==============================================================================
// Shadow maps

// Sun
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

shader_set(xShShadowMapOrtho);
matrix_set(matrix_world, matrix_build(0, 0, 0, 0, 0, 0, 40, 40, 40));
vertex_submit(vBuffer, pr_trianglelist, _texAlbedo)
matrix_set(matrix_world, matrix_build_identity());
shader_reset();

surface_reset_target();

// Point lights
shader_set(xShShadowMap);
var _uLightPos = shader_get_uniform(xShShadowMap, "u_fLightPos");
var _uClipFar = shader_get_uniform(xShShadowMap, "u_fClipFar");
var _vBuffer = vBuffer;

with (xOLightPoint)
{
	if (!surface_exists(shadowmap))
	{
		var _world = matrix_build(0, 0, 0, 0, 0, 0, 40, 40, 40);
		var _proj = xCubemapGetProjectionMatrix(0.001, radius);
		var _pos = [x, y, z];
		for (var i = 0; i < 6; ++i)
		{
			surface_set_target(xCubemapGetSurface(cubemap, i));
			draw_clear(c_red);
			matrix_set(matrix_view, xCubemapGetViewMatrix(i, _pos));
			matrix_set(matrix_projection, _proj);

			shader_set_uniform_f(_uLightPos, x, y, z);
			shader_set_uniform_f(_uClipFar, radius);
			matrix_set(matrix_world, _world);
			vertex_submit(_vBuffer, pr_trianglelist, _texAlbedo)
			matrix_set(matrix_world, matrix_build_identity());

			surface_reset_target();
		}
	}
}

shader_reset();

with (xOLightPoint)
{
	if (!surface_exists(shadowmap))
	{
		shadowmap = xCubemapToSingleSurface(cubemap, shadowmap);
	}
}

//==============================================================================
// Clear G-Buffer
surface_set_target_ext(0, application_surface);
surface_set_target_ext(1, surGBuffer[xEGBuffer.Normal]);
surface_set_target_ext(2, surGBuffer[xEGBuffer.Depth]);
surface_set_target_ext(3, surGBuffer[xEGBuffer.Emissive]);
draw_clear_alpha(0, 0);
surface_reset_target();

//==============================================================================
// G-Buffer pass
surface_set_target_ext(0, application_surface);
surface_set_target_ext(1, surGBuffer[xEGBuffer.Normal]);
surface_set_target_ext(2, surGBuffer[xEGBuffer.Depth]);
surface_set_target_ext(3, surGBuffer[xEGBuffer.Emissive]);

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

var _aspect  = _screenWidth / _screenHeight;
var _matProj = matrix_build_projection_perspective_fov(
	fov, _aspect, 1, clipFar);

matrix_set(matrix_view, _matView);
matrix_set(matrix_projection, _matProj);

texture_set_stage(1, _texNormal);
texture_set_stage(2, _texEmissive);
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
var _ssaoWidth  = _screenWidth * ssaoResolution;
var _ssaoHeight = _screenHeight * ssaoResolution;
surSsao = xSurfaceCheck(surSsao, _ssaoWidth, _ssaoHeight);
surWork = xSurfaceCheck(surWork, _ssaoWidth, _ssaoHeight);
xSsaoDraw(
	surSsao, surWork,
	surGBuffer[xEGBuffer.Depth], surGBuffer[xEGBuffer.Normal],
	_matView,
	_matProj,
	clipFar);

//==============================================================================
// Light pass
var _tanFovY          = dtan(fov * 0.5);
var _tanAspect        = [_tanFovY * _aspect, -_tanFovY];
var _texSceneNormal   = surface_get_texture(surGBuffer[xEGBuffer.Normal]);
var _texSceneDepth    = surface_get_texture(surGBuffer[xEGBuffer.Depth]);
var _texSceneEmissive = surface_get_texture(surGBuffer[xEGBuffer.Emissive]);

surface_set_target_ext(0, application_surface);

gpu_set_zwriteenable(false);
gpu_set_ztestenable(false);

// First render base lighting to be added upon
_shader = xShAmbientEmissive;
shader_set(_shader);
texture_set_stage(1, surface_get_texture(surSsao));
texture_set_stage(2, _texSceneEmissive);
shader_set_uniform_f(shader_get_uniform(_shader, "u_fAmbient"), 1, 1, 1, 0.1);
draw_surface(surGBuffer[xEGBuffer.Albedo], 0, 0);
shader_reset();

surface_set_target_ext(1, surGBuffer[xEGBuffer.Emissive]);

// Blend other lights
gpu_set_colorwriteenable(true, true, true, false);
gpu_set_blendmode(bm_add);

// Directional light
//_shader = xShDeferredDirectional;
//shader_set(_shader);
//shader_set_uniform_f_array(shader_get_uniform(_shader, "u_fLightDir"), sunDir);
//shader_set_uniform_f(shader_get_uniform(_shader, "u_fShadowMapArea"), shadowMapArea);
//var _texel = 1 / shadowMapRes;
//shader_set_uniform_f(shader_get_uniform(_shader, "u_fShadowMapTexel"), _texel, _texel);
//shader_set_uniform_f(shader_get_uniform(_shader, "u_fLightCol"), 1.0, 1.0, 1.0, 1.0);
//shader_set_uniform_f(shader_get_uniform(_shader, "u_fClipFar"), clipFar);
//shader_set_uniform_f(shader_get_uniform(_shader, "u_fCamPos"), x, y, z);
//shader_set_uniform_f_array(shader_get_uniform(_shader, "u_fTanAspect"), _tanAspect);
//shader_set_uniform_matrix_array(shader_get_uniform(_shader, "u_mInverse"), _matViewInverse);
//shader_set_uniform_matrix_array(shader_get_uniform(_shader, "u_mShadowMap"), _matShadowMap);
//texture_set_stage(1, _texSceneNormal);
//texture_set_stage(2, _texSceneDepth);
//texture_set_stage(3, surface_get_texture(surShadowMap));
//draw_surface(surGBuffer[xEGBuffer.Albedo], 0, 0);
//shader_reset();

// Point lights
if (instance_exists(xOLightPoint))
{
	var _cullMode = gpu_get_cullmode();
	_shader = xShDeferredPoint;
	shader_set(_shader);
	shader_set_uniform_f(shader_get_uniform(_shader, "u_fClipFar"), clipFar);
	shader_set_uniform_f(shader_get_uniform(_shader, "u_fCamPos"), x, y, z);
	shader_set_uniform_f_array(shader_get_uniform(_shader, "u_fTanAspect"), _tanAspect);
	shader_set_uniform_matrix_array(shader_get_uniform(_shader, "u_mInverse"), _matViewInverse);
	texture_set_stage(1, _texSceneNormal);
	texture_set_stage(2, _texSceneDepth);

	var _matWorld = matrix_get(matrix_world);
	matrix_set(matrix_view, _matView);
	matrix_set(matrix_projection, _matProj);

	gpu_set_cullmode(cull_clockwise);

	var _1by255          = 1 / 255;
	var _texSceneAlbedo  = surface_get_texture(surGBuffer[xEGBuffer.Albedo]);
	var _uLightPos       = shader_get_uniform(_shader, "u_fLightPos");
	var _uLightCol       = shader_get_uniform(_shader, "u_fLightCol");
	var _uShadowMapTexel = shader_get_uniform(_shader, "u_fShadowMapTexel");

	with (xOLightPoint)
	{
		shader_set_uniform_f(_uLightPos, x, y, z, radius);
		shader_set_uniform_f(_uLightCol,
			color_get_red(color) * _1by255,
			color_get_green(color) * _1by255,
			color_get_blue(color) * _1by255,
			intensity);
		shader_set_uniform_f(_uShadowMapTexel,
			1 / surface_get_width(shadowmap),
			1 / surface_get_height(shadowmap));
		texture_set_stage(3, surface_get_texture(shadowmap));

		var _scale = radius + 0.5;
		matrix_set(matrix_world,
			matrix_build(x, y, z, 0, 0, 0, _scale, _scale, _scale));
		vertex_submit(other.vBufferLightPoint, pr_trianglelist, _texSceneAlbedo);
	}
	matrix_set(matrix_world, _matWorld);

	gpu_set_cullmode(_cullMode);
	shader_reset();
}

gpu_set_colorwriteenable(true, true, true, true);
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