varying vec2 vUv;
uniform float uTime;

void main() {
    float waveHeight = 0.8;
    float waveCount = 105.;
    float speed = 1.6;

    vUv = uv;
    vec2 scale = vec2(waveCount);
    vec3 extrude = normal * 0.01;
    float intensity = 0.;
    float dist = distance(uv * scale, scale * 0.5);
    intensity = (sin((dist * 3.14159 - uTime * speed)) * waveHeight) * smoothstep(10., 0., dist) * (dist * 0.1);
    
    vec3 newPos = mix(position, position + extrude, intensity);
    gl_Position = projectionMatrix * modelViewMatrix * vec4(newPos, 1.0);;
}
