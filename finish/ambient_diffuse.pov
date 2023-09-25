#include "colors.inc"

/**
    Test a view finishes

     - Ambient is used to simulate the light that is scattered around the scene that does not come directly from a light source.
     - Diffuse determines how much of the light that is seen comes directly from a light source
 */
plane {
    y, -1.5
    pigment {checker Green, White}
}

sphere {
    <0,0,-2>, 1
    pigment { Gray75 }
    finish {
        ambient 0 // no light is scattered, portions in the shadow appear black 
        diffuse 1 // all light from the source is reflected to the camera
    }
}

sphere {
    <0,0,0>, 1
    pigment { Gray75 }
    finish {
        // default povray settings
        ambient .2 
        diffuse .6
    }
}

sphere {
    <0,0,2>, 1
    pigment { Gray75 }
    finish {        
        ambient .3 // default ambient setting
        diffuse .1 // almost no light from the source is reflected to the camera 
    }
}

sphere {
    <0,0,4>, 1
    pigment { Gray75 }
    finish {
        ambient .5 // shadowed portions appear very bright
        diffuse 1 // all light from the source is reflected to the camera
    }
}

camera {
    location <10, 0, 0> * 1
    look_at <0, 0, 0> * 0.3
}

light_source { <10, 10, 0> * 3 color rgb<1, 1, 1> }