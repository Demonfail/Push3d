// Source: https://john-chapman-graphics.blogspot.cz/2013/01/ssao-tutorial.html

//> Comment out if you are using view-space normals instead
//> of world-space. This line is also present in the xSsaoInit script,
//> so don't forget to comment out that one as well!
#define X_SSAO_WORLD_SPACE_NORMALS

//> Must be the same values as in the xSsaoInit script!
#define X_SSAO_KERNEL_SIZE 16

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

struct VS_out
{
	float4 Position : SV_POSITION;
	float2 TexCoord : TEXCOORD0;
};

struct PS_out
{
	float4 Target0 : SV_TARGET0;
};

#define   texDepth    gm_BaseTextureObject
Texture2D texNormal : register(t1);
Texture2D texRandom : register(t2);

#ifdef X_SSAO_WORLD_SPACE_NORMALS
uniform float4x4 u_mView;
#endif
uniform float4x4 u_mProjection;
uniform float2   u_fTexel;                            //< (1/screenWidth,1/screenHeight)
uniform float2   u_fTanAspect;                        //< (dtan(fov/2)*(screenWidth/screenHeight),-dtan(fov/2))
uniform float    u_fClipFar;                          //< Distance to the far clipping plane.
uniform float3   u_fSampleKernel[X_SSAO_KERNEL_SIZE]; //< Kernel of random vectors.
uniform float2   u_fNoiseScale;                       //< (screenWidth,screenHeight)/X_SSAO_NOISE_TEXTURE_SIZE
uniform float    u_fPower;                            //< Strength of the occlusion effect.
uniform float    u_fRadius;                           //< Radius of the occlusion effect.
uniform float    u_fBias;                             //< Depth bias of the occlusion effect.

void main(in VS_out IN, out PS_out OUT)
{
	// Origin
	float depth = xDecodeDepth(texDepth.Sample(gm_BaseTexture, IN.TexCoord).rgb);
	if (depth == 0.0 || depth == 1.0)
	{
		OUT.Target0 = 1.0;
		return;
	}
	depth *= u_fClipFar;
	float3 origin = xProject(u_fTanAspect, IN.TexCoord, depth);

	// Calc. TBN matrix
	float3 normal = normalize(texNormal.Sample(gm_BaseTexture, IN.TexCoord).rgb * 2.0 - 1.0);
#ifdef X_SSAO_WORLD_SPACE_NORMALS
	normal = normalize(mul(u_mView, float4(normal, 0.0)).xyz);
#endif
	float3 random = texRandom.Sample(gm_BaseTexture, IN.TexCoord * u_fNoiseScale).xyz * 2.0 - 1.0;
	float3 tangent = normalize(random - normal * dot(random, normal));
	float3 bitangent = cross(normal, tangent);
	float3x3 TBN = float3x3(tangent, bitangent, normal);

	// Occlusion
	float occlusion = 0.0;
	for (int i = 0; i < X_SSAO_KERNEL_SIZE; ++i)
	{
		// Get a sample in view-space and get it's screen-space coordinates
		float3 sampleVS = origin + mul(u_fSampleKernel[i], TBN) * u_fRadius;
		float2 sampleUV = xUnproject(mul(u_mProjection, float4(sampleVS, 1.0)));

		// Calc. occlusion
		float sampleDepth = xDecodeDepth(texDepth.Sample(gm_BaseTexture, sampleUV).rgb);
		if (sampleDepth != 0.0 && sampleDepth != 1.0)
		{
			sampleDepth *= u_fClipFar;
			float attenuation = smoothstep(0.0, 1.0, u_fRadius / abs(origin.z - sampleDepth + u_fBias));
			occlusion += attenuation * step(sampleDepth, sampleVS.z);
		}
	}
	occlusion = clamp(1.0 - occlusion / X_SSAO_KERNEL_SIZE, 0.0, 1.0);
	occlusion = pow(occlusion, u_fPower);

	// Output
	OUT.Target0.rgb = occlusion;
	OUT.Target0.a = 1.0;
}