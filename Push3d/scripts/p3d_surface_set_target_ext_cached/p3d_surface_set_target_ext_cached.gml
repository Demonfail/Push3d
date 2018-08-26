/// @func p3d_surface_set_target_ext_cached(index, id)
var _currentTargets = P3dObjRenderCache.currentTargets;
if (!ds_map_exists(_currentTargets, argument0)
	|| _currentTargets[? argument0] != argument1)
{
	surface_set_target_ext(argument0, argument1);
	_currentTargets[? argument0] = argument1;
}