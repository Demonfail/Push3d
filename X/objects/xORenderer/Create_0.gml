/// @desc Init
gpu_set_zwriteenable(true);
gpu_set_ztestenable(true);
gpu_set_cullmode(cull_counterclockwise);

// Surfaces
application_surface_enable(true);
application_surface_draw_enable(false);

enum xEGBuffer {
	Albedo,
	Normal,
	Depth,
	SIZE
};

for (var i = xEGBuffer.SIZE - 1; i >= 0; --i) {
	surGBuffer[i] = noone;
}

surShadowMap = noone;
shadowMapRes = 1024;
shadowMapArea = 512;
sunDir = [0.5, 0.5, -0.5];

// Vertex format
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vFormat = vertex_format_end();

// Camera
z = 1;
pitch = 0;
fov = 60;
clipNear = 1;
clipFar = 8192;
mouseXLast = 0;
mouseYLast = 0;

//==============================================================================
// Floor vertex buffer
vBuffer = vertex_create_buffer();
vertex_begin(vBuffer, vFormat);

// *-*
// |/
// *
vertex_position_3d(vBuffer, 0, 0, 0);
vertex_normal(vBuffer, 0, 0, 1);
vertex_texcoord(vBuffer, 0, 0);

vertex_position_3d(vBuffer, room_width, 0, 0);
vertex_normal(vBuffer, 0, 0, 1);
vertex_texcoord(vBuffer, 1, 0);

vertex_position_3d(vBuffer, 0, room_height, 0);
vertex_normal(vBuffer, 0, 0, 1);
vertex_texcoord(vBuffer, 0, 1);

//   *
//  /|
// *-*
vertex_position_3d(vBuffer, room_width, 0, 0);
vertex_normal(vBuffer, 0, 0, 1);
vertex_texcoord(vBuffer, 1, 0);

vertex_position_3d(vBuffer, room_width, room_height, 0);
vertex_normal(vBuffer, 0, 0, 1);
vertex_texcoord(vBuffer, 1, 1);

vertex_position_3d(vBuffer, 0, room_height, 0);
vertex_normal(vBuffer, 0, 0, 1);
vertex_texcoord(vBuffer, 0, 1);

vertex_end(vBuffer);
vertex_freeze(vBuffer);