#version 120

#include "/lib/framebuffer.glsl"

varying vec4 texcoord;
varying vec3 lightVector;

/* DRAWBUFFERS : 012 */

void main() {
  vec3 albedo = getAlbedo(texcoord.st);
  vec3 normal = getNormal(texcoord.st);
  float emission = getEmission(texcoord.st);

  float sunLightStrength = dot(normal, lightVector);
  sunLightStrength = max(0.0, sunLightStrength);

  float ambientLightStrength = 0.25;

  vec3 litColor = albedo * (sunLightStrength + ambientLightStrength);
  vec3 finalColor = mix(litColor, albedo, emission);

  GCOLOR_OUT = vec4(finalColor, 1.0);
}
