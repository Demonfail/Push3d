/// @param n View-space normal vector.
/// @return The normal vector encoded into two components.
float2 xEncodeNormal(float3 n) {
	n.y = -n.y;
	float p = sqrt(n.z * 8.0 + 8.0);
	return (n.xy / p + 0.5);
}

/// @param enc View-space normal encoded into two components.
/// @return Decoded normal.
float3 xDecodeNormal(float2 enc) {
	float2 fenc = enc * 4.0 - 2.0;
	float f = dot(fenc, fenc);
	float g = sqrt(1.0 - f * 0.25);
	float3 n;
	n.xy = fenc * g;
	n.z = 1.0 - f * 0.5;
	return n;
}