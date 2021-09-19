//
// Simple passthrough fragment shader
//

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 u_flashColor;

float lerp(float val1, float val2, float amt)
{
	return ( (val2 - val1) * amt) + val1;
}

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	if (gl_FragColor.a == 0.0) {return;}
	
	if (u_flashColor.a > 0.0)
	{
		gl_FragColor.r = lerp(gl_FragColor.r, u_flashColor.r, u_flashColor.a);
		gl_FragColor.g = lerp(gl_FragColor.g, u_flashColor.g, u_flashColor.a);
		gl_FragColor.b = lerp(gl_FragColor.b, u_flashColor.b, u_flashColor.a);
	}
}
