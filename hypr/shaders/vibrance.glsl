precision highp float;
varying vec2 v_texcoord;
uniform sampler2D tex;

void main() {
    vec4 pixColor = texture2D(tex, v_texcoord);
    vec3 color = vec3(pixColor[0], pixColor[1], pixColor[2]);

    // Use luma coefficients for better grayscale conversion
    vec3 lumaCoefficients = vec3(0.212656, 0.715158, 0.072186); // Standard luma weights for perceptual brightness
    float luma = dot(lumaCoefficients, color); // Calculate the luma

    // Set the RGB channels to the grayscale value
    pixColor.rgb = vec3(luma);

    gl_FragColor = pixColor;
}
