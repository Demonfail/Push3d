/// @func p3d_xml_element_get_parent(element)
/// @desc Gets the parent of the given element.
/// @param {real} element The id of the element.
/// @return {real} The parent of the element or noone, if the element does not
///                have a parent.
gml_pragma("forceinline");
return argument0[? "parent"];