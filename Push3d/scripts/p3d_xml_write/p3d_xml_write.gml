/// @func p3d_xml_write(rootElement)
/// @desc Writes the tree of elements into a string.
/// @param {real} rootElement The root element of the tree.
/// @return {string} The string.
var _element        = argument[0];
var _name           = p3d_xml_element_get_name(_element);
var _attributeCount = p3d_xml_element_get_attribute_count(_element);
var _childCount     = p3d_xml_element_get_child_count(_element);
var _value          = p3d_xml_element_get_value(_element);
var _indent         = 0;

if (argument_count == 2)
{
	_indent = argument[1];
}

var _spaces = string_repeat(" ", _indent * 2);

// Open element
var _string = _spaces + "<" + _name;

// Attributes
var _attribute = p3d_xml_element_find_first_attribute(_element);

repeat (_attributeCount)
{
	_string += " " + string(_attribute) + "=\""
		+ p3d_xml_string(p3d_xml_element_get_attribute(_element, _attribute))
		+ "\"";
	_attribute = p3d_xml_element_find_next_attribute(_element, _attribute);
}

if (_childCount == 0 && is_undefined(_value))
{
	_string += "/";
}

_string += ">";

if (_childCount != 0 || is_undefined(_value))
{
	_string += chr(10);
}

// Children
for (var i = 0; i < _childCount; ++i)
{
	var _childElement = p3d_xml_element_get_child(_element, i);
	_string += p3d_xml_write(_childElement, _indent + 1);
}

// Close element
if (_childCount != 0)
{
	_string += _spaces + "</" + p3d_xml_element_get_name(_element) + ">" + chr(10);
}
else if (!is_undefined(_value))
{
	_string += p3d_xml_string(_value);
	_string += "</" + p3d_xml_element_get_name(_element) + ">" + chr(10);
}

return _string;