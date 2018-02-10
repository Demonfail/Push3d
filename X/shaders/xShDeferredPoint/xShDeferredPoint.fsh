#pragma include("Common.fsh")
float3 xEncodeDepth(float d) {
	float3 enc = float3(1.0, 255.0, 65025.0) * d;
	enc = frac(enc);
	enc -= float3(enc.y, enc.z, enc.z)
		* float3(1.0 / 255.0, 1.0 / 255.0, 1.0 / 255.0);
	return enc;
}

float xDecodeDepth(float3 c) {
	return dot(c, float3(1.0, 1.0 / 255.0, 1.0 / 65025.0));
}

float3 xProject(float2 tanAspect, float2 texCoord, float depth) {
	// tanAspect = (tanFovY * (screenWidth / screenHeight), -tanFovY), where:
	//   tanFovY = dtan(fov * 0.5)
	return float3(tanAspect * (texCoord * 2.0 - 1.0) * depth, depth);
}
// include("Common.fsh")

Texture2D texNormal : register(t1);
Texture2D texDepth  : register(t2);

uniform float4x4 u_mInverse;
uniform float    u_fClipFar;
uniform float2   u_fTanAspect;
uniform float4   u_fLightPos;  // (x,y,z,radius)
uniform float4   u_fLightCol;  // (r,g,b,intensity)

struct VS_out {
	float4 Position : SV_POSITION;
	float4 Vertex   : TEXCOORD0;
};

struct PS_out {
	float4 Target0 : SV_TARGET0;
};

void main(in VS_out IN, out PS_out OUT) {
	float2 screenXY = IN.Vertex.xy / IN.Vertex.w;
	float2 screenUV = float2(screenXY.x, -screenXY.y) * 0.5 + 0.5;

	float4 base = gm_BaseTextureObject.Sample(gm_BaseTexture, screenUV);
	if (base.a < 1.0) {
		discard;
	}

	float depth = xDecodeDepth(texDepth.Sample(gm_BaseTexture, screenUV).xyz) * u_fClipFar;
	float3 posView = xProject(u_fTanAspect, screenUV, depth);
	float3 posWorld = mul(u_mInverse, float4(posView, 1.0)).xyz;

	float4 lightCol = float4(0.0, 0.0, 0.0, 1.0);
	float3 lightVec = u_fLightPos.xyz - posWorld;
	float dist = length(lightVec);

	if (dist < u_fLightPos.w) {
		float3 N = normalize(texNormal.Sample(gm_BaseTexture, screenUV).xyz * 2.0 - 1.0);
		float3 L = normalize(lightVec);
		float NdotL = saturate(dot(N, L));

		if (NdotL > 0.0) {
			float att = 1.0 - saturate(dist / u_fLightPos.w);
			lightCol.rgb += u_fLightCol.rgb * u_fLightCol.a * NdotL * att;
		}
	}

	OUT.Target0 = base * lightCol;
}