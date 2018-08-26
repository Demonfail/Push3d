/// @func p3d_string_join(string, values...)
/// @desc Joins given values together putting the string between each
///       consecutive two.
/// @param {string} string The string to put between two consecutive values.
/// @param {any}    values Any number of values to be joined.
/// @return {string} The resulting string.
/// @example
/// ```
/// show_debug_message(
///   p3d_string_join(" ", "Player", player.name, "took", _damage, "damage!")
/// );
/// ```
/// This could show a debug message saying "Player Patrik took 60 damage!".
var _str = "";
var i = 1;
for (/**/; i < argument_count - 1; ++i)
{
	_str += string(argument[i]) + argument[0];
}
_str += string(argument[i]);
return _str;