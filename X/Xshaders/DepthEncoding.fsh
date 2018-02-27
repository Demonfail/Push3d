/// @param d Linearized depth to encode.
/// @return Encoded depth.
float3 xEncodeDepth(float d)
{
	float3 enc = frac(float3(1.0, 255.0, 65025.0) * d);
	return (enc - enc.yzz * (1.0 / 255.0));
}

/// @param c Encoded depth.
/// @return Docoded linear depth.
float xDecodeDepth(float3 c)
{
	return dot(c, float3(1.0, 1.0 / 255.0, 1.0 / 65025.0));
}