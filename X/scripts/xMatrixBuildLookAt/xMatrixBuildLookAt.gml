/// @func xMatrixBuildLookAt(from, to, up)
/// @desc Builds a look-at matrix from given vec3.
/// @param {array} from Camera's position vector.
/// @param {array} to   Camera's target position.
/// @param {array} up   Camera's up vector.
/// @return {array} The created matrix.
gml_pragma("forceinline");
return matrix_build_lookat(
	argument0[0], argument0[1], argument0[2],
	argument1[0], argument1[1], argument1[2],
	argument2[0], argument2[1], argument2[2]
);