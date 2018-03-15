/// @func xShadersetUniformMatrixArrayCached(uniformId, array)
var _currentUniforms = xORenderCache.currentUniforms;
if (!ds_map_exists(_currentUniforms, argument0)
	|| !array_equals(_currentUniforms[? argument0], argument1))
{
	shader_set_uniform_matrix_array(argument0, argument1);
	_currentUniforms[? argument0] = argument1;
}