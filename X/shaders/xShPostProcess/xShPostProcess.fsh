#pragma include("ColorGrading.fsh")
/// @param color The original RGB color.
/// @param lut   Texture of color-grading lookup tables.
/// @param index The index of the lut to use.
float3 xColorGrade(float3 color, Texture2D lut, float index)
{
	float2 size = 16.0;
	float2 texel = 1.0 / 256.0;
	float2 tile = (size - 1.0) * texel; 
	float2 uv = color.xy * tile;
	uv.y += index * size.y * texel.y;
	float z0 = floor(color.b * (size.x - 1.0));
	float z1 = z0 + 1.0;
	z0 *= size.x * texel.x;
	z1 *= size.x * texel.x;
	float zOffset = frac(color.b * (size.x - 1.0));
	return lerp(
		lut.Sample(gm_BaseTexture, uv.xy + float2(z0, 0.0) + 0.5 * texel).rgb,
		lut.Sample(gm_BaseTexture, uv.xy + float2(z1, 0.0) + 0.5 * texel).rgb,
		zOffset);
}
// include("ColorGrading.fsh")
#pragma include("ChromaticAberration.fsh")
// Source: http://john-chapman-graphics.blogspot.cz/2013/02/pseudo-lens-flare.html
/// @param direction  Direction of distortion.
/// @param distortion Per-channel distortion factor.
float3 xChromaticAberration(
	Texture2D tex,
	float2 uv, 
	float2 direction,
	float3 distortion)
{
	return float3(
		tex.Sample(gm_BaseTexture, uv + direction * distortion.r).r,
		tex.Sample(gm_BaseTexture, uv + direction * distortion.g).g,
		tex.Sample(gm_BaseTexture, uv + direction * distortion.b).b);
}
// include("ChromaticAberration.fsh")

struct VS_out
{
	float4 Position : SV_POSITION;
	float2 TexCoord : TEXCOORD0;
};

struct PS_out
{
	float4 Target0 : SV_TARGET0;
};

Texture2D texLUT : register(t1);

uniform float  u_fLUTIndex;
uniform float2 u_fTexel;
uniform float  u_fDistortion;

void main(in VS_out IN, out PS_out OUT)
{
	float2 vec = 0.5 - IN.TexCoord;
	float3 distortion = float3(-u_fTexel.x, 0.0, u_fTexel.x) * u_fDistortion * min(length(vec) / 0.5, 1.0);
	float3 base = xChromaticAberration(gm_BaseTextureObject, IN.TexCoord, normalize(vec), distortion);
	OUT.Target0.rgb = xColorGrade(base, texLUT, u_fLUTIndex);
	OUT.Target0.a = 1.0;
}