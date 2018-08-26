/// @func p3d_string_join_array(string, array)
/// @desc Joins values in the array putting the string between each two
///       consecutive values.
/// @param {string} string The string to put between two consecutive values.
/// @param {array}  array  An array of values that you want to join.
/// @return {string} The resulting string.
/// @example
/// ```
/// show_message("Numbers: " + p3d_string_join_array(", ", [1, 2, 3, 4]));
/// ```
/// This will show a message saying "Numbers: 1, 2, 3, 4".
var _str = "";
var _size = array_length_1d(argument1);
var i = 0;
for (/**/; i < _size - 1; ++i)
{
	_str += string(argument1[i]) + argument0;
}
_str += string(argument1[i]);
return _str;