/// @func xVec2Dot(v1, v2)
/// @desc Gets the dot product of vectors `v1` and `v2`.
/// @param {array} v1 The first vector.
/// @param {array} v2 The second vector.
/// @return {real} The dot product.
gml_pragma("forceinline");
return (argument0[0] * argument1[0]
	+ argument0[1] * argument1[1]);