/// @func p3d_matrix_create_from_rows(r0, r1, r2, r3)
/// @desc Creates a matrix with specified rows.
/// @param {array} r0 The first row of the matrix.
/// @param {array} r1 The second row of the matrix.
/// @param {array} r2 The third row of the matrix.
/// @param {array} r3 The fourth row of the matrix.
/// @return {array} The created matrix.
gml_pragma("forceinline");
return [
	argument0[0], argument1[0], argument2[0], argument3[0],
	argument0[1], argument1[1], argument2[1], argument3[1],
	argument0[2], argument1[2], argument2[2], argument3[2], 
	argument0[3], argument1[3], argument2[3], argument3[3]
];