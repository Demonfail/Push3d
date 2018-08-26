/// @func p3d_mesh_load_json(file)
/// @desc Loads a mesh from a JSON formatted file.
/// @param {string} file The file to load the mesh from.
/// @return {real} The id of the mesh on success or `noone` on fail.
var _file = file_text_open_read(argument0);
if (_file == -1)
{
	return noone;
}
var _str = "";
while (!file_text_eof(_file))
{
	_str += file_text_read_string(_file);
	file_text_readln(_file);
}
file_text_close(_file);
return json_decode(_str);