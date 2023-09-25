//EXAMPLE OF SPHERE

//Files with predefined colors and textures
#include "colors.inc"
#include "glass.inc"
#include "golds.inc"
#include "metals.inc"
#include "stones.inc"
#include "woods.inc"
#include "graph3d.inc"

global_settings { ambient_light White }



#declare f1 = function(x, z) { exp(-pow(x,2) - pow(z,2)) }
#declare f2 = function(x, z) { f1(x-1, z+1) }

compute_graph(f1, -2,2,-2,2,81,81)
object {
    _mesh
    texture{
        pigment {
            gradient y
            frequency 4
            colour_map{[0 rgb 0][0.1 rgbt <1,1,1,1>]}
            scale 0.5
        }      
    }
}

// union {
//     grid_lines(0, 4, 0.02)
//     grid_lines(1, 4, 0.02)
//     texture {
//         Red
//     }
// }

compute_graph(f2, -2,2,-2,2,81,81)

object {
    _mesh
    texture{
        pigment {
            gradient y
            frequency 4
            colour_map{[0 rgb 0][0.1 rgbt <1,1,1,0>]}
            scale 0.5
        }      
    }
}

// union {
//     grid_lines(0, 4, 0.02)
//     grid_lines(1, 4, 0.02)
//     texture {
//         Blue
//     }
// }



camera {
    location <20, 10, 20> * 0.3
    look_at <0, 5, 0> * 0.3
}
light_source { <50, 50, 50> color rgb<1, 1, 1> }

background { color White }