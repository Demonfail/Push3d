#pragma include("ColorGrading.fsh")
/// @param color The original RGB color.
/// @param lut   Texture of color-grading lookup tables.
/// @param index The index of the lut to use.
float3 xColorGrade(float3 color, Texture2D lut, float index)
{
	float2 uv;
	uv.x = color.x*0.05859375;
	uv.y = color.y*0.05859375 + index*0.0625;
	float b15 = color.b*15.0;
	float z0 = floor(b15)*0.0625;
	float z1 = z0 + 0.0625;
	float2 uv2 = uv + 0.001953125;
	return lerp(
		lut.Sample(gm_BaseTexture, uv2 + float2(z0, 0.0)).rgb,
		lut.Sample(gm_BaseTexture, uv2 + float2(z1, 0.0)).rgb,
		frac(b15));
}
// include("ColorGrading.fsh")
#pragma include("ChromaticAberration.fsh")
/// @param direction  Direction of distortion.
/// @param distortion Per-channel distortion factor.
/// @source http://john-chapman-graphics.blogspot.cz/2013/02/pseudo-lens-flare.html
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
uniform float2 u_vTexel;
uniform float  u_fDistortion;

void main(in VS_out IN, out PS_out OUT)
{
	float2 vec = 0.5 - IN.TexCoord;
	float3 distortion = float3(-u_vTexel.x, 0.0, u_vTexel.x) * u_fDistortion * min(length(vec) / 0.5, 1.0);
	float3 base = xChromaticAberration(gm_BaseTextureObject, IN.TexCoord, normalize(vec), distortion);
	OUT.Target0.rgb = xColorGrade(base, texLUT, u_fLUTIndex);
	OUT.Target0.a = 1.0;
}