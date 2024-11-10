#version 300 es

/* Lecture 21: Gouraud and Phong Shaders
 * CS 4388/ CS 5388, Fall 2024, Texas State University
 * Instructor: Isayas Berhe Adhanom <isayas@txstate.edu>
 * License: Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International
 */ 

precision mediump float;

const int MAX_LIGHTS = 8;

uniform mat4 modelMatrix;
uniform mat4 normalMatrix;
uniform mat4 viewMatrix;
uniform mat4 projectionMatrix;

uniform vec3 eyePositionWorld;

#define POINT_LIGHT 0
#define DIRECTIONAL_LIGHT 1

// properties of the lights in the scene
uniform int numLights;
uniform int lightTypes[MAX_LIGHTS];
uniform vec3 lightPositionsWorld[MAX_LIGHTS];
uniform vec3 ambientIntensities[MAX_LIGHTS];
uniform vec3 diffuseIntensities[MAX_LIGHTS];
uniform vec3 specularIntensities[MAX_LIGHTS];

// material properties (coefficents of reflection)
uniform vec3 kAmbient;
uniform vec3 kDiffuse;
uniform vec3 kSpecular;
uniform float shininess;

// per-vertex data
in vec3 position;
in vec3 normal;
in vec4 color;
in vec2 texCoord;

// data we want to send to the rasterizer and eventually the fragment shader
out vec4 vertColor;
out vec2 uv;

void main() 
{
    
    vec3 worldPosition = (modelMatrix * vec4(position, 1)).xyz;

    // Lighting calculations
    vec3 illumination = vec3(0,0,0);
    for(int i=0; i< numLights; i++){
        illumination += kAmbient * ambientIntensities[i];

        

    }
    vertColor = color;
    vertColor.rgb *= illumination;

    gl_Position = projectionMatrix * viewMatrix * vec4(worldPosition, 1);
}
