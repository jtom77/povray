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
            [w rgbf clr]
            [1-w rgbf clr]
            [1-w rgb 0]
        }
        scale scl
    }
#end

#declare obj_diff = difference{
    union{
        isosurface{
            function{ sin(x * z) + y }
            max_gradient 4
            open
            contained_by { box { <-5,-5,-5>, <5,5,5> } } 
            texture {grid(y, 0.05, 0.25, <0,1,1,0.4>)}
            // texture {grid(z, 0.05, 0.25, <1,1,1,0.1>)}
            // texture {grid(x, 0.05, 0.5, <1,1,0,1>)}
            no_shadow
            finish { ambient 0.2 diffuse 1 }
        }
        isosurface{
            function{ cos(x) * sin(z) + y }
            max_gradient 4
            open
            contained_by { box { <-5,-5,-5>, <5,5,5> } } 
            texture {grid(y, 0.05, 0.25, <1,1,0,0.1>)}
            // texture {grid(z, 0.05, 0.25, <1,1,0,0.1>)}
            // texture {grid(x, 0.05, 0.5, <1,1,0,1>)}
            no_shadow
            finish { ambient 0.2 }
        }
    }
    cylinder{ <0,-2,0>, <0,8,0>, 0.01 
        texture {
            pigment { 
                color rgbt <1,1,1,1> 
            }
        }
    }
}


// intersection {
//     cylinder{ <0,-2,0>, <0,8,0>, 3 }
//     object {obj_diff}  
//     texture {pigment {color rgb <1,0,0> }}
// }

obj_diff

// object {
//     obj_diff
//     scale <1,0.8,1>
// }


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
