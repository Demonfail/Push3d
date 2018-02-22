#pragma include("Common.fsh")
/// @param d Linearized depth to encode.
/// @return Encoded depth.
float3 xEncodeDepth(float d) {
	float3 enc = frac(float3(1.0, 255.0, 65025.0) * d);
	return (enc - enc.yzz * (1.0 / 255.0));
}

/// @param c Encoded depth.
/// @return Docoded linear depth.
float xDecodeDepth(float3 c) {
	return dot(c, float3(1.0, 1.0 / 255.0, 1.0 / 65025.0));
}

/// @param tanAspect (tanFovY*(screenWidth/screenHeight),-tanFovY), where
///                  tanFovY = dtan(fov*0.5)
/// @param texCoord  Sceen-space UV.
/// @param depth     Scene depth at texCoord.
/// @return Point projected to view-space.
float3 xProject(float2 tanAspect, float2 texCoord, float depth) {
	return float3(tanAspect * (texCoord * 2.0 - 1.0) * depth, depth);
}

/// @param p A point in clip space (transformed by projection matrix, but not
///          normalized).
/// @return P's UV coordinates on the screen.
float2 xUnproject(float4 p) {
	float2 uv = p.xy / p.w;
	uv = uv * 0.5 + 0.5;
	uv.y = 1.0 - uv.y;
	return uv;
}
// include("Common.fsh")

Texture2D texNormal    : register(t1);
Texture2D texDepth     : register(t2);
Texture2D texShadowMap : register(t3);

uniform float4x4 u_mInverse;
uniform float4x4 u_mShadowMap;
uniform float    u_fShadowMapArea;
uniform float2   u_fShadowMapTexel; // (1/shadowMapWidth,1/shadowMapHeight)
uniform float    u_fClipFar;
uniform float2   u_fTanAspect;
uniform float3   u_fLightDir;
uniform float4   u_fLightCol;       // (r,g,b,intensity)

struct VS_out {
	float4 Position : SV_POSITION;
	float2 TexCoord : TEXCOORD0;
};

struct PS_out {
	float4 Target0 : SV_TARGET0;
};

// Source: http://codeflow.org/entries/2013/feb/15/soft-shadow-mapping/
float xShadowMapCompare(Texture2D shadowMap, float2 texel, float2 uv, float compareZ) {
	if (uv.x < 0.0 || uv.y < 0.0
		|| uv.x > 1.0 || uv.y > 1.0) {
		return 0.0;
	}
	float2 temp = uv.xy / texel + 0.5;
	float2 f = frac(temp);
	float2 centroidUV = floor(temp) * texel;
	float lb = step(xDecodeDepth(shadowMap.Sample(gm_BaseTexture, centroidUV).xyz), compareZ);
	float lt = step(xDecodeDepth(shadowMap.Sample(gm_BaseTexture, centroidUV + texel * float2(0.0, 1.0)).xyz), compareZ);
	float rb = step(xDecodeDepth(shadowMap.Sample(gm_BaseTexture, centroidUV + texel * float2(1.0, 0.0)).xyz), compareZ);
	float rt = step(xDecodeDepth(shadowMap.Sample(gm_BaseTexture, centroidUV + texel * float2(1.0, 1.0)).xyz), compareZ);
	return lerp(
		lerp(lb, lt, f.y),
		lerp(rb, rt, f.y),
		f.x
	);
}

void main(in VS_out IN, out PS_out OUT) {
	float4 base = gm_BaseTextureObject.Sample(gm_BaseTexture, IN.TexCoord);
	if (base.a < 1.0) {
		discard;
	}

	float shadow = 0.0;
	float3 N = normalize(texNormal.Sample(gm_BaseTexture, IN.TexCoord).xyz * 2.0 - 1.0);
	float3 L = -normalize(u_fLightDir);
	float NdotL = saturate(dot(N, L));
	
	if (NdotL > 0.0) {
		float depth = xDecodeDepth(texDepth.Sample(gm_BaseTexture, IN.TexCoord).xyz) * u_fClipFar;
		float3 posView = xProject(u_fTanAspect, IN.TexCoord, depth);
		float3 posWorld = mul(u_mInverse, float4(posView, 1.0)).xyz;
		float3 posShadowMap = mul(u_mShadowMap, float4(posWorld, 1.0)).xyz;
		posShadowMap.z = posShadowMap.z * 0.5 + 0.5;
		float2 texCoordShadowMap = float2(posShadowMap.xy * 0.5 + 0.5);
		texCoordShadowMap.y = 1.0 - texCoordShadowMap.y;
		float bias = clamp(u_fShadowMapArea * u_fShadowMapTexel * tan(acos(NdotL)) / u_fShadowMapArea, 0.0, 0.125);
		shadow = xShadowMapCompare(texShadowMap, u_fShadowMapTexel, texCoordShadowMap, posShadowMap.z - bias);
		const float lerpRegion = 2.0;
		float shadowLerp = saturate((length(posView) - u_fShadowMapArea * 0.5 + lerpRegion) / lerpRegion);
		shadow = lerp(shadow, 0.0, shadowLerp);
	}

	float4 lightCol;
	lightCol.rgb = u_fLightCol.rgb * u_fLightCol.a * NdotL * (1.0 - shadow);
	lightCol.a = 1.0;

	OUT.Target0 = base * lightCol;
}