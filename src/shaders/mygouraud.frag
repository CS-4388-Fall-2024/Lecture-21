#version 300 es

/* Lecture 21: Gouraud and Phong Shaders
 * CS 4388/ CS 5388, Fall 2024, Texas State University
 * Instructor: Isayas Berhe Adhanom <isayas@txstate.edu>
 * License: Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International
 */ 

precision mediump float;

// texture data
uniform int useTexture;
uniform sampler2D textureImage;

// data passed in from the vertex shader
in vec4 vertColor;
in vec2 uv;

// fragment shaders can only output a single color
out vec4 fragColor;

void main() 
{
    fragColor = vertColor;

    if(useTexture != 0)
    {
        fragColor *= texture(textureImage, uv);
    }
}
