#version 300 es

/* Lecture 21: Gouraud and Phong Shaders
 * CS 4388/ CS 5388, Fall 2024, Texas State University
 * Instructor: Isayas Berhe Adhanom <isayas@txstate.edu>
 * License: Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International
 */ 

precision mediump float;

// material properties: coeff. of reflection for the material
uniform mat4 modelMatrix;
uniform mat4 normalMatrix;
uniform mat4 viewMatrix;
uniform mat4 projectionMatrix;

// per-vertex data
in vec3 position;
in vec3 normal;
in vec4 color;
in vec2 texCoord;

// data we want to send to the rasterizer and eventually the fragment shader
out vec3 vertPositionWorld;
out vec3 vertNormalWorld;
out vec4 vertColor;
out vec2 uv;

void main() 
{
    //position in world space  
    vertPositionWorld = (modelMatrix * vec4(position, 1)).xyz;

    //normal in world space
    vertNormalWorld = normalize((normalMatrix * vec4(normal, 0)).xyz);

    //output the vertex color to the fragment shader
    vertColor = color;

    //output the texture coordinates to the fragment shader
    uv = texCoord.xy;

    // compute the 2D screen coordinate position
    gl_Position = projectionMatrix * viewMatrix * vec4(vertPositionWorld, 1);
}
