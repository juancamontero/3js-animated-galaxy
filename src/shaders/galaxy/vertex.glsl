uniform float uSize;
uniform float uTime;

attribute float aScale;
attribute float aRandomness;

varying vec3 vColor;

void main() {

    // * position
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);

    // * ANIMATION
    float angle = atan(modelPosition.x, modelPosition.y);
    float distanceToCenter = length(modelPosition.xz);

    //? the higher the 'distanceToCenter' the lower '(1.0 / distanceToCenter)' , but always increasing on time
    float angleOffset = (1.0 / distanceToCenter) * uTime * 0.2; 
    angle += angleOffset;

    //? update the model positión according to the angle and the distance
    modelPosition.x = cos(angle) * distanceToCenter;
    modelPosition.z = sin(angle) * distanceToCenter;

    // * randomnes 
    //? randomnes'modelPosition.xyz' cause aRandomness is a vec3
    modelPosition.xyz += aRandomness;

    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;

    gl_Position = projectedPosition;

    // * PARTICLE POSITION
    // *Size
    //? gl_PointSize=2.0; The particles will have a 2x2 size, and you should see 2x2 particlesregardless of the distance of the camera.

    gl_PointSize = uSize * aScale;

    //? from 'node_modules/three/src/renderers/shaders/ShaderLib/points.glsl.js', to change size according to camera distance
    gl_PointSize *= (1.0 / -viewPosition.z); 

    // * Varyings
    vColor = color;
}