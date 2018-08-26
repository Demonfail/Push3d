/// @func p3d_vec2_max_component(v)
/// @desc Gets the largest component of the vector.
/// @param {array} v The vector.
/// @return {real} The vetor's largest component.
/// @example
/// Here the `_max` variable would be equal to `2`.
/// ```
/// var _vec = [1, 2];
/// var _max = p3d_vec2_max_component(_vec);
/// ```
gml_pragma("forceinline");
return max(argument0[0], argument0[1]);