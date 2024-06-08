varying vec3 vColor;

void main() {

    // * Star
    // vec2 lightUvX = vec2((gl_PointCoord.x * 0.1) + 0.45, gl_PointCoord.y * 0.5 + 0.25);
    // float lightX = 0.015 / distance(lightUvX, vec2(0.5, 0.5));
    // vec2 lightUvY = vec2((gl_PointCoord.y * 0.1) + 0.45, gl_PointCoord.x * 0.5 + 0.25);
    // float lightY = 0.015 / distance(lightUvY, vec2(0.5, 0.5));
    // float strength = step(0.5, lightY * lightX);

    // *Disc
    // float strength = distance(gl_PointCoord, vec2(0.5));
    // strength = step(0.5, strength); //? si la distancia es mayor al radio blanco (1) , negro (0) d.l.c
    // strength = 1.0 - strength;

    // * Diffuse point
    // float strength = distance(gl_PointCoord, vec2(0.5)) * 2.0; //? to reach full black (really white to be inverted later)
    // strength = 1.0 - strength;

    // * Light point
    float strength = 1.0 - distance(gl_PointCoord, vec2(0.5));
    strength = pow(strength, 11.50); //? power 10 to get higher values at center

    // * Final color
    vec3 color = mix(vec3(0.0), vColor, strength);

    gl_FragColor = vec4(color, 1.0);

    #include <colorspace_fragment>
}