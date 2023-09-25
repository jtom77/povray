#include "colors.inc"
#include "graph3d.inc"

global_settings { ambient_light White }



background { color White }
#declare f = function(x, z) { exp(-pow(x,2) - pow(z,2)) }
#declare g = function(x, z) { f (x+1, z-1) }


#macro grid(dir, w, scl, clr)
    pigment {
        gradient dir
        colour_map{
            [0 rgb 0]
            [w rgb 0]
            [w rgbt clr]
        }
        scale scl
    }
#end

difference{
    union{
isosurface{
    function{ sin(x * z) + y }
    max_gradient 4
    open
    contained_by { box { <-5,-5,-5>, <5,5,5> } } 
    texture {grid(z, 0.05, 0.25, <1,1,1,0.1>)}
    texture {grid(x, 0.05, 0.5, <1,1,0,1>)}
    no_shadow
}
isosurface{
    function{ sin(x+z) - y }
    max_gradient 4
    open
    contained_by { box { <-5,-5,-5>, <5,5,5> } } 
    texture {grid(z, 0.05, 0.25, <1,1,0,0.1>)}
    texture {grid(x, 0.05, 0.5, <1,1,0,1>)}
    no_shadow
}
    }
    box{ -2, 2 
        texture {
            pigment { color rgbt <1,1,1,1> }
        }
    }
}


union{
    cylinder{
        <0,0,0>, <2,0,0>, 0.1
    }
    cylinder{
        <0,0,0>, <0,2,0>, 0.1
    }
    cylinder{
        <0,0,0>, <0,0,2>, 0.1
    }
}

camera {
    location <10, 7, 1> * 1
    look_at <0, 0, 0> * 0.3
}

light_source { <10, 10, 10> * 3 color rgb<1, 1, 1> }
