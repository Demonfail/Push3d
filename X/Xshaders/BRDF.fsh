#pragma include("Common.fsh")

#define X_PI         3.14159265359
#define X_F0_DEFAULT Vec3(0.22, 0.22, 0.22)

/// @desc Normal distribution function
/// @surce http://blog.selfshadow.com/publications/s2013-shading-course/karis/s2013_pbs_epic_notes_v2.pdf
float xSpecularD_GGX(float roughness, float NdotH)
{
	float r2 = xPow2(roughness);
	return r2 / (X_PI * xPow2((xPow2(NdotH) * (r2-1.0) + 1.0)));
}

/// @desc Geometric attenuation
/// @surce http://blog.selfshadow.com/publications/s2013-shading-course/karis/s2013_pbs_epic_notes_v2.pdf
float xSpecularG_Schlick(float roughness, float NdotL, float NdotV)
{
	float k = xPow2(roughness+1.0) * 0.125;
	float oneMinusK = 1.0-k;
	return (NdotL / (NdotL * oneMinusK + k))
		* (NdotV / (NdotV * oneMinusK + k));
}

/// @desc Fresnel
/// @surce https://en.wikipedia.org/wiki/Schlick%27s_approximation
Vec3 xSpecularF_Schlick(Vec3 f0, float NdotV)
{
	return f0 + (1.0-f0) * xPow5(1.0-NdotV); 
}

/// @desc Cook-Torrance microfacet specular shading
/// @surce http://blog.selfshadow.com/publications/s2013-shading-course/karis/s2013_pbs_epic_notes_v2.pdf
Vec3 BRDF(Vec3 f0, float roughness, float NdotL, float NdotV, float NdotH)
{
	Vec3 specular = xSpecularD_GGX(roughness, NdotH)
		* xSpecularF_Schlick(f0, NdotV)
		* xSpecularG_Schlick(roughness, NdotL, NdotH);
	return specular / (4.0 * NdotL * NdotV);
}