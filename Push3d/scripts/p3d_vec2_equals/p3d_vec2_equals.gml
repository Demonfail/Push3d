/// @func p3d_vec2_equals(v1, v2)
/// @desc Gets whether vectors `v1` and `v2` are equal.
/// @param {array} v1 The first vector.
/// @param {array} v2 The second vector.
/// @return {bool} True if the vectors are equal.
gml_pragma("forceinline");
return (argument0[0] == argument1[0]
	&& argument0[1] == argument1[1]);