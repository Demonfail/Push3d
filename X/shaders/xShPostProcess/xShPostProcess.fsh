varying vec2 v_vTexCoord;

uniform sampler2D texLUT;
uniform float     u_fLUTIndex;
uniform vec2      u_vTexel;
uniform float     u_fDistortion;

#pragma include("ColorGrading.fsh", "glsl")
/// @param color The original RGB color.
/// @param lut   Texture of color-grading lookup tables.
/// @param index The index of the lut to use.
vec3 xColorGrade(vec3 color, sampler2D lut, float index)
{
	vec2 uv;
	uv.x = color.x*0.05859375;
	uv.y = color.y*0.05859375 + index*0.0625;
	float b15 = color.b*15.0;
	float z0 = floor(b15)*0.0625;
	float z1 = z0 + 0.0625;
	vec2 uv2 = uv + 0.001953125;
	return mix(
		texture2D(lut, uv2 + vec2(z0, 0.0)).rgb,
		texture2D(lut, uv2 + vec2(z1, 0.0)).rgb,
		fract(b15));
}
// include("ColorGrading.fsh")
#pragma include("ChromaticAberration.fsh", "glsl")
/// @param direction  Direction of distortion.
/// @param distortion Per-channel distortion factor.
/// @source http://john-chapman-graphics.blogspot.cz/2013/02/pseudo-lens-flare.html
vec3 xChromaticAberration(
	sampler2D tex,
	vec2 uv, 
	vec2 direction,
	vec3 distortion)
{
	return vec3(
		texture2D(tex, uv + direction * distortion.r).r,
		texture2D(tex, uv + direction * distortion.g).g,
		texture2D(tex, uv + direction * distortion.b).b);
}
// include("ChromaticAberration.fsh")

void main()
{
	vec2 vec         = 0.5 - v_vTexCoord;
	vec3 distortion  = vec3(-u_vTexel.x, 0.0, u_vTexel.x) * u_fDistortion * min(length(vec) / 0.5, 1.0);
	vec3 base        = xChromaticAberration(gm_BaseTexture, v_vTexCoord, normalize(vec), distortion);
	gl_FragColor.rgb = xColorGrade(base, texLUT, u_fLUTIndex);
	gl_FragColor.a   = 1.0;
}