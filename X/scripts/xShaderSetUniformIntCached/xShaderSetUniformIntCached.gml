/// @func xShaderSetUniformIntCached(uniformId, val)
var _currentUniforms = xORenderCache.currentUniforms;
if (!ds_map_exists(_currentUniforms, argument0)
	|| _currentUniforms[? argument0] != argument1)
{
	shader_set_uniform_i(argument0, argument1);
	_currentUniforms[? argument0] = argument1;
}