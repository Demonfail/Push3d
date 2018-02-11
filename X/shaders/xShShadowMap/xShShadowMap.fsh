#pragma include("Common.fsh")
float3 xEncodeDepth(float d) {
	float3 enc = frac(float3(1.0, 255.0, 65025.0) * d);
	return (enc - enc.yzz * (1.0 / 255.0));
}

float xDecodeDepth(float3 c) {
	return dot(c, float3(1.0, 1.0 / 255.0, 1.0 / 65025.0));
}

float3 xProject(float2 tanAspect, float2 texCoord, float depth) {
	// tanAspect = (tanFovY * (screenWidth / screenHeight), -tanFovY)
	// tanFovY = dtan(fov * 0.5)
	return float3(tanAspect * (texCoord * 2.0 - 1.0) * depth, depth);
}
// include("Common.fsh")

struct VS_out {
	float4 Position : SV_POSITION;
	float2 TexCoord : TEXCOORD0;
};

float4 main(in VS_out IN) : SV_TARGET0 {
	float4 base = gm_BaseTextureObject.Sample(gm_BaseTexture, IN.TexCoord);
	if (base.a < 1.0) {
		discard;
	}
	return float4(xEncodeDepth(IN.Position.z).xyz, 1.0);
}