#version 120

#include "/lib/framebuffer.glsl"

uniform sampler2D texture;

varying vec3 tintColor;

varying vec3 normal;
varying vec4 texcoord;

void main() {
  vec4 handColor = texture2D(texture, texcoord.st);
  handColor.rgb *= tintColor;

  GCOLOR_OUT = handColor;
  GNORMAL_OUT = vec4(normal * 0.5 + 0.5, 1.0);
}
