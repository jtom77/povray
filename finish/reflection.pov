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
    <0,0,-4>, 1
    pigment { Gray75 }
    finish {
        ambient .2
        diffuse .6
        specular .75
        roughness .001
        reflection {
            .75
        }
    }
}

sphere {
    <0,0,-2>, 1
    pigment { Gray75 }
    finish {
        ambient .1
        diffuse .1
        specular .75
        roughness .001
        reflection {
            .75
        }
    }
}


sphere {
    <0,0,0>, 1
    pigment { BrightGold }
    finish {
        ambient .1
        diffuse .1
        specular .75
        roughness .001
        reflection {
            .75
        }
    }
}

sphere {
    <0,0,2>, 1
    pigment { BrightGold }
    finish {
        ambient .1
        diffuse .1
        specular .75
        roughness .001
        reflection {
            .75
            metallic
        }
    }
}

sphere {
    <0,0,4>, 1
    pigment { BrightGold }
    finish {
        ambient .1
        diffuse .1
        specular .75
        roughness .001
        metallic
        reflection {
            .75
            metallic
        }
    }
}

sphere {
    <4,-1,0>, 0.5
    pigment { Red }
}

camera {
    location <10, 0, 0> * 1
    look_at <0, 0, 0> * 0.3
}

light_source { <10, 5, 0>  color rgb<1, 1, 1> }