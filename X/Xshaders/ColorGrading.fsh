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