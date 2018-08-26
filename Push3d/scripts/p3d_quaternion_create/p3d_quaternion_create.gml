/// @func p3d_quaternion_create(x, y, z, w)
/// @desc Creates a quaternion.
/// @param {real} x The x component of the quaternion.
/// @param {real} y The y component of the quaternion.
/// @param {real} z The z component of the quaternion.
/// @param {real} w The w component of the quaternion.
/// @return {array} The created quaternion.
gml_pragma("forceinline");
return [argument0, argument1, argument2, argument3];