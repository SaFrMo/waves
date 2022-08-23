varying vec2 vUv;
uniform vec2 uDimensions;

void main() {
    float scale = 350.;
    vec2 adjUv = vUv * scale + vec2(0.5);
    float lineWidth = 0.2;
    float lineStr = smoothstep(0., lineWidth * 0.5, fract(adjUv.y)) - smoothstep(lineWidth * 0.5, lineWidth, fract(adjUv.y));
    vec4 lineColor = vec4(0., 0., 0., 1.);

    // circle cutout
    float rad = min(uDimensions.x, uDimensions.y) * 0.45;
    vec2 circleCenter = uDimensions * 0.5;
    float opacity = 1. - step(rad, distance(gl_FragCoord.xy, circleCenter));

	gl_FragColor = mix(vec4( 1. ), lineColor, lineStr);
    gl_FragColor.a = opacity;
}
