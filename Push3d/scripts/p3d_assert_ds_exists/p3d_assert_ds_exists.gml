/// @func p3d_assert_ds_exists(id, type, msg)
/// @desc Checks if the ds of given id and type exists. If it does not, then
///       aborts the game, showing the error message.
/// @param {real}   id   The id of the ds.
/// @param {real}   type The ds type (`ds_type_map`, `ds_type_list`, ...).
/// @param {string} msg  The error message.
/// @example
/// ```
/// var _map = ds_map_create();
/// p3d_assert_ds_exists(_map, ds_type_map,
///     "This should pass, since we just created it.");
/// ds_map_destroy(_map);
/// p3d_assert_ds_exists(_map, ds_type_map,
///     "This will abort the game just as expected.");
/// ```
if (!ds_exists(argument0, argument1))
{
	show_error(argument2, true);
}