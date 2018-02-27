/// @func xMeshRecalculateTangentW(mesh)
/// @desc Recalculates tangent vectors and bitangent sign for the mesh.
/// @param {real} mesh The id of the mesh.
/// @return {bool} True on success.
var _mesh = argument0;
var _vertex = _mesh[? "vertex"];
var _texture = _mesh[? "texture"];
var _tangent = _mesh[? "tangent"];
var _bitangent = _mesh[? "bitangent"];
var _normal = _mesh[? "normal"];
var _face = _mesh[? "face"];

xAssert(!is_undefined(_texture), "Trying to recalculate TBN for mesh without UVs!");
xAssert(!is_undefined(_normal), "Trying to recalculate TBN for mesh without normals!");

// Clear tangent and bitangent data
if (is_undefined(_tangent))
{
	_tangent = ds_list_create(); // [x, y, z, ...]
	ds_map_add_list(_mesh, "tangent", _tangent);
}
else
{
	ds_list_clear(_tangent);
}

if (is_undefined(_bitangent))
{
	_bitangent = ds_list_create(); // [sign, ...]
	ds_map_add_list(_mesh, "bitangent", _bitangent);
}
else
{
	ds_list_clear(_bitangent);
}

// Calculate tangent and bitangent
// Source: http://www.opengl-tutorial.org/intermediate-tutorials/tutorial-13-normal-mapping/
var _size = ds_list_size(_face);
var i = 0;
var tInd = 0;
var bInd = 0;
var _temp;

while (i < _size)
{
	// First vertex data
	var _f0 = _face[| i++];
	var _v0  = _f0[? "vertex"];
	var _uv0 = _f0[? "texture"];
	var _n0  = _f0[? "normal"];

	// Second vertex data
	var _f1 = _face[| i++];
	var _v1  = _f1[? "vertex"];
	var _uv1 = _f1[? "texture"];
	var _n1  = _f1[? "normal"];

	// Third vertex data
	var _f2 = _face[| i++];
	var _v2  = _f2[? "vertex"];
	var _uv2 = _f2[? "texture"];
	var _n2  = _f2[? "normal"];

	// Edges of the triangle : postion delta
	var _vecV0 = [_vertex[| _v0], _vertex[| _v0+1], _vertex[| _v0+2]];
	var _vecV1 = [_vertex[| _v1], _vertex[| _v1+1], _vertex[| _v1+2]];
	var _vecV2 = [_vertex[| _v1], _vertex[| _v2+1], _vertex[| _v2+2]];

	var _deltaPos1 = xVec3Clone(_vecV1);
	xVec3Subtract(_deltaPos1, _vecV0);

	var _deltaPos2 = xVec3Clone(_vecV2);
	xVec3Subtract(_deltaPos2, _vecV0);

	// UV delta
	var _vecUV0 = [_texture[| _uv0], _texture[| _uv0+1]];
	var _vecUV1 = [_texture[| _uv1], _texture[| _uv1+1]];
	var _vecUV2 = [_texture[| _uv2], _texture[| _uv2+1]];

	var _deltaUV1 = xVec2Clone(_vecUV1);
	xVec2Subtract(_deltaUV1, _vecUV0);

	var _deltaUV2 = xVec2Clone(_vecUV2);
	xVec2Subtract(_deltaUV2, _vecUV0);

	// Compute the tangent and the bitangent vectors
	var _r = 1 / (_deltaUV1[0]*_deltaUV2[1] - _deltaUV1[1]*_deltaUV2[0]);

	var _T = xVec3Clone(_deltaPos1);
	xVec3Scale(_T, _deltaUV2[1]);
	_temp = xVec3Clone(_deltaPos2);
	xVec3Scale(_temp, _deltaUV1[1]);
	xVec3Subtract(_T, _temp);
	xVec3Scale(_T, _r);

	var _B = xVec3Clone(_deltaPos2);
	xVec3Scale(_B, _deltaUV1[0]);
	_temp = xVec3Clone(_deltaPos1);
	xVec3Scale(_temp, _deltaUV2[0]);
	xVec3Subtract(_B, _temp);
	xVec3Scale(_B, _r);

	// Orthogonalize
	var _vecN0 = [_normal[| _n0], _normal[| _n0+1], _normal[| _n0+2]];
	var _vecN1 = [_normal[| _n1], _normal[| _n1+1], _normal[| _n1+2]];
	var _vecN2 = [_normal[| _n2], _normal[| _n2+1], _normal[| _n2+2]];

	var _T0 = xVec3Clone(_T);
	_temp = xVec3Clone(_vecN0);
	xVec3Scale(_temp, xVec3Dot(_temp, _T));
	xVec3Subtract(_T0, _temp);
	xVec3Normalize(_T0);

	var _T1 = xVec3Clone(_T);
	_temp = xVec3Clone(_vecN1);
	xVec3Scale(_temp, xVec3Dot(_temp, _T));
	xVec3Subtract(_T1, _temp);
	xVec3Normalize(_T1);

	var _T2 = xVec3Clone(_T);
	_temp = xVec3Clone(_vecN2);
	xVec3Scale(_temp, xVec3Dot(_temp, _T));
	xVec3Subtract(_T2, _temp);
	xVec3Normalize(_T2);

	var _B0 = xVec3Clone(_B);
	_temp = xVec3Clone(_vecN0);
	xVec3Scale(_temp, xVec3Dot(_temp, _B));
	xVec3Subtract(_B0, _temp);
	xVec3Normalize(_B0);
	_temp = xVec3Clone(_T0);
	xVec3Scale(_temp, xVec3Dot(_temp, _B0));
	xVec3Subtract(_B0, _temp);
	xVec3Normalize(_B0);

	var _B1 = xVec3Clone(_B);
	_temp = xVec3Clone(_vecN1);
	xVec3Scale(_temp, xVec3Dot(_temp, _B));
	xVec3Subtract(_B1, _temp);
	xVec3Normalize(_B1);
	_temp = xVec3Clone(_T1);
	xVec3Scale(_temp, xVec3Dot(_temp, _B1));
	xVec3Subtract(_B1, _temp);
	xVec3Normalize(_B1);

	var _B2 = xVec3Clone(_B);
	_temp = xVec3Clone(_vecN2);
	xVec3Scale(_temp, xVec3Dot(_temp, _B));
	xVec3Subtract(_B2, _temp);
	xVec3Normalize(_B2);
	_temp = xVec3Clone(_T2);
	xVec3Scale(_temp, xVec3Dot(_temp, _B2));
	xVec3Subtract(_B2, _temp);
	xVec3Normalize(_B2);

	// Handedness sign for bitangent
	var _B0s = 1;
	var _B1s = 1;
	var _B2s = 1;

	_temp = xVec3Clone(_vecN0);
	xVec3Cross(_temp, _T0);
	if (xVec3Dot(_temp, _B0) < 0)
	{
		_B0s = -1;
	}

	_temp = xVec3Clone(_vecN1);
	xVec3Cross(_temp, _T1);
	if (xVec3Dot(_temp, _B1) < 0)
	{
		_B1s = -1;
	}

	_temp = xVec3Clone(_vecN2);
	xVec3Cross(_temp, _T2);
	if (xVec3Dot(_temp, _B2) < 0)
	{
		 _B2s = -1;
	}

	// Save data
	ds_list_add(_tangent, _T0[0], _T0[1], _T0[2]);
	ds_list_add(_tangent, _T1[0], _T1[1], _T1[2]);
	ds_list_add(_tangent, _T2[0], _T2[1], _T2[2]);

	ds_list_add(_bitangent, _B0s);
	ds_list_add(_bitangent, _B1s);
	ds_list_add(_bitangent, _B2s);

	_f0[? "tangent"] = tInd;
	_f0[? "bitangent"] = bInd;

	_f1[? "tangent"] = tInd + 3;
	_f1[? "bitangent"] = bInd + 1;

	_f2[? "tangent"] = tInd + 6;
	_f2[? "bitangent"] = bInd + 2;

	tInd += 9;
	bInd += 3;
}

return true;