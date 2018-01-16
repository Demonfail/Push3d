struct VS_out {
	float4 Position : SV_POSITION;
	float3 Normal   : NORMAL0;
	float2 TexCoord : TEXCOORD0;
	float  Depth    : TEXCOORD1;
};

struct PS_out {
	float4 Target0 : SV_TARGET0; // Albedo.rgb
	float4 Target1 : SV_TARGET1; // Normal.xyz
	float4 Target2 : SV_TARGET2; // Depth
};

float3 xEncodeDepth(float d) {
	float3 enc = float3(1.0, 255.0, 65025.0) * d;
	enc = frac(enc);
	enc -= float3(enc.y, enc.z, enc.z)
		* float3(1.0 / 255.0, 1.0 / 255.0, 1.0 / 255.0);
	return enc;
}

void main(in VS_out IN, out PS_out OUT) {	
	OUT.Target0 = gm_BaseTextureObject.Sample(gm_BaseTexture, IN.TexCoord);
	OUT.Target1.rgb = normalize(IN.Normal) * 2.0 - 1.0;
	OUT.Target1.a = 1.0;
	OUT.Target2.rgb = xEncodeDepth(IN.Depth);
	OUT.Target2.a = 1.0;
}