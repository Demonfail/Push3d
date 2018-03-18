/// @func xMatrixToEuler(m)
/// @desc Gets euler angles from the YXZ rotation matrix.
/// @param {array} m The YXZ rotation matrix.
/// @return {array} An array containing the euler angles `[rotX, rotY, rotZ]`.
/// @source https://www.geometrictools.com/Documentation/EulerAngles.pdf
var _thetaX, _thetaY, _thetaZ;

if (argument0[6] < 1)
{
	if (argument0[6] > -1)
	{
		_thetaX = arcsin(-argument0[6]);
		_thetaY = arctan2(argument0[2], argument0[10]);
		_thetaZ = arctan2(argument0[4], argument0[5]);
	}
	else
	{
		_thetaX = pi * 0.5;
		_thetaY = -arctan2(-argument0[1], argument0[0]);
		_thetaZ = 0;
	}
}
else
{
	_thetaX = -pi * 0.5;
	_thetaY = arctan2(-argument0[1], argument0[0]);
	_thetaZ = 0;
}

return [
	radtodeg(_thetaX) mod 360,
	radtodeg(_thetaY) mod 360,
	radtodeg(_thetaZ) mod 360
];