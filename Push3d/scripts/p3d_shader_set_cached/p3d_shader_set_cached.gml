/// @func p3d_shader_set_cached(shader)
var _shader = argument0;
if (_shader == shader_current())
{
	return 0;
}
p3d_shader_reset_cached();
shader_set(_shader);
if (ds_map_exists(P3dObjRenderCache.shaderOnSet, argument0))
{
	script_execute(P3dObjRenderCache.shaderOnSet[? argument0]);
}