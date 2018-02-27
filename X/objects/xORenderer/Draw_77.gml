/// @desc Compose image

//==============================================================================
// Light bloom
var _width = surface_get_width(surWork);
var _height = surface_get_height(surWork);
surLightBloom = xSurfaceCheck(surLightBloom, _width, _height);

surface_set_target(surLightBloom);
draw_clear(0);
draw_surface_stretched(surGBuffer[xEGBuffer.Emissive], 0, 0, _width, _height);
surface_reset_target();

// TODO: Optimize light-bloom blur.
xSurfaceBlur(surLightBloom, surWork, 8);
xSurfaceBlur(surLightBloom, surWork, 4);
xSurfaceBlur(surLightBloom, surWork, 2);

var _appSurW = surface_get_width(application_surface);
var _appSurH = surface_get_height(application_surface);
surface_set_target(application_surface);
gpu_set_zwriteenable(false);
gpu_set_ztestenable(false);
gpu_set_blendmode(bm_add);
draw_surface_stretched(surLightBloom, 0, 0, _appSurW, _appSurH);
gpu_set_blendmode(bm_normal);

gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);
surface_reset_target();

//==============================================================================
// Post-process
var _shader = xShPostProcess;
shader_set(_shader);
texture_set_stage(1, sprite_get_texture(xSprColorGradingLut, 0));
shader_set_uniform_f(shader_get_uniform(_shader, "u_fLUTIndex"), keyboard_check(ord("C")));
shader_set_uniform_f(shader_get_uniform(_shader, "u_fTexel"), 1/_appSurW, 1/_appSurH);
shader_set_uniform_f(shader_get_uniform(_shader, "u_fDistortion"), 3);
draw_surface(application_surface, 0, 0);
shader_reset();

//==============================================================================
// Debug
//var _x = 0;
//var _y = 0;
//var _w = window_get_width() / 6;
//var _h = window_get_height() / 6;

//for (var i = 0; i < xEGBuffer.SIZE; ++i)
//{
//	draw_surface_stretched(surGBuffer[i], _x, _y, _w, _h);
//	_x += _w;
//}

//draw_surface_stretched(surShadowMap, _x, _y, _h, _h);
//_x += _h;