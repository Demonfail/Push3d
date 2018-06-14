/// @func xStringTrim(str)
/// @desc Removes leading and trailing whitespace from the string.
/// @param {string} str The string to remove the whitespace from.
/// @return {string} The resulting string.
var str = argument0;
var ch;
var i = 0;
do 
{
	ch = string_char_at(str, 1 + (i++));
}
until (ch != " " && ch != "\t" && ch != "\n");
str = string_delete(str, 1, i - 1);

i = string_length(str);
do
{
	ch = string_char_at(str, i--);
}
until (ch != " " && ch != "\t" && ch != "\n");
str = string_delete(str, i + 2, string_length(str) - i);
return str;