/// @func xMatrixCreate(m00, m01, m02, m03, m10, m11, m12, m13, m20, m21, m22, m23, m30, m31, m32, m33)
/// @desc Creates a matrix with given components.
/// @param {real} m00..m03 The first row of the matrix.
/// @param {real} m10..m13 The second row of the matrix.
/// @param {real} m20..m23 The third row of the matrix.
/// @param {real} m30..m33 The fourth row of the matrix.
/// @return {array} The created matrix.
gml_pragma("forceinline");
return [
	argument0, argument4, argument8,  argument12,
	argument1, argument5, argument9,  argument13,
	argument2, argument6, argument10, argument14,
	argument3, argument7, argument11, argument15
];