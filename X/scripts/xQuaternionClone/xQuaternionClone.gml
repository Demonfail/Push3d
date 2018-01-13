/// @func xQuaternionClone(v)
/// @desc Creates a clone of the quaternion.
/// @param {array} v The quaternion.
/// @return {array} The created quaternion.
gml_pragma("forceinline");
return [argument0[0], argument0[1], argument0[2], argument0[3]];