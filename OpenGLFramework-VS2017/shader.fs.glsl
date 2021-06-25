#version 330

in vec2 texCoord;

out vec4 fragColor;

in vec3 FragPos;  
in vec3 Normal; 

uniform vec3 Ka;
uniform vec3 Kd;
uniform vec3 Ks;
uniform float shininess;
uniform vec3 viewPos;
uniform vec3 lightPos;
uniform vec3 diffuse;
uniform vec3 direction;

// [TODO] passing texture from main.cpp
// Hint: sampler2D
uniform sampler2D texture1;

void main() {
	//fragColor = vec4(texCoord.xy, 0, 1);
	//fragColor = texture(texture1, texCoord);

	// ambient
    vec3 ambient = Ka * vec3(0.15f, 0.15f, 0.15f);
  	

    //diffuse
    vec3 norm = normalize(Normal);
    vec3 lightDirection;
    lightDirection = normalize(lightPos); 
    float diff = max(dot(norm, lightDirection), 0.0);
    vec3 Diffuse = diffuse * (diff * Kd);

    //specular
    vec3 viewDir = normalize(viewPos - FragPos);
    vec3 halfway = normalize(lightDirection + viewDir);
    float spec = pow(max(dot(norm, halfway), 0.0), shininess);
    vec3 specular = vec3(1.0f, 1.0f, 1.0f) * (spec * Ks);
	


    vec3 result = ambient + diffuse + specular;
    //fragColor = vec4(result, 1.0);

	// [TODO] sampleing from texture
	// Hint: texture
	fragColor = vec4(texture(texture1, texCoord).rgb,1)*(vec4(result, 1.0));
}
