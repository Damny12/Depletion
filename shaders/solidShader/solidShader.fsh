//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float uniAlpha;
uniform sampler2D secondaryTexture;

//UVs
uniform vec4 secondaryUVs;
uniform vec4 baseUVs;

void main()
{
    vec4 sampled = v_vColour*texture2D( gm_BaseTexture, v_vTexcoord);
	
	vec2 secondaryPos = mix(secondaryUVs.xy,secondaryUVs.zw,v_vTexcoord);
	vec4 secondarySample = texture2D( secondaryTexture, secondaryPos);
	
	sampled.rgb=v_vColour.rgb;
		
	if (sampled.a > 0.) {
		sampled.a=uniAlpha;
	}
	
	if (secondarySample.a > 0.) {
		sampled.a = 0.;
	}
		
	gl_FragColor = sampled;
}