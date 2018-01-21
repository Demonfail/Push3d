uniform vec2 u_vTexel;      // (1/screenWidth,1/screenHeight)
uniform vec2 u_vScreenSize; // (screenWidth,screenHeight)

varying vec2 v_vTexCoord;

void main() {
	vec4 base = texture2D(gm_BaseTexture, v_vTexCoord);

	bool interleave = mod(floor(v_vTexCoord.x * u_vScreenSize.x), 2.0) == mod(floor(v_vTexCoord.y * u_vScreenSize.y), 2.0);
	float Cb = interleave ? base.g : texture2D(gm_BaseTexture, v_vTexCoord + vec2(1.0, 0.0) * u_vTexel).g;
	float Cr = interleave ? texture2D(gm_BaseTexture, v_vTexCoord - vec2(1.0, 0.0) * u_vTexel).g : base.g;

	// YCbCr to RGB
	float R = base.r + 1.402 * (Cr - 0.5);
	float G = base.r - 0.344 * (Cb - 0.5) - 0.714 * (Cr - 0.5);
	float B = base.r + 1.772 * (Cb - 0.5);

	// Output (R, G, B, 1)
	gl_FragColor = vec4(R, G, B, 1.0);
}