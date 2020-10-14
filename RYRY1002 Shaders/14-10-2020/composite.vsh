#version 120

uniform int worldTime;
uniform vec3 sunPosition;
uniform vec3 moonPosition;

varying vec4 texcoord;

varying vec3 lightVector;
varying vec3 lightColor;
varying vec3 skyColor;

void main() {
  gl_Position = ftransform();
  texcoord = gl_MultiTexCoord0;

  if(worldTime < 12700 || worldTime > 23250) {
    lightVector = normalize(sunPosition);
    //Change the "lightColor" value below to change the amount of light emitted by the sun.
    lightColor = vec3(1.0);
    //Change the "skyColor" value below to change the brightness of the day.
    skyColor = vec3(0.3);
  } else {
    lightVector = normalize(moonPosition);
    //Change the "lightColor" value below to change the amount of light emitted by the moon.
    lightColor = vec3(0.15);
    //Change the "skyColor" value below to change the brightness of the night.
    skyColor = vec3(0.2);
  }
}
