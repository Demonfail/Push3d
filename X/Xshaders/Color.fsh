/// @desc Converts gamma space color to linear space.
float3 xGammaToLinear(float3 rgb)
{
	return pow(abs(rgb), 2.2);
}

/// @desc Converts linear space color to gamma space.
float3 xLinearToGamma(float3 rgb)
{
	return pow(abs(rgb), 1.0 / 2.2);
}

/// @desc Gets color's luminance.
float xLuminance(float3 rgb)
{
	return (0.2126 * rgb.r + 0.7152 * rgb.g + 0.0722 * rgb.b);
}