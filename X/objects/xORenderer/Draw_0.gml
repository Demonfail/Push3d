/// @desc Render
var _screenWidth = window_get_width();
var _screenHeight = window_get_height();

// Check surfaces
xSurfaceCheck(application_surface, _screenWidth, _screenHeight);
for (var i = xEGBuffer.SIZE - 1; i >= 0; --i) {
	surGBuffer[i] = xSurfaceCheck(surGBuffer[i], _screenWidth, _screenHeight);
}

//==============================================================================
// G-Buffer pass
surface_set_target_ext(0, application_surface);
surface_set_target_ext(1, surGBuffer[xEGBuffer.Normal]);
surface_set_target_ext(2, surGBuffer[xEGBuffer.Depth]);
draw_clear_alpha(0, 0);
gpu_set_blendenable(false);

var _clipFar = 8192;

var _shader = xShGBuffer;
shader_set(_shader);
shader_set_uniform_f(shader_get_uniform(_shader, "u_fClipFar"), _clipFar);

matrix_set(matrix_view,
	matrix_build_lookat(
		x, y, z,
		x + dcos(direction),
		y - dsin(direction),
		z + dtan(pitch),
		0, 0, 1));

matrix_set(matrix_projection,
	matrix_build_projection_perspective_fov(
		60, window_get_width() / window_get_height(), 1, _clipFar));

vertex_submit(vBuffer, pr_trianglelist, sprite_get_texture(xSprDefault, 0));

gpu_set_blendenable(true);
shader_reset();
surface_reset_target();

surface_set_target(surGBuffer[xEGBuffer.Albedo]);
draw_clear_alpha(0, 0);
surface_reset_target();
surface_copy(surGBuffer[xEGBuffer.Albedo], 0, 0, application_surface);

//==============================================================================
// Light pass


//==============================================================================
// Forward pass