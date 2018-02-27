/// @desc Compose image
draw_surface(application_surface, 0, 0);

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
gpu_set_blendmode(bm_add);
draw_surface_stretched(surLightBloom, 0, 0, window_get_width(), window_get_height());
gpu_set_blendmode(bm_normal);

/*var _x = 0;
var _y = 0;
var _w = window_get_width() / 6;
var _h = window_get_height() / 6;

for (var i = 0; i < xEGBuffer.SIZE; ++i) {
	draw_surface_stretched(surGBuffer[i], _x, _y, _w, _h);
	_x += _w;
}

draw_surface_stretched(surShadowMap, _x, _y, _h, _h);
_x += _h;

draw_surface_stretched(surSSAONoise, _x, _y, _h, _h);
_x += _h;*/