/// @description  Draws circle
/// @arg x,y,r,color,alpha
/// draw_shape_circle(x,y,r,color,alpha)
function draw_shape_circle(argument0, argument1, argument2, argument3, argument4) {

	var _x = argument0, _y = argument1,
	    _r = argument2,
	    _c = argument3, _a = argument4;

	var _precision = 16,
	    _angle = 0, _sep = 360 / _precision;
    
	draw_primitive_begin(pr_trianglelist);

	for (var i = 0; i < _precision; i++)
	{
	    draw_vertex_colour(_x, _y, _c, _a);
    
	    draw_vertex_colour(
	        _x + lengthdir_x(_r, _angle), 
	        _y + lengthdir_y(_r, _angle), 
	        _c, _a);
    
	    _angle += _sep;
    
	    draw_vertex_colour(
	        _x + lengthdir_x(_r, _angle), 
	        _y + lengthdir_y(_r, _angle), 
	        _c, _a);
	}

	draw_primitive_end();



}
