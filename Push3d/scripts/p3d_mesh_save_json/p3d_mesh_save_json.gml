/// @func p3d_mesh_save_json(mesh, file)
/// @desc Saves the mesh into a JSON formatted file.
/// @param {real}   mesh The id of the mesh.
/// @param {string} file The file to save the mesh to.
/// @return {bool} True on success.
var _file = file_text_open_write(argument1);
if (_file == -1)
{
	return false;
}
file_text_write_string(_file, json_encode(argument0));
file_text_close(_file);
return true;