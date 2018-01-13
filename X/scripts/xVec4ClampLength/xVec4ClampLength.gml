/// @func xVec4ClampLength(v, min, max)
/// @desc Clamps vector's length between `min` and `max`.
/// @param {array} v   The vector.
/// @param {real}  min The minimum vector length.
/// @param {real}  max The maximum vector length.
xVec4Normalize(argument0);
xVec4Scale(argument0, clamp(xVec4Length(argument0), argument1, argument2));