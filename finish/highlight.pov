#include "colors.inc"

/**
    Highlights are are the cause for the little 'hotspots' on a surface.

    There are two ways of specifying surface highlights.
    - Phong highlights (controlled by the keywords 'phong' and 'phong_size')
    - Specular highlights (controlled by the keywords 'specular' and 'roughness')
 */
plane {
    y, -1.5
    pigment {checker Green, White}
}

sphere {
    <0,0,-2>, 1
    pigment { Gray75 }
    finish {
        phong .75
        phong_size 25
    }
}

sphere {
    <0,0,0>, 1
    pigment { Gray75 }
    finish {
        phong .75
        phong_size 150
    }
}

sphere {
    <0,0,2>, 1
    pigment { Gray75 }
    finish {        
        specular .75
        roughness .1
    }
}

sphere {
    <0,0,4>, 1
    pigment { Gray75 }
    finish {
        specular .75
        roughness 0.001
    }
}

camera {
    location <10, 0, 0> * 1
    look_at <0, 0, 0> * 0.3
}

light_source { <10, 10, 0> * 3 color rgb<1, 1, 1> }