/// @func xVec3MinComponent(v)
/// @desc Gets the smallest component of the vector.
/// @param {array} v The vector.
/// @return {real} The vetor's smallest component.
/// @example
/// Here the `_min` variable would be equal to `1`.
/// ```
/// var _vec = [1, 2, 3];
/// var _min = xVec3MinComponent(_vec);
/// ```
gml_pragma("forceinline");
return min(argument0[0], argument0[1], argument0[2]);