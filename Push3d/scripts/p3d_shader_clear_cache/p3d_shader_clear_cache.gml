/// @func p3d_shader_clear_cache()
with (P3dObjRenderCache)
{
	ds_map_clear(currentUniforms);
	ds_map_clear(currentTextures);
}