#pragma include("DepthEncoding.fsh")
/// @param d Linearized depth to encode.
/// @return Encoded depth.
float3 xEncodeDepth(float d)
{
	const float inv255 = 1.0 / 255.0;
	float3 enc;
	enc.x = d;
	enc.y = d * 255.0;
	enc.z = enc.y * 255.0;
	enc = frac(enc);
	float temp = enc.z * inv255;
	enc.x -= enc.y * inv255;
	enc.y -= temp;
	enc.z -= temp;
	return enc;
}

/// @param c Encoded depth.
/// @return Docoded linear depth.
float xDecodeDepth(float3 c)
{
	const float inv255 = 1.0 / 255.0;
	return c.x + c.y*inv255 + c.z*inv255*inv255;
}
// include("DepthEncoding.fsh")
#pragma include("Projecting.fsh")
/// @param tanAspect (tanFovY*(screenWidth/screenHeight),-tanFovY), where
///                  tanFovY = dtan(fov*0.5)
/// @param texCoord  Sceen-space UV.
/// @param depth     Scene depth at texCoord.
/// @return Point projected to view-space.
float3 xProject(float2 tanAspect, float2 texCoord, float depth)
{
	return float3(tanAspect * (texCoord * 2.0 - 1.0) * depth, depth);
}

/// @param p A point in clip space (transformed by projection matrix, but not
///          normalized).
/// @return P's UV coordinates on the screen.
float2 xUnproject(float4 p)
{
	float2 uv = p.xy / p.w;
	uv = uv * 0.5 + 0.5;
	uv.y = 1.0 - uv.y;
	return uv;
}
// include("Projecting.fsh")

Texture2D texNormal    : register(t1);
Texture2D texDepth     : register(t2);
Texture2D texShadowMap : register(t3);

uniform float4x4 u_mInverse;
uniform float4x4 u_mShadowMap;
uniform float    u_fShadowMapArea;
uniform float2   u_fShadowMapTexel; // (1/shadowMapWidth,1/shadowMapHeight)
uniform float    u_fClipFar;
uniform float2   u_vTanAspect;
uniform float3   u_fLightDir;
uniform float4   u_fLightCol;       // (r,g,b,intensity)
uniform float3   u_fCamPos;         // Camera's (x,y,z) position in world space.

struct VS_out
{
	float4 Position : SV_POSITION;
	float2 TexCoord : TEXCOORD0;
};

struct PS_out
{
	float4 Total    : SV_TARGET0; // Sum of diffuse and specular light.
	float4 Specular : SV_TARGET1; // Specular light only.
};

/// @source http://codeflow.org/entries/2013/feb/15/soft-shadow-mapping/
float xShadowMapCompare(Texture2D shadowMap, float2 texel, float2 uv, float compareZ)
{
	if (uv.x < 0.0 || uv.y < 0.0
		|| uv.x > 1.0 || uv.y > 1.0)
	{
		return 0.0;
	}
	float2 temp = uv.xy / texel + 0.5;
	float2 f = frac(temp);
	float2 centroidUV = floor(temp) * texel;
	float2 pos = centroidUV;
	float lb = step(xDecodeDepth(shadowMap.Sample(gm_BaseTexture, pos).rgb), compareZ); //0,0
	pos.y += texel.y;
	float lt = step(xDecodeDepth(shadowMap.Sample(gm_BaseTexture, pos).rgb), compareZ); //0,1
	pos.x += texel.x;
	float rt = step(xDecodeDepth(shadowMap.Sample(gm_BaseTexture, pos).rgb), compareZ); //1,1
	pos.y -= texel.y;
	float rb = step(xDecodeDepth(shadowMap.Sample(gm_BaseTexture, pos).rgb), compareZ); //1,0
	float a = lerp(lb, lt, f.y);
	float b = lerp(rb, rt, f.y);
	float c = lerp(a, b, f.x);
	return c;
}

void main(in VS_out IN, out PS_out OUT)
{
	float4 base = gm_BaseTextureObject.Sample(gm_BaseTexture, IN.TexCoord);
	if (base.a < 1.0)
	{
		discard;
	}

	float shadow = 0.0;
	float3 N = normalize(texNormal.Sample(gm_BaseTexture, IN.TexCoord).xyz * 2.0 - 1.0);
	float3 L = -normalize(u_fLightDir);
	float NdotL = saturate(dot(N, L));
	
	float4 lightCol = float4(0.0, 0.0, 0.0, 1.0);
	float4 specular = float4(0.0, 0.0, 0.0, 1.0);
	
	if (NdotL > 0.0)
	{
		float depth = xDecodeDepth(texDepth.Sample(gm_BaseTexture, IN.TexCoord).xyz) * u_fClipFar;
		float3 posView = xProject(u_vTanAspect, IN.TexCoord, depth);
		float3 posWorld = mul(u_mInverse, float4(posView, 1.0)).xyz;
		float bias = 1.5;
		float3 posShadowMap = mul(u_mShadowMap, float4(posWorld + N * bias, 1.0)).xyz;
		posShadowMap.z = posShadowMap.z * 0.5 + 0.5;
		float2 texCoordShadowMap = float2(posShadowMap.xy * 0.5 + 0.5);
		texCoordShadowMap.y = 1.0 - texCoordShadowMap.y;
		shadow = xShadowMapCompare(texShadowMap, u_fShadowMapTexel, texCoordShadowMap, posShadowMap.z);
		const float lerpRegion = 2.0;
		float shadowLerp = saturate((length(posView) - u_fShadowMapArea * 0.5 + lerpRegion) / lerpRegion);
		shadow = lerp(shadow, 0.0, shadowLerp);

		lightCol.rgb = u_fLightCol.rgb * u_fLightCol.a * NdotL * (1.0 - shadow);

		// TODO: Make BRDF.
		float smoothness = 1.0;
		float3 V = normalize(u_fCamPos - posWorld);
		float3 H = normalize(L + V);
		float NdotH = max(dot(N, H), 0.0);
		float specPower = pow(2.0, 1.0 + smoothness * 10.0);
		specular.rgb = lightCol.rgb * pow(NdotH, (specPower + 8.0) / 8.0);
	}

	OUT.Total = base * lightCol + float4(specular.rgb, 0.0);
	OUT.Specular = specular;
}