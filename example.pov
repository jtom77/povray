//EXAMPLE OF SPHERE

//Files with predefined colors and textures
#include "colors.inc"
#include "glass.inc"
#include "golds.inc"
#include "metals.inc"
#include "stones.inc"
#include "woods.inc"

//Place the camera
camera {
  sky <0,0,1>           //Don't change this
  direction <-1,0,0>    //Don't change this  
  right <-4/3,0,0>      //Don't change this
  location <30,10,1.5> //Camera location
  look_at <0,0,0>     //Where camera is pointing
  angle 15      //Angle of the view--increase to see more, decrease to see less
}

//Ambient light to "brighten up" darker pictures
global_settings { ambient_light White }

//Place a light--you can have more than one!
light_source {
  <10,-10,20>   //Change this if you want to put the light at a different point
  color White*2         //Multiplying by 2 doubles the brightness
}

//Set a background color
background { color White }



//Sphere with specified center point and radius
//The texture comes from the file "stones.inc"


  #declare Red = texture {
    pigment { color rgb<0.8, 0.2, 0.2> }
    finish { ambient 0.2 diffuse 0.5 }
  }
  #declare Green = texture {
    pigment { color rgb<0.2, 0.8, 0.2> }
    finish { ambient 0.2 diffuse 0.5 }
  }
  #declare Blue = texture {
    pigment { color rgb<0.2, 0.2, 0.8> }
    finish { ambient 0.2 diffuse 0.5 }
  }


 camera {
    location <20, 20, -10>
    look_at <0, 5, 0>
  }
  light_source { <50, 50, -50> color rgb<1, 1, 1> }

  #declare _points = array[10][10];
  #declare _i = 0;
  #while (_i < 10)
    #declare _j = 0;
    #while (_j < 10)
      #declare _points[_i][_j] = <_i,_i,_j>;
      #declare _j = _j + 1;
      #end
    #declare _i = _i + 1;
  #end
  


  #declare fun = function(x, z) { sin(x) * cos(z) }
  #declare fdx = function(x, z) { cos(x) * cos(z) }
  #declare fdz = function(x, z) { -sin(x) * sin(z) }

  #macro make_triangle(X, Z, stp) 
        
        #declare _A = <X, fun(X, Z), Z>;
        #declare _B = <X+stp, fun(X+stp, Z), Z>;
        #declare _C = <X, fun(X, Z+stp), Z+stp>;

        #declare _Ax = <1, fdx(X, Z), 0>;
        #declare _Az = <0, fdz(X, Z), 1>;
        #declare _Bx = <1, fdx(X+stp, Z), 0>;
        #declare _Bz = <0, fdz(X+stp, Z), 1>;
        #declare _Cx = <1, fdx(X+stp, Z+stp), 0>;
        #declare _Cz = <0, fdz(X+stp, Z+stp), 1>;

        smooth_triangle { _A, vcross(_Ax, _Az), _B, vcross(_Bx, _Bz), _C, vcross(_Cx, _Cz)}
  
  #end

  #declare funclr = color rgb<0, 1, 0>;

  #macro draw_mesh()
    mesh{
      #declare Z = -5;  // start value Z
      #declare EndZ = 5;  //   end value Z
      #declare Step = 0.1;// step value
      // loop start Z:
      #while ( Z < EndZ + Step)

        #declare X = -5;  // start value X
        #declare EndX = 5;//   end value X
        //loop start X:
        #while ( X < EndX + Step)

          make_triangle(X,Z,Step)
          make_triangle(X+Step,Z+Step,-1*Step)

        #declare X = X + Step;//next X
      #end // ----------- loop end X

      #declare Z = Z + Step; //next Z
      #end // ------------ loop end Z

      texture {pigment { funclr }}
    }
  #end


  draw_mesh()

  #undef fun
  #undef fdx
  #undef fdz
  #declare fun = function(x, z) { 2 * exp( - (x*x  + z*z) ) }
  #declare fdx = function(x, z) { - 4 * x * fun(x,z) }
  #declare fdz = function(x, z) { - 4 * z * fun(x,z) }

  #declare funclr = color rgb<1, 1, 0>;

  draw_mesh()


