/// @func xVec2Length(v)
/// @desc Gets length of the vector.
/// @param {array} v The vector.
/// @param {real} The vector's length.
gml_pragma("forceinline");
return sqrt(argument0[0] * argument0[0]
	+ argument0[1] * argument0[1]);