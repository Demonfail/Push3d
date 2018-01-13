/// @func xVec4Create(x, y, z, w)
/// @desc Creates a new vector with given components.
/// @param {real} x The first vector component.
/// @param {real} y The second vector component.
/// @param {real} z The third vector component.
/// @param {real} w The fourth vector component.
/// @return {array} The created vector.
/// @note One could also just write `[x, y, z, w]`,
///       which would give the same result.
gml_pragma("forceinline");
return [argument0, argument1, argument2, argument3];