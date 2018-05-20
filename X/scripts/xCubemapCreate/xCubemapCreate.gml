/// @func xCubemapCreate(resolution)
/// @desc Creates an empty cubemap, where each side is a separate surface.
/// @param {real} resolution Size of one cube side.
/// @return {array} An array representing the cubemap.
#macro X_CUBEMAP_POS_X 0
//< Index at which the +X (front) cubemap surface is stored.
#macro X_CUBEMAP_NEG_X 1
//< Index at which the -X (back) cubemap surface is stored.
#macro X_CUBEMAP_POS_Y 2
//< Index at which the +Y (right) cubemap surface is stored.
#macro X_CUBEMAP_NEG_Y 3
//< Index at which the -Y (left) cubemap surface is stored.
#macro X_CUBEMAP_POS_Z 4
//< Index at which the +Z (top) cubemap surface is stored.
#macro X_CUBEMAP_NEG_Z 5
//< Index at which the -Z (bottom) cubemap surface is stored.
#macro X_CUBEMAP_SIZE  6
//< Index at which the cubemap resolution is stored.

gml_pragma("forceinline");
return [
	noone,
	noone,
	noone,
	noone,
	noone,
	noone,
	argument0
];