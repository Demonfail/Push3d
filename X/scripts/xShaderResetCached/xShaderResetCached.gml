/// @func xShaderResetCached()
var _shader = shader_current();
if (_shader < 0)
{
	return 0;
}
shader_reset();
xShaderClearCache();
if (ds_map_exists(xORenderCache.shaderOnReset, _shader))
{
	script_execute(xORenderCache.shaderOnReset[? _shader]);
}