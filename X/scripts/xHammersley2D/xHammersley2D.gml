/// @func xHammersley2D(i, n)
/// @desc Gets i-th point from sequence of uniformly distributed points on a unit square.
/// @param {real} i The point index in sequence.
/// @param {real} n The total size of the sequence.
/// @source http://holger.dammertz.org/stuff/notes_HammersleyOnHemisphere.html
var b = (argument1 << 16) | (argument1 >> 16);
b = ((b & 0x55555555) << 1) | ((b & 0xAAAAAAAA) >> 1);
b = ((b & 0x33333333) << 2) | ((b & 0xCCCCCCCC) >> 2);
b = ((b & 0x0F0F0F0F) << 4) | ((b & 0xF0F0F0F0) >> 4);
b = ((b & 0x00FF00FF) << 8) | ((b & 0xFF00FF00) >> 8);
return [
	argument0 / argument1,
	b * 2.3283064365386963 * 0.0000000001
];