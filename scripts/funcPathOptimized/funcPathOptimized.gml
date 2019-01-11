/// @description funcPathOptimized(id,gridSize,obstacle)
/// @param id
/// @param gridSize
/// @param obstacle
var id_= argument[0];
var ts = argument[1];
var i;

for(i=0;i<path_get_number(id_)-2;i++)
{
    var px1=path_get_point_x(id_,i);
    var py1=path_get_point_y(id_,i);
    var px2=path_get_point_x(id_,i+2);
    var py2=path_get_point_y(id_,i+2);
    
    //if(!collision_line(
    //    px1-gridSize,py1-gridSize,
    //    px2-gridSize,py2-gridSize,
    //    obstacle,false,false) &&
    
    //!collision_line(
    //    px1+gridSize-1,py1-gridSize,
    //    px2+gridSize-1,py2-gridSize,
    //    obstacle,false,false) &&
    
    //!collision_line(
    //    px1+gridSize-1,py1+gridSize-1,
    //    px2+gridSize-1,py2+gridSize-1,
    //    obstacle,false,false) &&
    
    //!collision_line(
    //    px1-gridSize,py1+gridSize-1,
    //    px2-gridSize,py2+gridSize-1,
    //    obstacle,false,false))
	
	var tx1 = px1/ts;
	var ty1 = py1/ts;
	var tx2 = px2/ts;
	var ty2 = py2/ts;
	
	if (!sFOW_Bresenhams(tx1-1, ty1-1, tx2-1, ty2-1, ts) &&
		!sFOW_Bresenhams(tx1+1, ty1-1, tx2+1, ty2-1, ts) &&
		!sFOW_Bresenhams(tx1+1, ty1+1, tx2+1, ty2+1, ts) &&
		!sFOW_Bresenhams(tx1-1, ty1+1, tx2-1, ty2+1, ts))
    {
        path_delete_point(id_,i+1); i--;
    }
}