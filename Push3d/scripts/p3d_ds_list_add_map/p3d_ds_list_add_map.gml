/// @func p3d_ds_list_add_map(list, map)
/// @desc Adds the map into the list.
/// @param {real} list The list to add into.
/// @param {real} map  The map to be added.
ds_list_add(argument0, argument1);
ds_list_mark_as_map(argument0, ds_list_size(argument0) - 1);