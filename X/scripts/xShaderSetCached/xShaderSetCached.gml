/// @func xShaderSetCached(shader)
var _shader = argument0;
if (_shader == shader_current())
{
	return 0;
}
xShaderResetCached();
shader_set(_shader);
if (ds_map_exists(xORenderCache.shaderOnSet, argument0))
{
	script_execute(xORenderCache.shaderOnSet[? argument0]);
}