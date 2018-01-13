/// @func xVec3ClampLength(v, min, max)
/// @desc Clamps vector's length between `min` and `max`.
/// @param {array} v   The vector.
/// @param {real}  min The minimum vector length.
/// @param {real}  max The maximum vector length.
xVec3Normalize(argument0);
xVec3Scale(argument0, clamp(xVec3Length(argument0), argument1, argument2));