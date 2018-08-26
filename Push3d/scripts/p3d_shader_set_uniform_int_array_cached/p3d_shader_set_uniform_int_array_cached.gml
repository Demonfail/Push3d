/// @func p3d_shader_set_uniform_int_array_cached(uniformId, array)
var _currentUniforms = P3dObjRenderCache.currentUniforms;
if (!ds_map_exists(_currentUniforms, argument0)
	|| typeof(argument0) != typeof(argument1)
	|| !array_equals(_currentUniforms[? argument0], argument1))
{
	shader_set_uniform_i_array(argument0, argument1);
	_currentUniforms[? argument0] = argument1;
}