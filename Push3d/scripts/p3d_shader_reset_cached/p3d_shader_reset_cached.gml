/// @func p3d_shader_reset_cached()
var _shader = shader_current();
if (_shader < 0)
{
	return 0;
}
shader_reset();
p3d_shader_clear_cache();
if (ds_map_exists(P3dObjRenderCache.shaderOnReset, _shader))
{
	script_execute(P3dObjRenderCache.shaderOnReset[? _shader]);
}