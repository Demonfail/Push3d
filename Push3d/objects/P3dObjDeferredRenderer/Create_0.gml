/// @desc Init
gpu_set_zwriteenable(true);
gpu_set_ztestenable(true);
gpu_set_cullmode(cull_counterclockwise);
gpu_set_texfilter(true);

// Surfaces
application_surface_enable(true);
application_surface_draw_enable(false);

// GB | RGB                  | A
// -- | -------------------- | ------------
// 0  | Albedo/SpecularColor | AO
// 1  | Normal               | Roughness
// 2  | Depth                | Metalness
// 3  | Emissive             | Translucency

enum P3dEGBuffer
{
	AlbedoAO,
	NormalRoughness,
	DepthMetalness,
	EmissiveTranslucency, // Emissive used for both emmisive materials and specular reflections!
	SIZE
};

for (var i = P3dEGBuffer.SIZE - 1; i >= 0; --i)
{
	surGBuffer[i] = noone;
}

// SSAO
p3d_ssao_init(8, 4, 2);
ssaoResolution = 0.5;
surSsao = noone;
surWork = noone;

surLightBloom = noone;

// Camera
z          = 1;
pitch      = 0;
fov        = 60;
clipNear   = 1;
clipFar    = 8192;
mouseXLast = 0;
mouseYLast = 0;

// Meshes
p3d_mesh_init();
var _mesh;

_mesh = p3d_mesh_load_obj("Models/LightPoint.obj");
p3d_assert(_mesh != noone, "Mesh loading failed!");
vBufferLightPoint = p3d_mesh_to_vbuffer(_mesh, global.vBufferFormatBare);
p3d_mesh_destroy(_mesh);

_mesh = p3d_mesh_load_obj("Models/TestScene.obj");
p3d_assert(_mesh != noone, "Mesh loading failed!");
p3d_mesh_recalculate_tbn(_mesh);
vBuffer = p3d_mesh_to_vbuffer(_mesh, global.vBufferFormat);
p3d_mesh_destroy(_mesh);