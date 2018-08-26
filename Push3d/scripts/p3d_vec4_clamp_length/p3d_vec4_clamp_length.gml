/// @func p3d_vec4_clamp_length(v, min, max)
/// @desc Clamps vector's length between `min` and `max`.
/// @param {array} v   The vector.
/// @param {real}  min The minimum vector length.
/// @param {real}  max The maximum vector length.
p3d_vec4_normalize(argument0);
p3d_vec4_scale(argument0, clamp(p3d_vec4_length(argument0), argument1, argument2));