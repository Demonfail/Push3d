/// @func xSurfaceResetTargetCached()
var _currentTargets = xORenderCache.currentTargets;
var _empty = ds_map_empty(_currentTargets);
if (!_empty)
{
	ds_map_clear(_currentTargets);
	surface_reset_target();
}