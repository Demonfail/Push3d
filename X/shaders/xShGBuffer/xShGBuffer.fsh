#pragma include("Common.fsh")
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

/// @param tanAspect (tanFovY*(screenWidth/screenHeight),-tanFovY), where
///                  tanFovY = dtan(fov*0.5)
/// @param texCoord  Sceen-space UV.
/// @param depth     Scene depth at texCoord.
/// @return Point projected to view-space.
float3 xProject(float2 tanAspect, float2 texCoord, float depth) {
	return float3(tanAspect * (texCoord * 2.0 - 1.0) * depth, depth);
}

/// @param p A point in clip space (transformed by projection matrix, but not
///          normalized).
/// @return P's UV coordinates on the screen.
float2 xUnproject(float4 p) {
	float2 uv = p.xy / p.w;
	uv = uv * 0.5 + 0.5;
	uv.y = 1.0 - uv.y;
	return uv;
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