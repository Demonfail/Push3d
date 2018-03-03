/// @param color The original RGB color.
/// @param lut   Texture of color-grading lookup tables.
/// @param index The index of the lut to use.
float3 xColorGrade(float3 color, Texture2D lut, float index)
{
	// float2 size = 16.0;
	// float2 texel = 1.0 / 256.0;
	// float2 tile = (size - 1.0) * texel; 
	// float2 uv = color.xy * tile;
	// uv.y += index * size.y * texel.y;
	// float z0 = floor(color.b * (size.x - 1.0));
	// float z1 = z0 + 1.0;
	// z0 *= size.x * texel.x;
	// z1 *= size.x * texel.x;
	// float zOffset = frac(color.b * (size.x - 1.0));
	// return lerp(
	// 	lut.Sample(gm_BaseTexture, uv.xy + float2(z0, 0.0) + 0.5 * texel).rgb,
	// 	lut.Sample(gm_BaseTexture, uv.xy + float2(z1, 0.0) + 0.5 * texel).rgb,
	// 	zOffset);
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