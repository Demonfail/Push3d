struct VS_out {
	float4 Position : SV_POSITION;
	float2 TexCoord : TEXCOORD0;
};

struct PS_out {
	float4 Target0 : SV_TARGET0;
};

Texture2D texAO       : register(t1); // Ambient occlusion texture (SSAO/HBAO/...)
Texture2D texEmissive : register(t2);
uniform float4 u_fAmbient;            // (r,g,b,intensity)

void main(in VS_out IN, out PS_out OUT) {
	float4 base = gm_BaseTextureObject.Sample(gm_BaseTexture, IN.TexCoord);
	if (base.a < 1.0) {
		discard;
	}
	float4 ambient = float4(u_fAmbient.rgb * u_fAmbient.a, 1.0)
		* texAO.Sample(gm_BaseTexture, IN.TexCoord);
	float4 emissive = texEmissive.Sample(gm_BaseTexture, IN.TexCoord);
	OUT.Target0 = base * (ambient + emissive);
	OUT.Target0.a = 1.0;
}