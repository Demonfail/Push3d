/// @desc Compose image
var _appSurW = surface_get_width(application_surface);
var _appSurH = surface_get_height(application_surface);

//==============================================================================
// Light bloom
var _width    = surface_get_width(surWork);
var _height   = surface_get_height(surWork);
surLightBloom = xSurfaceCheck(surLightBloom, _width, _height);

surface_set_target(surLightBloom);
draw_clear_alpha(0, 1);
gpu_set_blendmode_ext(bm_dest_alpha, bm_dest_alpha);
draw_surface_stretched(surGBuffer[xEGBuffer.EmissiveTranslucency], 0, 0, _width, _height);
gpu_set_blendmode(bm_normal);
surface_reset_target();

// TODO: Optimize light-bloom blur.
xSurfaceBlur(surLightBloom, surWork, 8);
xSurfaceBlur(surLightBloom, surWork, 4);
xSurfaceBlur(surLightBloom, surWork, 2);

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
texture_set_stage(shader_get_sampler_index(_shader, "u_sLut"), sprite_get_texture(xSprColorGradingLut, 0));
shader_set_uniform_f(shader_get_uniform(_shader, "u_fLutIndex"), keyboard_check(ord("C")));
shader_set_uniform_f(shader_get_uniform(_shader, "u_vTexel"), 1/_appSurW, 1/_appSurH);
shader_set_uniform_f(shader_get_uniform(_shader, "u_fDistortion"), 3);
draw_surface(application_surface, 0, 0);
shader_reset();