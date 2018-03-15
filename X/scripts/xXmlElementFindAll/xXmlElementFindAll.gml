/// @func xXmlElementFindAll(rootElement, name)
/// @desc Finds all elements with given name in the given tree of elements.
/// @param {real}   rootElement The root element of the tree.
/// @param {string} name        The name of elements to be found.
/// @return {real} A ds_list containing all found elements.
var _element = argument[0];
var _name = argument[1];
var _list = noone;
if (argument_count == 2)
{
	_list = ds_list_create();
}
else
{
	_list = argument[2];
}
if (xXmlElementGetName(_element) == _name)
{
	ds_list_add(_list, _element);
}
var _numOfChildElements = xXmlElementGetChildCount(_element);
for (var i = 0; i < _numOfChildElements; ++i)
{
	xXmlElementFindAll(xXmlElementGetChild(_element, i), _name, _list);
}
return _list;