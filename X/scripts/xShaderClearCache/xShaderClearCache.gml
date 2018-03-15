/// @func xShaderClearCache()
with (xORenderCache)
{
	ds_map_clear(currentUniforms);
	ds_map_clear(currentTextures);
}