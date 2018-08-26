/// @func p3d_ds_list_add_list(l1, l2)
/// @desc Adds the list l2 into the list l1.
/// @param {real} l1 The list to add into.
/// @param {real} l2 The list to be added.
ds_list_add(argument0, argument1);
ds_list_mark_as_list(argument0, ds_list_size(argument0) - 1);