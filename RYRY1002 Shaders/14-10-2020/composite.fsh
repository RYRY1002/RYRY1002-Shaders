#version 120

#include "/lib/framebuffer.glsl"

varying vec4 texcoord;

varying vec3 lightVector;
varying vec3 lightColor;
varying vec3 skyColor;

/* DRAWBUFFERS : 012 */

struct Fragment {
  vec3 albedo; vec3 normal;
  float emission;
};

Fragment getFragment(in vec2 coord) {
  Fragment newFragment;
  newFragment.albedo = getAlbedo(coord);
  newFragment.normal = getNormal(coord);
  newFragment.emission = getEmission(coord);

  return newFragment;
}

vec3 calculateLighting(in Fragment frag) {
  float directLightStrength = dot(frag.normal, lightVector);
  directLightStrength = max(0.0, directLightStrength);
  vec3 directLight = directLightStrength * lightColor;
  vec3 litColor = frag.albedo * (directLight + skyColor);
  return mix(litColor, frag.albedo, frag.emission);
}

void main() {
  Fragment frag = getFragment(texcoord.st);
  vec3 finalColor = calculateLighting(frag);
  GCOLOR_OUT = vec4(finalColor, 1.0); 
}
