/// @func xMeshCreate()
/// @desc Creates an empty mesh.
/// @return {real} The id of the ds_map containing mesh data.
var _mesh = ds_map_create();

var _vertex = ds_list_create();
ds_map_add_list(_mesh, "vertex", _vertex);  // vX, vY, vZ

var _normal = ds_list_create();
ds_map_add_list(_mesh, "normal", _normal);   // nX, nY, nZ

var _texture = ds_list_create();
ds_map_add_list(_mesh, "texture", _texture); // tX, tY

var _face = ds_list_create();
ds_map_add_list(_mesh, "face", _face);       // v, t, n

return _mesh;