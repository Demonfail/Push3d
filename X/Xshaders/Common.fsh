float3 xEncodeDepth(float d) {
	float3 enc = float3(1.0, 255.0, 65025.0) * d;
	enc = frac(enc);
	enc -= float3(enc.y, enc.z, enc.z)
		* float3(1.0 / 255.0, 1.0 / 255.0, 1.0 / 255.0);
	return enc;
}

float xDecodeDepth(float3 c) {
	return dot(c, float3(1.0, 1.0 / 255.0, 1.0 / 65025.0));
}

float3 xProject(float2 tanAspect, float2 texCoord, float depth) {
	// tanAspect = (tanFovY * (screenWidth / screenHeight), -tanFovY), where:
	//   tanFovY = dtan(fov * 0.5)
	return float3(tanAspect * (texCoord * 2.0 - 1.0) * depth, depth);
}