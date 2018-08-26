/// @func p3d_texture_set_stage_cached(samplerId, textureId)
var _currentTextures = P3dObjRenderCache.currentTextures;
if (!ds_map_exists(_currentTextures, argument0)
	|| _currentTextures[? argument0] != argument1)
{
	texture_set_stage(argument0, argument1);
	_currentTextures[? argument0] = argument1;
}