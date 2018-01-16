uniform vec2 u_vScreenSize; // (screenWidth, screenHeight)

varying vec2 v_vTexCoord;

void main() {
	vec4 base = texture2D(gm_BaseTexture, v_vTexCoord);

	// RGB to YCbCr
	float Y = 0.299 * base.r + 0.587 * base.g + 0.114 * base.b;
	float Cb = 0.5 + (-0.168 * base.r - 0.331 * base.g + 0.5 * base.b);
	float Cr = 0.5 + (0.5 * base.r - 0.418 * base.g - 0.081 * base.b);

	// Output Y to the red channel and Cb, Cr interleaved
	// in a checkerboard pattern to the green channel.
	gl_FragColor = vec4(
		Y,
		(mod(floor(v_vTexCoord.x * u_vScreenSize.x), 2.0) == mod(floor(v_vTexCoord.y * u_vScreenSize.y), 2.0)) ? Cb : Cr,
		0.0,
		1.0);
}