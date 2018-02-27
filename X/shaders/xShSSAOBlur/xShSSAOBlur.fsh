//> Size of the noise texture. Must be the same value as in the xSsaoInit script!
#define X_SSAO_NOISE_TEXTURE_SIZE 4

struct VS_out
{
	float4 Position : SV_POSITION;
	float2 TexCoord : TEXCOORD0;
};

struct PS_out
{
	float4 Target0 : SV_TARGET0;
};

uniform float2 u_fTexel; // (1/screenWidth,0) for horizontal blur, (0,1/screenHeight) for vertical

void main(in VS_out IN, out PS_out OUT)
{
	OUT.Target0 = 0.0;
	for (float i = 0.0; i < X_SSAO_NOISE_TEXTURE_SIZE; i += 1.0)
	{
		OUT.Target0 += gm_BaseTextureObject.Sample(gm_BaseTexture, IN.TexCoord + u_fTexel * i);
	}
	OUT.Target0 /= X_SSAO_NOISE_TEXTURE_SIZE;
}