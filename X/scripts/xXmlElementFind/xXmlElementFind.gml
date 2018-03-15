/// @func xXmlElementFind(rootElement, name)
/// @desc Finds the first element with given name
///       in the given tree of elements.
/// @param {real}   rootElement The root element of the tree.
/// @param {string} name        The name of the element to be found.
/// @return {real} The id of the found element or noone,
///                if no such element has been found.
var _element = argument0;
var _name = argument1;
if (xXmlElementGetName(_element) == _name)
{
	return _element;
}
var _numOfChildElements = xXmlElementGetChildCount(_element);
for (var i = 0; i < _numOfChildElements; ++i)
{
	var _foundElement = xXmlElementFind(xXmlElementGetChild(_element, i), _name);
	if (_foundElement != noone)
	{
		return _foundElement;
	}
}
return noone;