//
// Simple passthrough fragment shader
//

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 u_colTarget[8];
uniform vec4 u_colLight[8];

void main()
{
	vec4 drawColor = texture2D( gm_BaseTexture, v_vTexcoord );
	float A = drawColor.a;
	
	if (A == 0.0) {return;}
	
	for (int i = 0; i < 8; i++)
	{
		if (u_colTarget[i].a == 0.0) {continue;}
		
		if (drawColor == u_colTarget[i])
		{
			drawColor = u_colLight[i];
			break;
		}
	}
	
    gl_FragColor = v_vColour * drawColor;
}
