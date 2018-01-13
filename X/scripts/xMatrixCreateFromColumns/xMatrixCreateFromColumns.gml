/// @func xMatrixCreateFromColumns(c0, c1, c2, c3)
/// @desc Creates a matrix with specified columns.
/// @param {array} c0 The first column of the matrix.
/// @param {array} c1 The second column of the matrix.
/// @param {array} c2 The third column of the matrix.
/// @param {array} c3 The fourth column of the matrix.
/// @return {array} The created matrix.
gml_pragma("forceinline");
return [
	argument0[0], argument0[1], argument0[2], argument0[3],
	argument1[0], argument1[1], argument1[2], argument1[3],
	argument2[0], argument2[1], argument2[2], argument2[3],
	argument3[0], argument3[1], argument3[2], argument3[3]
];