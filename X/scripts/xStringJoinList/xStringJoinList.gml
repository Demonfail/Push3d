/// @func xStringJoinList(string, list)
/// @desc Joins values in the list putting the string between each two
///       consecutive values.
/// @param {string} string The string to put between two consecutive values.
/// @param {real}   list   The id of the list of values that you want to join.
/// @return {string} The resulting string.
/// @example
/// ```
/// var _numbers = ds_list_create();
/// ds_list_add(_numbers, 1, 2, 3, 4);
/// show_message("Numbers: " + xStringJoinList(", ", _numbers));
/// ```
/// This will show a message saying "Numbers: 1, 2, 3, 4".
var _str = "";
var _size = ds_list_size(argument1);
var i = 0;
for (/**/; i < _size - 1; ++i)
{
	_str += string(argument1[| i]) + argument0;
}
_str += string(argument1[| i]);
return _str;