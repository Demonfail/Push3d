/// @func p3d_xml_element_find(rootElement, name)
/// @desc Finds the first element with given name in the given tree of elements.
/// @param {real}   rootElement The root element of the tree.
/// @param {string} name        The name of the element to be found.
/// @return {real} The id of the found element or noone, if no such element has
///                been found.
var _element = argument0;
var _name    = argument1;
if (p3d_xml_element_get_name(_element) == _name)
{
	return _element;
}
var _numOfChildElements = p3d_xml_element_get_child_count(_element);
for (var i = 0; i < _numOfChildElements; ++i)
{
	var _foundElement = p3d_xml_element_find(p3d_xml_element_get_child(_element, i), _name);
	if (_foundElement != noone)
	{
		return _foundElement;
	}
}
return noone;