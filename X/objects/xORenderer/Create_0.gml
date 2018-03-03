/// @desc Init
gpu_set_zwriteenable(true);
gpu_set_ztestenable(true);
gpu_set_cullmode(cull_counterclockwise);
gpu_set_texfilter(true);

// Surfaces
application_surface_enable(true);
application_surface_draw_enable(false);

enum xEGBuffer
{
	Albedo,
	Normal,
	Depth,
	Emissive, // Used for emmisive materials and specular reflections.
	SIZE
};

for (var i = xEGBuffer.SIZE - 1; i >= 0; --i)
{
	surGBuffer[i] = noone;
}

// Shadow mapping
surShadowMap = noone;
shadowMapRes = 1024;
shadowMapArea = 1024;
sunDir = [0.5, 0.5, -0.5];

// SSAO
xSsaoInit(12, 4, 2);
ssaoResolution = 0.5;
surSsao = noone;
surWork = noone;

surLightBloom = noone;

// Camera
z = 1;
pitch = 0;
fov = 60;
clipNear = 1;
clipFar = 8192;
mouseXLast = 0;
mouseYLast = 0;

// Meshes
xMeshInit();
var _mesh;

_mesh = xMeshLoadFromObj("Models/LightPoint.obj");
xAssert(_mesh != noone, "Mesh loading failed!");
vBufferLightPoint = xMeshToVBuffer(_mesh, global.vBufferFormatBare);
xMeshDestroy(_mesh);

_mesh = xMeshLoadFromObj("Models/TestScene.obj");
xAssert(_mesh != noone, "Mesh loading failed!");
xMeshRecalculateTangentW(_mesh);
vBuffer = xMeshToVBuffer(_mesh, global.vBufferFormat);
xMeshDestroy(_mesh);