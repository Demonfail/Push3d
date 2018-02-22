struct VS_out {
	float4 Position : SV_POSITION;
	float2 TexCoord : TEXCOORD0;
};

struct PS_out {
	float4 Target0 : SV_TARGET0;
};

Texture2D texAO : register(t1); // Ambient occlusion texture (SSAO/HBAO/...)
uniform float4 u_fAmbient;      // (r,g,b,intensity)

void main(in VS_out IN, out PS_out OUT) {
	OUT.Target0 = gm_BaseTextureObject.Sample(gm_BaseTexture, IN.TexCoord)
		* float4(u_fAmbient.rgb * u_fAmbient.a, 1.0)
		* texAO.Sample(gm_BaseTexture, IN.TexCoord);
}