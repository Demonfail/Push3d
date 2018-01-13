/// @func xVec3Create(x, y, z)
/// @desc Creates a new vector with given components.
/// @param {real} x The first vector component.
/// @param {real} y The second vector component.
/// @param {real} z The third vector component.
/// @return {array} The created vector.
/// @note One could also just write `[x, y, z]`,
///       which would give the same result.
gml_pragma("forceinline");
return [argument0, argument1, argument2];