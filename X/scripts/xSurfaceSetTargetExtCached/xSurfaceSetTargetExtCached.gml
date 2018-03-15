/// @func xSurfaceSetTargetExtCached(index, id)
var _currentTargets = xORenderCache.currentTargets;
if (!ds_map_exists(_currentTargets, argument0)
	|| _currentTargets[? argument0] != argument1)
{
	surface_set_target_ext(argument0, argument1);
	_currentTargets[? argument0] = argument1;
}