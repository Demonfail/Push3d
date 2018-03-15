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
uniform float    u_fClipFar;
uniform float2   u_fTanAspect;
uniform float4   u_fLightPos;  // (x,y,z,radius)
uniform float4   u_fLightCol;  // (r,g,b,intensity)
uniform float3   u_fCamPos;    // Camera's (x,y,z) position in the world space

struct VS_out
{
	float4 Position : SV_POSITION;
	float4 Vertex   : TEXCOORD0;
};

struct PS_out
{
	float4 Total    : SV_TARGET0; // Sum of diffuse and specular light.
	float4 Specular : SV_TARGET1; // Specular light only.
};

float4 xSampleCube(Texture2D tex, float3 dir)
{
	float3 dirAbs = abs(dir);

	int i = dirAbs.x > dirAbs.y ?
		(dirAbs.x > dirAbs.z ? 0 : 2) :
		(dirAbs.y > dirAbs.z ? 1 : 2);

	float sc, tc, ma;
	float o = 0.0;

	if (i == 0)
	{
		if (dir.x > 0)
		{
			sc = +dir.y;
			tc = -dir.z;
		}
		else
		{
			sc = -dir.y;
			tc = -dir.z;
			o = 1.0;
		}
		ma = dirAbs.x;
	}
	else if (i == 1)
	{
		if (dir.y > 0)
		{
			sc = -dir.x;
			tc = -dir.z;
		}
		else
		{
			sc = +dir.x;
			tc = -dir.z;
			o = 1.0;
		}
		ma = dirAbs.y;
	}
	else
	{
		if (dir.z > 0)
		{
			sc = +dir.y;
			tc = +dir.x;
		}
		else
		{
			sc = +dir.y;
			tc = -dir.x;
			o = 1.0;
		}
		ma = dirAbs.z;
	}

	float invL = 1.0 / length(ma);
	float2 st = (float2(sc, tc) * invL + 1.0) * 0.5;
	st.x = (float(i) * 2.0 + o + st.x) * 0.125;
	return tex.Sample(gm_BaseTexture, st);
	return float4(st.xy, 0.0, 1.0);
}

void main(in VS_out IN, out PS_out OUT)
{
	float2 screenUV = xUnproject(IN.Vertex);

	float4 base = gm_BaseTextureObject.Sample(gm_BaseTexture, screenUV);
	if (base.a < 1.0)
	{
		discard;
	}

	float depth = xDecodeDepth(texDepth.Sample(gm_BaseTexture, screenUV).xyz) * u_fClipFar;
	float3 posView = xProject(u_fTanAspect, screenUV, depth);
	float3 posWorld = mul(u_mInverse, float4(posView, 1.0)).xyz;

	float3 lightCol = 0.0;
	float3 lightVec = u_fLightPos.xyz - posWorld;
	float dist = length(lightVec);
	float3 specular = 0.0;

	if (dist < u_fLightPos.w)
	{
		float3 N = normalize(texNormal.Sample(gm_BaseTexture, screenUV).xyz * 2.0 - 1.0);
		float3 L = normalize(lightVec);
		float NdotL = saturate(dot(N, L));

		if (NdotL > 0.0)
		{
			float shadowmapDepth = xDecodeDepth(xSampleCube(texShadowMap, -lightVec).xyz) * u_fLightPos.w;
			float shadow = dist > shadowmapDepth ? 1.0 : 0.0;

			float att = 1.0 - saturate(dist / u_fLightPos.w);
			lightCol += u_fLightCol.rgb * u_fLightCol.a * NdotL * att * (1.0 - shadow);

			// TODO: Make BRDF.
			float smoothness = 1.0;
			float3 V = normalize(u_fCamPos - posWorld);
			float3 H = normalize(L + V);
			float NdotH = max(dot(N, H), 0.0);
			float specPower = pow(2.0, 1.0 + smoothness * 10.0);
			specular = lightCol * pow(NdotH, (specPower + 8.0) / 8.0);
		}
	}

	OUT.Total = float4(base.rgb * lightCol + specular, 1.0);
	OUT.Specular = float4(specular.rgb, 1.0);
}