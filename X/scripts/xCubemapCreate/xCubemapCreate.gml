/// @func xCubemapCreate(posX, negX, posY, negY, posZ, negZ)
/// @desc Creates a cubemap.
/// @param {real} posX The surface used for the +X (front) side of the cubemap.
/// @param {real} negX The surface used for the -X (back) side of the cubemap.
/// @param {real} posY The surface used for the +Y (right) side of the cubemap.
/// @param {real} negY The surface used for the -Y (left) side of the cubemap.
/// @param {real} posZ The surface used for the +Z (top) side of the cubemap.
/// @param {real} negZ The surface used for the -Z (bottom) side of the cubemap.
/// @return {array} An array representing the cubemap.
#macro X_CUBEMAP_SIDE_POSITIVE_X 0
#macro X_CUBEMAP_SIDE_NEGATIVE_X 1
#macro X_CUBEMAP_SIDE_POSITIVE_Y 2
#macro X_CUBEMAP_SIDE_NEGATIVE_Y 3
#macro X_CUBEMAP_SIDE_POSITIVE_Z 4
#macro X_CUBEMAP_SIDE_NEGATIVE_Z 5

gml_pragma("forceinline");
return [
	argument0,
	argument1,
	argument2,
	argument3,
	argument4,
	argument5
];