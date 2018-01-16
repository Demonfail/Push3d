Texture2D texNormal    : register(t1);
Texture2D texDepth     : register(t2);
Texture2D texShadowMap : register(t3);

uniform float4x4 u_mInverse;
uniform float4x4 u_mShadowMap;
uniform float    u_fClipFar;
uniform float2   u_fTanAspect;
uniform float3   u_fLightDir;
uniform float4   u_fLightCol; // (r,g,b,intensity)

struct VS_out {
	float4 Position : SV_POSITION;
	float2 TexCoord : TEXCOORD0;
};

struct PS_out {
	float4 Target0 : SV_TARGET0;
};

float xDecodeDepth(float3 c) {
	return dot(c, float3(1.0, 1.0 / 255.0, 1.0 / 65025.0));
}

float3 xProject(float2 texCoord, float depth) {
	return float3(u_fTanAspect * (texCoord * 2.0 - 1.0) * depth, depth);
}

void main(in VS_out IN, out PS_out OUT) {
	float4 base = gm_BaseTextureObject.Sample(gm_BaseTexture, IN.TexCoord);
	if (base.a < 1.0) {
		discard;
	}

	float3 N = normalize(texNormal.Sample(gm_BaseTexture, IN.TexCoord).xyz) * 2.0 - 1.0;
	float depth = xDecodeDepth(texDepth.Sample(gm_BaseTexture, IN.TexCoord).xyz) * u_fClipFar;
	float3 posView = xProject(IN.TexCoord, depth);
	float3 posWorld = mul(u_mInverse, float4(posView, 1.0)).xyz;

	float3 posShadowMap = mul(u_mShadowMap, float4(posWorld, 1.0)).xyz;
	float3 texCoordShadowMap = float3(posShadowMap.xy * 0.5 + 0.5, posShadowMap.z);
	texCoordShadowMap.y = 1.0 - texCoordShadowMap.y;

	/*OUT.Target0 = texShadowMap.Sample(gm_BaseTexture, texCoordShadowMap);
	return;*/

	float3 L = -normalize(u_fLightDir);
	float NdotL = saturate(dot(N, L));
	float4 lightCol;
	lightCol.rgb = u_fLightCol.rgb * u_fLightCol.a * NdotL;
	lightCol.a = 1.0;

	OUT.Target0 = base * lightCol;
}