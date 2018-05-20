/// @func xStringRemovePart(string, startStr, endStr)
/// @desc Removes part beginning with startStr and ending with endStr from the
///       string.
/// @param {string} startStr The start of the part to remove.
/// @param {string} endStr   The end of the part to remove.
/// @param {string} string   The string to remove the part from.
/// @return {string} The string with the given part removed.
var s = string_pos(argument1, argument0);
var e = string_pos(argument2, argument0);
return string_delete(argument0, s, e - s + string_length(argument2));