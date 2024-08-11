// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

#pragma header

#define round(a) floor(a + 0.5)
#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
#define iChannel0 bitmap
uniform sampler2D iChannel1;
uniform sampler2D iChannel2;
uniform sampler2D iChannel3;
#define texture flixel_texture2D

// third argument fix
vec4 flixel_texture2D(sampler2D bitmap, vec2 coord, float bias) {
	vec4 color = texture2D(bitmap, coord, bias);
	if (!hasTransform)
	{
		return color;
	}
	if (color.a == 0.0)
	{
		return vec4(0.0, 0.0, 0.0, 0.0);
	}
	if (!hasColorTransform)
	{
		return color * openfl_Alphav;
	}
	color = vec4(color.rgb / color.a, color.a);
	mat4 colorMultiplier = mat4(0);
	colorMultiplier[0][0] = openfl_ColorMultiplierv.x;
	colorMultiplier[1][1] = openfl_ColorMultiplierv.y;
	colorMultiplier[2][2] = openfl_ColorMultiplierv.z;
	colorMultiplier[3][3] = openfl_ColorMultiplierv.w;
	color = clamp(openfl_ColorOffsetv + (color * colorMultiplier), 0.0, 1.0);
	if (color.a > 0.0)
	{
		return vec4(color.rgb * color.a * openfl_Alphav, color.a * openfl_Alphav);
	}
	return vec4(0.0, 0.0, 0.0, 0.0);
}

// variables which is empty, they need just to avoid crashing shader
uniform float iTimeDelta;
uniform float iFrameRate;
uniform int iFrame;
#define iChannelTime float[4](iTime, 0., 0., 0.)
#define iChannelResolution vec3[4](iResolution, vec3(0.), vec3(0.), vec3(0.))
uniform vec4 iMouse;
uniform vec4 iDate;

/*

					Info:
-------------------------------------------------
#################################################

This shader can't be used for a commercial purpose

#################################################
-------------------------------------------------
*/


//2D (returns 0 - 1)
float random2d(vec2 n) { 
    return fract(sin(dot(n, vec2(12.9898, 4.1414))) * 43758.5453);
}

void mainImage( out vec4 fragColor, in vec2 fragCoord ) {
    
    vec2 mouse = iMouse.x==0.?iResolution.xy:iMouse.xy;
    float amountx = 1.0+mouse.x/iResolution.x*100.;
    amountx = 100.-amountx;
    float amounty = 0.0-mouse.y/iResolution.y*100.;
    
    //Speed 0-1
    float speed = 1.0;
    
    //Global time
    float time = floor(iTime*(speed*60.0));
    
    //Coordinates
    vec2 uv = fragCoord.xy/iResolution.xy;
    
    //Input texture
   	vec4 col = texture(iChannel0, uv);
    
    //Every block
    for (float i = 0.0; i < (amounty/(amounty/10.)); i += 1.0) {
        
        //Get random every block
        float rnd = random2d(vec2(time , float(i*100.)));

        //Random distance each block
        float dist = (i/0.1+(rnd*10.))+amounty+80.;

        //Progressive Y 
        float offset = (amountx/50.*i/10.)+(rnd/10.);

        //Color goes dark
        float c = (0.7-(i/6.))+(rnd/2.);

        //New texture
		vec4 bg = texture(iChannel0, uv + vec2(offset, 0.0))*c;

        //Black space
        bg = mix(vec4(0.0), bg, clamp(4.-floor(offset*510.)+(1.-uv.x)*500., 0., 1.));
        
        float f = clamp(4.-floor(dist)*4.+(1.-uv.y)*300. , 0., 1.);

        float f2 = (rnd>uv.x)?1.:0.;

        vec4 rowColor = mix(bg, col, f2);

        col = mix(col, rowColor, f);

        f = clamp(4.-floor(dist+2.)*4.+(1.-uv.y)*300., 0., 1.);

        col = mix(col, bg, f);
        
    }
    
    //Display
    fragColor = col;
}




void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}