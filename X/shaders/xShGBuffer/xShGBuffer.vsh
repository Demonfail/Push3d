uniform float u_fClipFar;

struct VS_in {
	float4 Position : POSITION0; // (x,y,z,w)
	float3 Normal   : NORMAL0;   // (x,y,z)
	float2 TexCoord : TEXCOORD0; // (u,v)
};

struct VS_out {
	float4 Position : SV_POSITION;
	float3 Normal   : NORMAL0;
	float2 TexCoord : TEXCOORD0;
	float  Depth    : TEXCOORD1;
};

void main(in VS_in IN, out VS_out OUT) {
	OUT.Position = mul(gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION], IN.Position);
	OUT.Normal = mul(gm_Matrices[MATRIX_WORLD],
		float4(IN.Normal.x, IN.Normal.y, IN.Normal.z, 0.0)).xyz;
	OUT.TexCoord = IN.TexCoord;
	OUT.Depth = OUT.Position.z / u_fClipFar;
}