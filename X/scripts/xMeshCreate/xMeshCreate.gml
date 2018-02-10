/// @func xMeshCreate()
/// @desc Creates an empty mesh.
/// @return {real} The id of the ds_map containing mesh data.
var _mesh = ds_map_create();

var _vertex = ds_list_create();  // [vX, vY, vZ, ...]
var _face = ds_list_create();    // [{vertex, normal, texture, etc.}, ...]
//var _normal = ds_list_create();  // [nX, nY, nZ, ...]
//var _texture = ds_list_create(); // [tX, tY, ...]

ds_map_add_list(_mesh, "vertex", _vertex);
ds_map_add_list(_mesh, "face", _face);
//ds_map_add_list(_mesh, "normal", _normal);
//ds_map_add_list(_mesh, "texture", _texture);

return _mesh;