//varying vec3 v_vNormal;
varying vec4 v_vColour;
varying vec2 v_vTexCoord;

void main() {
	gl_FragColor = v_vColour * texture2D(gm_BaseTexture, v_vTexCoord);
}