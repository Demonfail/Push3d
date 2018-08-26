/// @func p3d_xml_element_get_child_count(element)
/// @desc Gets number of children of the given element.
/// @param {real} element The id of the element.
/// @return {real} Number of children of the given element.
gml_pragma("forceinline");
return ds_list_size(argument0[? "children"]);