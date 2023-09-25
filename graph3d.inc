
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



#macro compute_graph(fun, _xstart, _xstop, _ystart, _ystop, NX, NY)
    
    #declare _NX = NX;
    #declare _NY = NY;

    #declare _xstp = (_xstop - _xstart) / _NX;
    #declare _ystp = (_ystop - _ystart) / _NY;

    #declare _p = array[_NX][_NY];
    #declare _pnorm = array[_NX][_NY];
    #declare _delta = 0.0001;

    #declare _i = 0;
    #while (_i < _NX)
        #declare _x = _xstart + _xstp * _i;
        #declare _j = 0;
        #while (_j < _NY)
            #declare _z = _ystart + _ystp * _j;
            #declare _p[_i][_j] = <_x,fun(_x,_z),_z>;        
            
            #declare _dx = vnormalize(<_x+_delta,fun(_x+_delta,_z),_z> - _p[_i][_j]); 
            #declare _dz = vnormalize(<_x,fun(_x,_z+_delta),_z+_delta> - _p[_i][_j]);
            #declare _pnorm[_i][_j] = vcross(_dx, _dz);

            #declare _j = _j + 1;
        #end
        #declare _i = _i + 1;
    #end

    #declare _mesh = mesh{
        #declare _i = 0; 

        #while ( _i < _NX-1 )

            #declare _j = 0;
            #while ( _j < _NY-1 )

                smooth_triangle{ 
                    _p[_i][_j], _pnorm[_i][_j], 
                    _p[_i+1][_j], _pnorm[_i+1][_j], 
                    _p[_i][_j+1], _pnorm[_i][_j+1]
                }
                    smooth_triangle{ 
                    _p[_i+1][_j+1], _pnorm[_i+1][_j+1], 
                    _p[_i+1][_j], _pnorm[_i+1][_j], 
                    _p[_i][_j+1], _pnorm[_i][_j+1]
                }

                #declare _j = _j + 1;
            #end 

            #declare _i = _i + 1; 
        #end 
    }

#end


#macro grid_lines(idx, stp, w)
    #declare i=0;
    #if (idx = 0)
        #declare na = _NX;
        #declare nb = _NY;
    #else 
        #declare na = _NY;
        #declare nb = _NX;
    #end        
    #while (i < na)
        #declare j=0;
        #while(j < nb - 1)
            #if (idx = 0)
                cylinder{ _p[i][j], _p[i][j+1], w}
            #else 
                cylinder{_p[j][i], _p[j+1][i], w}
            #end
            #declare j = j+1;
        #end
        #declare i=i+stp;
    #end
#end


// #declare wire = object{
//     _mesh
//     texture{
//         pigment {
//             gradient x
//             colour_map{[0 rgb 0][0.1 rgb 1]}
//             scale 0.5
//         }      
//     }
//     texture {
//         pigment {
//             gradient z
//             colour_map{[0 rgb 0][0.1 rgbt <0,0,0,1>]}
//             scale 0.5
//         }
//     }
// }
