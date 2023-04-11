//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vScreenPos;

uniform vec4 u_fLightPositionRadius; 
uniform vec2 u_fPlayerPosition;
uniform float u_fTime;


void main()
{
    // Work out vector from room location to the light
    vec2 mouse = vec2(v_vScreenPos.x - u_fLightPositionRadius.x, v_vScreenPos.y - u_fLightPositionRadius.y);
	vec2 vect = vec2(v_vScreenPos.x - u_fPlayerPosition.x, v_vScreenPos.y - u_fPlayerPosition.y);
	
    // work out the length of this vector
    float dist = sqrt(vect.x * vect.x + vect.y * vect.y);

    // set the radius of the arc
    float radius = u_fLightPositionRadius.z;

    // set the angle of the arc
    float angle = radians(360.);

    // calculate the angle between the vector and the x-axis
    float theta = atan(vect.y, vect.x) ;//* sin(radians(u_fTime/2.0));
	
    // if the distance is less than the radius and the angle is within the arc
	
	
    if (dist < radius && theta >= -angle && theta <= angle) {
        // use the shadow texture
        gl_FragColor = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
    } else {
        // otherwise, it's black
        gl_FragColor = vec4(0.0, 0.0, 0.0, 1.0);
    }

    gl_FragColor.a *= 0.56;
}
