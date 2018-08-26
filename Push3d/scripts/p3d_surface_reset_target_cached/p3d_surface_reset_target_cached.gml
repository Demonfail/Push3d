/// @func p3d_surface_reset_target_cached()
var _currentTargets = P3dObjRenderCache.currentTargets;
var _empty = ds_map_empty(_currentTargets);
if (!_empty)
{
	ds_map_clear(_currentTargets);
	surface_reset_target();
}