/// @func p3d_vec2_min_component(v)
/// @desc Gets the smallest component of the vector.
/// @param {array} v The vector.
/// @return {real} The vetor's smallest component.
/// @example
/// Here the `_min` variable would be equal to `1`.
/// ```
/// var _vec = [1, 2];
/// var _min = p3d_vec2_min_component(_vec);
/// ```
gml_pragma("forceinline");
return min(argument0[0], argument0[1]);