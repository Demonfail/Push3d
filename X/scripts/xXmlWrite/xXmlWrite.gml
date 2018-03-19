/// @func xXmlWrite(rootElement)
/// @desc Writes the tree of elements into a string.
/// @param {real} rootElement The root element of the tree.
/// @return {string} The string.
var _element        = argument[0];
var _name           = xXmlElementGetName(_element);
var _attributeCount = xXmlElementGetAttributeCount(_element);
var _childCount     = xXmlElementGetChildCount(_element);
var _value          = xXmlElementGetValue(_element);
var _indent         = 0;

if (argument_count == 2)
{
	_indent = argument[1];
}

var _spaces = string_repeat(" ", _indent * 2);

// Open element
var _string = _spaces + "<" + _name;

// Attributes
var _attribute = xXmlElementFindFirstAttribute(_element);

repeat (_attributeCount)
{
	_string += " " + string(_attribute) + "=\""
		+ xXmlString(xXmlElementGetAttribute(_element, _attribute))
		+ "\"";
	_attribute = xXmlElementFindNextAttribute(_element, _attribute);
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
	var _childElement = xXmlElementGetChild(_element, i);
	_string += xXmlWrite(_childElement, _indent + 1);
}

// Close element
if (_childCount != 0)
{
	_string += _spaces + "</" + xXmlElementGetName(_element) + ">" + chr(10);
}
else if (!is_undefined(_value))
{
	_string += xXmlString(_value);
	_string += "</" + xXmlElementGetName(_element) + ">" + chr(10);
}

return _string;