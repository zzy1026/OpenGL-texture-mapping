#version 330

layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aColor;
layout (location = 2) in vec3 aNormal;
layout (location = 3) in vec2 aTexCoord;

out vec2 texCoord;

uniform mat4 um4p;	// projection matrix
uniform mat4 um4v;	// camera viewing transformation matrix
uniform mat4 um4m;	// rotation matrix

out vec3 FragPos;
out vec3 Normal;

void main() 
{
	texCoord = aTexCoord;
	gl_Position = um4p * um4v * um4m * vec4(aPos, 1.0);

	FragPos = vec3(um4m * vec4(aPos, 1.0));
    Normal = mat3(transpose(inverse(um4m))) * aNormal;  
	texCoord = vec2(aTexCoord.x, aTexCoord.y);
}

