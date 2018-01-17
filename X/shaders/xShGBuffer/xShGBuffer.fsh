#pragma include("Common.fsh")
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
// include("Common.fsh")

Texture2D texNormal : register(t1);

struct VS_out {
	float4 Position  : SV_POSITION;
	float3 Normal    : NORMAL0;
	float3 Tangent   : TANGENT0;
	float3 Bitangent : BINORMAL0;
	float2 TexCoord  : TEXCOORD0;
	float  Depth     : TEXCOORD1;
};

struct PS_out {
	float4 Target0 : SV_TARGET0; // Albedo.rgb
	float4 Target1 : SV_TARGET1; // Normal.xyz
	float4 Target2 : SV_TARGET2; // Depth
};

void main(in VS_out IN, out PS_out OUT) {
	float3 N = normalize(texNormal.Sample(gm_BaseTexture, IN.TexCoord).xyz * 2.0 - 1.0);
  N = normalize(mul(N, float3x3(IN.Tangent, IN.Bitangent, IN.Normal)));
	OUT.Target0 = gm_BaseTextureObject.Sample(gm_BaseTexture, IN.TexCoord);
	OUT.Target1.rgb = N * 0.5 + 0.5;
	OUT.Target1.a = 1.0;
	OUT.Target2.rgb = xEncodeDepth(IN.Depth);
	OUT.Target2.a = 1.0;
}