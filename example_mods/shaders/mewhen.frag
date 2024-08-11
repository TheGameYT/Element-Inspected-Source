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

/** 
* Thanks to the authors who created the noise algorithms used here 
* (Iq, Ashima, nameless talent from GLSLSandbox). 
* Triangles originated here, thanks to XOR for his permission: https://www.shadertoy.com/view/Mtj3Rh
*/


/**
 * Clusters values into larger "Pixels"
 */
float _pixelate(float x, float amount) {
  return floor(x*amount)/amount;
}
vec2 _pixelate(vec2 x, float amount) {
  return floor(x*amount)/amount;
}
vec3 _pixelate(vec3 x, float amount) {
  return floor(x*amount)/amount;
}

float _rand(float seed){return fract(sin(seed) * 43758.5453123);}
float _rand(vec2 seed) {
  return fract(sin(dot(seed, vec2(12.9898, 4.1414))) * 43758.5453);
}

float _noise(float seed){
  float _floor = floor(seed);
  float _remainder = fract(seed);
  return mix(_rand(_floor), _rand(_floor + 1.0), _remainder);
}

float _noise(vec2 seed) {
  const vec2 d = vec2(0.0, 1.0);
  vec2 _floor = floor(seed);
  vec2 _remainder = smoothstep(vec2(0.0), vec2(1.0), fract(seed));
  return mix(mix(_rand(_floor), _rand(_floor + d.yx), _remainder.x), mix(_rand(_floor + d.xy), _rand(_floor + d.yy), _remainder.x), _remainder.y);
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    float rgbZoomAmt = pow(sin(fract(iTime*2.0)+iTime)*cos(iTime)*1.0,2.0)*0.25;
    float time = iTime;
    float syn_FadeInOut = 1.0;
    
	vec2 uv = fragCoord.xy / iResolution.xy;
	vec3 col;
    vec2 posBL = uv;

    float rgbZoomAmtMod = rgbZoomAmt;
    rgbZoomAmtMod *= _noise(_pixelate(uv.y,50.0)*100.0);
    vec2 modifiedCenter = vec2(cos(time), sin(time))*0.5;
    vec2 rPos = (posBL - modifiedCenter)*(1.0/(1.0+rgbZoomAmtMod*0.31*sin(time*0.23)))+modifiedCenter;
    vec2 gPos = (posBL - modifiedCenter)*(1.0/(1.0+rgbZoomAmtMod*0.398*sin(time*0.2)))+modifiedCenter;
    vec2 bPos = (posBL - modifiedCenter)*(1.0/(1.0+rgbZoomAmtMod*0.33*sin(time*0.3)))+modifiedCenter;

    rPos = abs(rPos);
    if (rPos.x >= 0.9999){
      rPos.x = 0.9999-rPos.x;
    }
    if (rPos.y >= 0.9999){
      rPos.y = 0.9999-rPos.y;
    }

    gPos = abs(gPos);
    if (gPos.x >= 0.9999){
      gPos.x = 0.9999-gPos.x;
    }
    if (rPos.y >= 0.9999){
      gPos.y = 0.9999-gPos.y;
    }

    bPos = abs(bPos);
    if (bPos.x >= 0.9999){
      bPos.x = 0.9999-bPos.x;
    }
    if (rPos.y >= 0.9999){
      bPos.y = 0.9999-bPos.y;
    }

    col.r = texture(iChannel0, rPos).r;
    col.g = texture(iChannel0, gPos).g;
    col.b = texture(iChannel0, bPos).b;

    col *= syn_FadeInOut;
    
    fragColor = vec4(col,texture(iChannel0, uv).a);
    
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}