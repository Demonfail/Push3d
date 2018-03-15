/// @func xXmlRead(fileName)
/// @desc Reads the XML formatted file and stores
///       the contained data into a tree of elements.
/// @param {string} fileName The name of the XML formatted file.
/// @return {real} The root element of the tree on success or noone on fail.
var _file = file_bin_open(argument0, 0);

if (_file == -1)
{
	return noone;
}

enum xEXmlChars
{
	Null  = 0,
	LF    = 10, // Line feed
	CR    = 13, // Carriage return
	Space = 32,
	EM    = 33, // Exclamation mark 
	DQ    = 34, // Double quote
	SQ    = 39, // Single quote
	Slash = 47,
	LT    = 60, // Less than
	Equal = 61,
	GT    = 62, // Greater than
	QM    = 63  // Question mark
};

var _filePos = 0;
var _fileSize = file_bin_size(_file);
var _byte = xEXmlChars.Space;
var _lastByte;
var _isSeparator = true;
var _token = "";
var _isString = false;
var _attributeName = "";
var _root = noone;
var _element = noone;
var _lastElement = noone;
var _parentElement = noone;
var _isClosing = false;
var _isComment = false;

do
{
	// Read byte from file
	_lastByte = _byte;
	_byte = file_bin_read_byte(_file);

	// Process byte
	_isSeparator = true;

	switch (_byte)
	{
		// Start of new element
		case xEXmlChars.LT:
			if (_element != noone)
			{
				if (_root != noone)
				{
					xXmlElementDestroy(_root);
				}
				show_debug_message("ERROR: Unexpected symbol '<' at " + string(_filePos) + "!");
				return noone;
			}

			// Set element value
			while (string_byte_at(_token, 1) == 32)
			{
				_token = string_delete(_token, 1, 1);
			}

			if (_token != ""
				&& _parentElement != noone
				&& xXmlElementGetChildCount(_parentElement) == 0)
			{
				xXmlElementSetValue(_parentElement, xXmlParse(_token));
			}

			_element = xXmlElementCreate();
			break;

		// End of element
		case xEXmlChars.GT:
			if (_element == noone)
			{
				if (_root != noone)
				{
					xXmlElementDestroy(_root);
				}
				show_debug_message("ERROR: Unexpected symbol '>' at " + string(_filePos) + "!");
				return noone;
			}

			_lastElement = _element;

			if (_root == noone && !_isComment)
			{
				_root = _element;
			}

			if (_isComment)
			{
				_lastElement = noone;
				ds_map_destroy(_element);
				_isComment = false;
			}
			else if (_lastByte == xEXmlChars.Slash)
			{
				// Self-closing element
				if (_parentElement != noone)
				{
					xXmlElementAddChild(_parentElement, _element);
				}
			}
			else if (_isClosing)
			{
				// If the element is not self-closing and it does not
				// have a value defined, then set its value to an empty string.
				if (is_undefined(xXmlElementGetValue(_parentElement))
					&& xXmlElementGetChildCount(_parentElement) == 0)
				{
					xXmlElementSetValue(_parentElement, "");
				}
				_parentElement = xXmlElementGetParent(_parentElement);
				_lastElement = noone;
				ds_map_destroy(_element);
				_isClosing = false;
			}
			else
			{
				if (_parentElement != noone)
				{
					xXmlElementAddChild(_parentElement, _element);
				}
				_parentElement = _element;
			}
			_element = noone;
			break;

		// Closing element
		case xEXmlChars.Slash:
			if (_isString || _element == noone)
			{
				_isSeparator = false;
			}
			else if (_lastByte == xEXmlChars.LT)
			{
				_isClosing = true;
			}
			break;

		// Attribute
		case xEXmlChars.Equal:
			if (!_isString)
			{
				if (_token != "")
				{
					_attributeName = _token;
				}
			} else {
				_isSeparator = false;
			}
			break;

		// Start/end of string
		case xEXmlChars.SQ:
		case xEXmlChars.DQ:
			if (_isString == _byte)
			{
				_isString = false;
				// Store attribute
				if (_attributeName != "")
				{
					if (_element != noone)
					{
						xXmlElementSetAttribute(_element, _attributeName, xXmlParse(_token));
					}
					_attributeName = "";
				}
			}
			else if (!_isString)
			{
				_isString = _byte;
			}
			break;

		// Treat as comments
		case xEXmlChars.QM:
			case xEXmlChars.EM:
				if (_lastByte == xEXmlChars.LT)
				{
					_isComment = true;
				}
				else
				{
					_isSeparator = false;
				}
				break;

			default:
				// Whitespace
				if (!_isString && _element != noone
					&& ((_byte > xEXmlChars.Null && _byte <= xEXmlChars.CR)
					|| _byte == xEXmlChars.Space))
				{
					// Do nothing...
				}
				else
				{
					_isSeparator = false;
				}
				break;
	}

	// Process tokens
	if (_isSeparator) {
		// End of token
		if (_token != "")
		{ 
			// Set element name
			if (_element != noone && xXmlElementGetName(_element) == "")
			{
				xXmlElementSetName(_element, _token);
			}
			else if (_lastElement != noone && xXmlElementGetName(_lastElement) == "") {
				xXmlElementSetName(_lastElement, _token);
			}
			_token = "";
		}
	}
	else
	{
		// Build token
		if (_byte > xEXmlChars.Null && _byte <= xEXmlChars.CR)
		{
			_byte = xEXmlChars.Space; // Replace new lines, tabs, etc. with spaces
		}
		_token += chr(_byte);
	}
}
until (++_filePos == _fileSize);

file_bin_close(_file);
return _root;