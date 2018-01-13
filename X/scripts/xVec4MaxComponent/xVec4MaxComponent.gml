/// @func xVec4MaxComponent(v)
/// @desc Gets the largest component of the vector.
/// @param {array} v The vector.
/// @return {real} The vetor's largest component.
/// @example
/// Here the `_max` variable would be equal to `4`.
/// ```
/// var _vec = [1, 2, 3, 4];
/// var _max = xVec3MaxComponent(_vec);
/// ```
gml_pragma("forceinline");
return max(argument0[0], argument0[1], argument0[2], argument0[3]);