attribute vec4 in_Position;     // (x, y, z, w)
//attribute vec3 in_Normal;     // (x, y, z)
attribute vec4 in_Colour;       // (r, g, b, a)
attribute vec2 in_TextureCoord; // (u, v)

//varying vec3 v_vNormal;
varying vec4 v_vColour;
varying vec2 v_vTexCoord;

void main() {
	gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * in_Position;
	//v_vNormal = (gm_Matrices[MATRIX_WORLD] * vec4(in_Normal, 0.0)).xyz;
	v_vColour = in_Colour;
	v_vTexCoord = in_TextureCoord;
}