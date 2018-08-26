/// @func p3d_xml_element_get_attribute_count(element)
/// @desc Gets the number of attributes of the given element.
/// @param {real} element The id of the element.
/// @return {real} The number of attributes of the given element.
gml_pragma("forceinline");
return ds_map_size(argument0[? "attributes"]);