/// @func xVec4Transform(v, m)
/// @desc TODO
/// @param {array} v TODO
/// @param {array} m TODO
var _x = argument1[ 0]*argument0[0] + argument1[ 4]*argument0[1] + argument1[ 8]*argument0[2] + argument1[12]*argument0[3];
var _y = argument1[ 1]*argument0[0] + argument1[ 5]*argument0[1] + argument1[ 9]*argument0[2] + argument1[13]*argument0[3];
var _z = argument1[ 2]*argument0[0] + argument1[ 6]*argument0[1] + argument1[10]*argument0[2] + argument1[14]*argument0[3];
var _w = argument1[ 3]*argument0[0] + argument1[ 7]*argument0[1] + argument1[11]*argument0[2] + argument1[15]*argument0[3];
argument0[@ 0] = _x;
argument0[@ 1] = _y;
argument0[@ 2] = _z;
argument0[@ 3] = _w;