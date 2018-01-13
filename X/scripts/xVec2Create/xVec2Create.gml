/// @func xVec2Create(x, y)
/// @desc Creates a new vector with given components.
/// @param {real} x The first vector component.
/// @param {real} y The second vector component.
/// @return {array} The created vector.
/// @note One could also just write `[x, y]`,
///       which would give the same result.
gml_pragma("forceinline");
return [argument0, argument1];