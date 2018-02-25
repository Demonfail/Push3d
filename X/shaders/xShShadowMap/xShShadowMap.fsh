#pragma include("DepthEncoding.fsh")
/// @param d Linearized depth to encode.
/// @return Encoded depth.
float3 xEncodeDepth(float d) {
	float3 enc = frac(float3(1.0, 255.0, 65025.0) * d);
	return (enc - enc.yzz * (1.0 / 255.0));
}

/// @param c Encoded depth.
/// @return Docoded linear depth.
float xDecodeDepth(float3 c) {
	return dot(c, float3(1.0, 1.0 / 255.0, 1.0 / 65025.0));
}
// include("DepthEncoding.fsh")

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