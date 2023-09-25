#include "colors.inc"
#include "graph3d.inc"

global_settings { ambient_light White }



background { color White }

#declare _mesh = mesh {
    smooth_triangle{
        <1,0,0>, <1,0,0>, <0,1,0>, <0,1,0>, <0,0,1>, <0,0,1>
    }
    smooth_triangle{
        <-1,0,0>, <-1,0,0>, <0,1,0>, <0,1,0>, <0,0,1>, <0,0,1>
    }
    smooth_triangle{
        <-1,0,0>, <-1,0,0>, <0,1,0>, <0,1,0>, <0,0,-1>, <0,0,-1>
    }
    smooth_triangle{
        <1,0,0>, <1,0,0>, <0,1,0>, <0,1,0>, <0,0,-1>, <0,0,-1>
    }
}

#declare f = function(x, z) { exp(-pow(x,2) - pow(z,2)) }
compute_graph(f, -2,2,-2,2,21,21)

object {
    _mesh
    texture {
        pigment {
            gradient y
            frequency 4
            colour_map{[0 rgb 0][0.1 rgbt <1,1,1,0.5>]}
            scale 0.5
        }
    }
}

#declare g = function(x, z) { f (x+1, z-1) }
compute_graph(g, -2,2,-2,2,21,21)

object {
    _mesh
    texture {
        pigment {
            gradient y
            frequency 4
            colour_map{[0 rgb 0][0.1 rgbt <1,0,1,0.5>]}
            scale 0.5
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
    location <10, 10, 2> * 0.3
    look_at <0, 0, 0> * 0.3
}

light_source { <10, 10, 10> color rgb<1, 1, 1> }
