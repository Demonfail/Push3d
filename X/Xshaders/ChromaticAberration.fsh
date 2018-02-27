// Source: http://john-chapman-graphics.blogspot.cz/2013/02/pseudo-lens-flare.html
/// @param direction  Direction of distortion.
/// @param distortion Per-channel distortion factor.
float3 xChromaticAberration(Texture2D tex, float2 uv, float2 direction,
    float3 distortion) {
  return float3(
    tex.Sample(gm_BaseTexture, uv + direction * distortion.r).r,
    tex.Sample(gm_BaseTexture, uv + direction * distortion.g).g,
    tex.Sample(gm_BaseTexture, uv + direction * distortion.b).b);
}