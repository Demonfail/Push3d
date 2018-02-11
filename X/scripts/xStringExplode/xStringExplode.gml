/// @func xStringExplode(string, char)
// TODO: Write script documentation.
var a = [];
var i = 0;
var s;
do {
	s = xStringSplitOnFirst(argument0, argument1);
	a[i++] = s[0]; 
	argument0 = s[1];
} until (s[1] == "");
return a;