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

struct VS_out
{
	float4 Position : SV_POSITION;
	float2 TexCoord : TEXCOORD0;
};

float4 main(in VS_out IN) : SV_TARGET0
{
	float4 base = gm_BaseTextureObject.Sample(gm_BaseTexture, IN.TexCoord);
	if (base.a < 1.0)
	{
		discard;
	}
	return float4(xEncodeDepth(IN.Position.z).xyz, 1.0);
}