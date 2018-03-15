/// @func xTextureSetStageCached(samplerId, textureId)
var _currentTextures = xORenderCache.currentTextures;
if (!ds_map_exists(_currentTextures, argument0)
	|| _currentTextures[? argument0] != argument1)
{
	texture_set_stage(argument0, argument1);
	_currentTextures[? argument0] = argument1;
}