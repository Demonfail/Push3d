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
var _mesh = xMeshLoadFromObj("Models/Cube.obj");
xAssert(_mesh != noone, "Mesh loading failed!");
xMeshRecalculateTBN(_mesh);
vBuffer = xMeshToVBuffer(_mesh);
xMeshDestroy(_mesh);