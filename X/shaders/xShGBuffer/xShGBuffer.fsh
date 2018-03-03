#pragma include("DepthEncoding.fsh")
/// @param d Linearized depth to encode.
/// @return Encoded depth.
float3 xEncodeDepth(float d)
{
	const float inv255 = 1.0 / 255.0;
	float3 enc;
	enc.x = d;
	enc.y = d * 255.0;
	enc.z = enc.y * 255.0;
	enc = frac(enc);
	float temp = enc.z * inv255;
	enc.x -= enc.y * inv255;
	enc.y -= temp;
	enc.z -= temp;
	return enc;
}

/// @param c Encoded depth.
/// @return Docoded linear depth.
float xDecodeDepth(float3 c)
{
	const float inv255 = 1.0 / 255.0;
	return c.x + c.y*inv255 + c.z*inv255*inv255;
}
// include("DepthEncoding.fsh")
#pragma include("Projecting.fsh")
/// @param tanAspect (tanFovY*(screenWidth/screenHeight),-tanFovY), where
///                  tanFovY = dtan(fov*0.5)
/// @param texCoord  Sceen-space UV.
/// @param depth     Scene depth at texCoord.
/// @return Point projected to view-space.
float3 xProject(float2 tanAspect, float2 texCoord, float depth)
{
	return float3(tanAspect * (texCoord * 2.0 - 1.0) * depth, depth);
}

/// @param p A point in clip space (transformed by projection matrix, but not
///          normalized).
/// @return P's UV coordinates on the screen.
float2 xUnproject(float4 p)
{
	float2 uv = p.xy / p.w;
	uv = uv * 0.5 + 0.5;
	uv.y = 1.0 - uv.y;
	return uv;
}
// include("Projecting.fsh")

#define texAlbedo gm_BaseTextureObject
Texture2D texNormal   : register(t1);
Texture2D texEmissive : register(t2);

struct VS_out
{
	float4 Position  : SV_POSITION;
	float3 Normal    : NORMAL0;
	float3 Tangent   : TANGENT0;
	float3 Bitangent : BINORMAL0;
	float2 TexCoord  : TEXCOORD0;
	float  Depth     : TEXCOORD1;
};

struct PS_out
{
	float4 Albedo   : SV_TARGET0;
	float4 Normal   : SV_TARGET1;
	float4 Depth    : SV_TARGET2;
	float4 Emissive : SV_TARGET3;
};

void main(in VS_out IN, out PS_out OUT)
{
	float4 base = texAlbedo.Sample(gm_BaseTexture, IN.TexCoord);
	if (base.a < 1.0)
	{
		discard;
	}
	float3 N = normalize(texNormal.Sample(gm_BaseTexture, IN.TexCoord).xyz * 2.0 - 1.0);
	N.y = -N.y;
	N = normalize(mul(N, float3x3(IN.Tangent, IN.Bitangent, IN.Normal)));
	OUT.Albedo = base;
	OUT.Normal.rgb = N * 0.5 + 0.5;
	OUT.Normal.a = 1.0;
	OUT.Depth.rgb = xEncodeDepth(IN.Depth);
	OUT.Depth.a = 1.0;
	OUT.Emissive = texEmissive.Sample(gm_BaseTexture, IN.TexCoord);
}