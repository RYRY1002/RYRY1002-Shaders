#version 120

varying vec4 texcoord;

uniform sampler2D gcolor;

void Vignette(inout vec3 color) {
  float dist = distance(texcoord.st, vec2(0.5));
  dist /= 1.5142;
  dist = pow(dist, 1.1);

  color.rgb *= 1.0 - dist;
}

vec3 convertToHDR(in vec3 color) {
  vec3 hdrImage;

  vec3 overExposed = color * 1.2;
  vec3 underExposed = color / 1.5;

  hdrImage = mix(underExposed, overExposed, color);

  return hdrImage;
}

void main() {

  vec3 color = texture2D(gcolor, texcoord.st).rgb;

  color = convertToHDR(color);

  //Vignette(color);

  gl_FragColor = vec4(color.rgb, 1.0);

}
